""" MDE - Modelação de Dados em Engenharia
Turno: P4

João Pedro Espanhol Nogueira - 57574 - jp.nogueira@campus.fct.unl.pt
Tiago Capelo Monteiro - 63368 - tca.monteiro@campus.fct.unl.pt
Sander Edgar José Almeirão  - 66761 - s.almeirao@campus.fct.unl.pt

Instalar dependencias para ficheiros python:
pip install mysql-connector-python pandas sqlalchemy scikit-learn
"""

import pandas as pd
from sqlalchemy import create_engine
from sklearn.model_selection import train_test_split
from sklearn.neural_network import MLPClassifier
from sklearn.svm import SVC
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score

def load_data():
    engine = create_engine('mysql+mysqlconnector://root:mde@localhost/trabalho')

    query = """
        SELECT soil_moisture, temperature, air_quality_index, irrigation_efficiency_index
        FROM sensor_readings
        WHERE irrigation_efficiency_index IS NOT NULL
    """

    df = pd.read_sql(query, engine)

    # Binary classification: 1 = efficient, 0 = inefficient
    df['target'] = df['irrigation_efficiency_index'].apply(lambda x: 1 if x >= 0.7 else 0)

    X = df[['soil_moisture', 'temperature', 'air_quality_index']]
    y = df['target']
    
    return train_test_split(X, y, test_size=0.3, random_state=42)

# Train and evaluate Multi layer perceptron
def run_mlp(X_train, X_test, y_train, y_test):
    model = MLPClassifier(hidden_layer_sizes=(50,), max_iter=10000, random_state=42)
    model.fit(X_train, y_train)
    preds = model.predict(X_test)
    acc = accuracy_score(y_test, preds)
    print(f"🔵 MLP Accuracy: {acc:.2f}")

# Train and evaluate Suppor Vector Machine
def run_svm(X_train, X_test, y_train, y_test):
    model = SVC(kernel='rbf', C=1.0, gamma='scale')
    model.fit(X_train, y_train)
    preds = model.predict(X_test)
    acc = accuracy_score(y_test, preds)
    print(f"🟣 SVM Accuracy: {acc:.2f}")

# Train and evaluate Logistic Regression
def run_glm(X_train, X_test, y_train, y_test):
    model = LogisticRegression(max_iter=1000)
    model.fit(X_train, y_train)
    preds = model.predict(X_test)
    acc = accuracy_score(y_test, preds)
    print(f"🟢 Logistic Regression Accuracy: {acc:.2f}")

# Main function to run all models
def run_all_models():
    X_train, X_test, y_train, y_test = load_data()
    
    print("\nRunning models on sensor data:\n")
    run_mlp(X_train, X_test, y_train, y_test)
    run_svm(X_train, X_test, y_train, y_test)
    run_glm(X_train, X_test, y_train, y_test)

if __name__ == '__main__':
    run_all_models()
