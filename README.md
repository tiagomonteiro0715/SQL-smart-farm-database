# SQL Farmers Database Project

## Project Overview

This was one of the projects from the class in NOVA FCT in the Eletrical and Computer Engineering Undergrad named: Modelation of Data in Engineering

We got a grade of 16 out of 20

The system manages farmers, crops, sensors, production records, and commercialization data with advanced features including IoT sensor integration and machine learning capabilities.

![Database schema](ttps://github.com/tiagomonteiro0715/SQL-smart-farm-database/blob/main/esquema.png)

## Project Structure

```
├── final_sql_file.sql          # Complete SQL database schema and operations
├── sql_code.py                 # Python interface for database queries
├── ml_code.py                  # Machine learning models for irrigation efficiency
├── esquema.png                 # Database schema diagram
├── final.mwb                   # MySQL Workbench model file
├── MDE_2024_25_Lab1.pdf        # Project requirements document
└── README.md                   # This file
```

## Key Features

### Database Management
- **Complete CRUD Operations** for all entities
- **Stored Procedures** for complex queries
- **Triggers** for automated alerts
- **Data Integrity** with proper relationships

### IoT Integration
- **Sensor Management** for temperature, soil moisture, air quality
- **Real-time Monitoring** of agricultural conditions
- **Automated Alerts** for adverse conditions
- **Irrigation Efficiency** tracking

### Analytics & Reporting
- **Production Analytics** with yield tracking
- **Commercialization Reports** with revenue analysis
- **Agricultural Efficiency** metrics
- **Resource Usage** monitoring

### Machine Learning
- **Irrigation Efficiency Prediction** using sensor data
- **Multiple ML Models** (MLP, SVM, Logistic Regression)
- **Data-driven Insights** for agricultural optimization

## Database Schema

### Core Entities

1. **Producers** (`productors`) - Farmer information and cultivated areas
2. **Distributors** (`distributors`) - Distribution partners and storage capacity
3. **Crops** (`crops`) - Agricultural crops with planting/harvest dates
4. **Sensors** (`sensors`) - IoT devices for environmental monitoring
5. **Sensor Readings** (`sensor_readings`) - Real-time sensor data
6. **Alerts** (`alerts`) - Automated notifications for adverse conditions
7. **Treatments** (`treatments`) - Agricultural treatments and supplies
8. **Production Records** (`production_record`) - Harvest and yield data
9. **Commercialization** (`commercialization_registration`) - Sales and revenue tracking
10. **Billing** (`billing`) - Invoice management

### Key Relationships
- Producers ↔ Crops (One-to-Many)
- Crops ↔ Sensors (One-to-Many)
- Sensors ↔ Sensor Readings (One-to-Many)
- Crops ↔ Production Records (One-to-Many)
- Production ↔ Commercialization (One-to-Many)

## Installation & Setup

### Prerequisites
- MySQL Server 8.0+
- Python 3.8+
- MySQL Workbench (optional, for schema visualization)

### Database Setup
1. **Create Database:**
   ```sql
   CREATE DATABASE trabalho;
   USE trabalho;
   ```

2. **Run SQL Script:**
   ```bash
   mysql -u root -p < final_sql_file.sql
   ```

### Python Dependencies
```bash
pip install mysql-connector-python pandas sqlalchemy scikit-learn
```

## Usage Examples

### Database Operations

#### View Crops by Producer
```python
# Using sql_code.py
python sql_code.py
# Select option 1 and enter producer ID
```

#### Check Average Temperature per Crop
```python
# Using sql_code.py
python sql_code.py
# Select option 2
```

### Machine Learning Analysis
```python
# Run ML models on sensor data
python ml_code.py
```

### SQL Queries

#### Get Producer Crop History
```sql
CALL GetProducerCropHistory(1, '2025-03-01', '2025-03-30');
```

#### View Top Selling Producers
```sql
CALL GetTopSellingProducers();
```

#### Agricultural Efficiency Report
```sql
CALL GetAgriculturalEfficiencyReport();
```

## Key Functionalities (RF - Requirements)

### RF1: Basic CRUD Operations
- Complete Create, Read, Update, Delete operations for all entities
- Proper data validation and integrity constraints

### RF2: Production Value Recording
- Track production quantities, quality, and marketing data
- Comprehensive production analytics

### RF3: Automated Alerts
- **Low Irrigation Efficiency** (< 0.75)
- **High Temperature** (> 30°C)
- **Low Soil Moisture** (< 20)
- **Poor Air Quality** (< 0.20)
- **Extremely High Temperature** (> 45°C)

### RF4: Producer Crop History
- Historical view of crops by producer and time period
- Planting and harvest date tracking

### RF5: Top Selling Producers
- Analytics on producer performance
- Revenue and volume tracking

### RF6: Treatment Inventory
- Current status of treatments and supplies
- Usage tracking and management

### RF7: IoT Sensor Data Processing
- Real-time sensor data extraction
- Environmental monitoring and analysis

### RF8: Agricultural Efficiency Reports
- Comprehensive efficiency metrics
- Resource usage optimization

### RF9: Distributor Feedback
- Quality monitoring system
- Customer satisfaction tracking

### RF10: Producer Crop Listing
- Complete crop inventory by producer
- Status and yield information

### RF11: Temperature Analytics
- Average temperature per crop
- Environmental monitoring

### RF12: Automated Irrigation Alerts
- Threshold-based irrigation efficiency monitoring
- Proactive alert system

## Machine Learning Features

The project includes advanced ML capabilities for irrigation efficiency prediction:

- **Multi-Layer Perceptron (MLP)** - Neural network for pattern recognition
- **Support Vector Machine (SVM)** - Classification of efficiency levels
- **Logistic Regression** - Binary classification of irrigation efficiency

### ML Model Performance
Models are trained on sensor data including:
- Soil moisture levels
- Temperature readings
- Air quality indices
- Irrigation efficiency metrics

## Documentation

- **Schema Diagram:** `esquema.png` - Visual database structure
- **SQL Script:** `final_sql_file.sql` - Complete database implementation
- **Requirements:** `MDE_2024_25_Lab1.pdf` - Project specifications


## Credits

[Joao Pedro Espanhol Nogueira](https://www.linkedin.com/in/joaoespnogueira) - jp.nogueira@campus.fct.unl.pt

[Tiago Capelo Monteiro](https://www.linkedin.com/in/tiago-monteiro-) - tca.monteiro@campus.fct.unl.pt

[Sander Edgar Jose Almeirão](https://www.linkedin.com/in/sander-almeir%C3%A3o-07b1ba2b8) - s.almeirao@campus.fct.unl.pt

