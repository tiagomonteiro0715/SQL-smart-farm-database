""" MDE - Modelação de Dados em Engenharia
Turno: P4

João Pedro Espanhol Nogueira - 57574 - jp.nogueira@campus.fct.unl.pt
Tiago Capelo Monteiro - 63368 - tca.monteiro@campus.fct.unl.pt
Sander Edgar José Almeirão  - 66761 - s.almeirao@campus.fct.unl.pt

Instalar dependencias para ficheiros python:
pip install mysql-connector-python pandas sqlalchemy scikit-learn
"""
import mysql.connector

# Function to connect to the database
def connect():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="",      
        database="trabalho",
    )

# RF10: View all crops planted by a specific producer
def view_crops_by_producer():
    producer_id = int(input("Enter the producer ID: "))
    conn = connect()
    cursor = conn.cursor()

    cursor.callproc('GetProducerCrops', [producer_id])

    for result in cursor.stored_results():
        print("\nCrops found:")
        for row in result.fetchall():
            print(row)

    cursor.close()
    conn.close()

# RF11: View average temperature per crop
def view_average_temperature():
    conn = connect()
    cursor = conn.cursor()

    cursor.callproc('GetAverageTemperaturePerCrop')

    for result in cursor.stored_results():
        print("\nAverage temperature per crop:")
        for row in result.fetchall():
            print(row)

    cursor.close()
    conn.close()

def main_menu():
    while True:
        print("\n--- MAIN MENU ---")
        print("1. View crops by producer (RF10)")
        print("2. View average temperature per crop (RF11)")
        print("3. Exit")

        choice = input("Choose an option: ")

        if choice == '1':
            view_crops_by_producer()
        elif choice == '2':
            view_average_temperature()
        elif choice == '3':
            print("Exiting the program.")
            break
        else:
            print("Invalid option. Please try again.")

# Start the application
if __name__ == '__main__':
    main_menu()
