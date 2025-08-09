/* MDE - Modelação de Dados em Engenharia
Turno: P4

João Pedro Espanhol Nogueira - 57574 - jp.nogueira@campus.fct.unl.pt
Tiago Capelo Monteiro - 63368 - tca.monteiro@campus.fct.unl.pt
Sander Edgar José Almeirão  - 66761 - s.almeirao@campus.fct.unl.pt
*/

USE trabalho;
/* -------------------------------------------------------
   CRUD Order for Database Schema
   -------------------------------------------------------
   
   Order:
  1. Producers
  2. Distributors
  3. Productor-Distributor Associations
  4. Distributor Feedback
  5. Crops
  6. Sensors
  7. Sensor Readings
  8. Alerts 
  9. Treatments
  10. Historical Treatments
  11. Production Records 
  12. Commercialization Registration 
  13. Billing
  ------------------------------------------------------- */

/* 1. Producers */
INSERT INTO productors (producer_id, productor_name, NIF, address, phone_number, cultivated_area_m2)
VALUES (1, 'Produtor A', 123456789, 'Rua A, nº 10', '912345678', 500);

SELECT * FROM productors;

UPDATE productors
SET phone_number = '987654321'
WHERE producer_id = 1;

DELETE FROM productors;

/* 2. Distributors */
INSERT INTO distributors (distributor_id, distributor_name, location, storage_capacity, purchase_history)
VALUES (301, 'Distribuidor A', 'Lisboa', 1500.00, 'Histórico A');

SELECT * FROM distributors;

UPDATE distributors
SET storage_capacity = 1800.00
WHERE distributor_id = 301;

DELETE FROM distributors;

/* 3. Productor-Distributor Associations */
INSERT INTO productors_distributors (producer_id, distributor_id)
VALUES (1, 301);

SELECT * FROM productors_distributors;

DELETE FROM productors_distributors;

/* 4. Distributor Feedback */
INSERT INTO distributor_feedback (feedback_id, distributors_distributor_id, feedback_date, comments)
VALUES (701, 301, '2025-09-10', 'Entrega dentro do prazo, bom atendimento.');

SELECT * FROM distributor_feedback;

UPDATE distributor_feedback
SET comments = 'Excelente qualidade dos produtos e comunicação eficaz.'
WHERE feedback_id = 701;

DELETE FROM distributor_feedback;


/* 5. Crops */
INSERT INTO crops (crop_id, producer_id, culture_type, plantation_date, harvest_date, expected_yield, agricultural_practices, crop_aera_m2, status)
VALUES (101, 1, 'Milho', '2025-03-01', '2025-08-30', 5000.00, 'Rotação de culturas', 1000, 'Planted');

SELECT * FROM crops;

UPDATE crops
SET expected_yield = 5500.00
WHERE crop_id = 101;

DELETE FROM crops;

/* 6. Sensors */
INSERT INTO sensors (sensor_id, crop_id, sensor_type, installation_date)
VALUES (701, 101, 'Temperatura', '2025-03-05');

SELECT * FROM sensors;

UPDATE sensors
SET installation_date = '2025-03-10'
WHERE sensor_id = 701;

DELETE FROM sensors;

/* 7. Sensor Readings */
INSERT INTO sensor_readings (reading_id, sensor_id, reading_time, soil_moisture, temperature, air_quality_index, irrigation_efficiency_index)
VALUES (901, 701, '2025-04-10 09:30:00', 30, 22, 0.7, 0.4);

SELECT * FROM sensor_readings;

UPDATE sensor_readings
SET temperature = 23.0
WHERE reading_id = 901;

DELETE FROM sensor_readings;

/* 8. Alerts */
INSERT INTO alerts (alert_id, sensor_id, alert_type, triggered_condition, alert_time, resolved)
VALUES (1001, 701, 'Temperatura Elevada', '>30°C', '2025-04-10 10:00:00', 0);

SELECT * FROM alerts;

UPDATE alerts
SET resolved = 1
WHERE alert_id = 1001;

DELETE FROM alerts;

/* 9. Treatments */
INSERT INTO treatments (treatment_id, treatment_name, treatment_type, unit_measure, supplier)
VALUES (201, 'Fertilizante NPK', 'Fertilização', 'kg', 'Fornecedor X');

SELECT * FROM treatments;

UPDATE treatments
SET treatment_type = 'Fertilização Avançada'
WHERE treatment_id = 201;

DELETE FROM treatments;

/* 10. Historical Treatments */
INSERT INTO historical_treatments (history_id, crop_id, treatment_id, application_date, quantity_used)
VALUES (801, 101, 201, '2025-04-10', 100.00);

SELECT * FROM historical_treatments;

UPDATE historical_treatments
SET quantity_used = 120.00
WHERE history_id = 801;

DELETE FROM historical_treatments;

/* 11. Production Records */
INSERT INTO production_record (production_id, crops_crop_id, collection_date, quantity_produced, product_quality)
VALUES (401, 101, '2025-08-30', 4800.00, 'Alta');

SELECT * FROM production_record;

UPDATE production_record
SET product_quality = 'Muito Alta'
WHERE production_id = 401;

DELETE FROM production_record;

/* 12. Commercialization Registration */
INSERT INTO commercialization_registration (
    commercialization_id, production_id, distributor_id, commercialization_registrationcol, unit_price, volume_sold, total_revenue, logistics_costs, market_demand
)
VALUES (501, 401, 301, 'Registro Comercial A', 2, 4800.00, 12000.00, 300, 'Alta');

SELECT * FROM commercialization_registration;

UPDATE commercialization_registration
SET unit_price = 2
WHERE commercialization_id = 501;

DELETE FROM commercialization_registration;

/* 13. Billing */
INSERT INTO billing (invoice_id, commercialization_id, billingcol, invoice_date, total_volume, total_value, invoice_status)
VALUES (601, 501, 'Faturação A', '2025-09-05', 4800.00, 13200.00, 'issued');

SELECT * FROM billing;

UPDATE billing
SET invoice_status = 'paid'
WHERE invoice_id = 601;

DELETE FROM billing;
/* End of CRUD */
/* --------------------------------------------------------------------------------------------
------------------------------- RFs - Registar valores de produções ---------------------------
----------------------------------------------------------------------------------------------- */
-- RF2: Record values from production (quantity, quality, marketing, etc.)


INSERT INTO productors (producer_id, productor_name, NIF, address, phone_number, cultivated_area_m2)
VALUES (1, 'Produtor A', 123456789, 'Rua A, nº 10', '912345678', 500);

INSERT INTO distributors (distributor_id, distributor_name, location, storage_capacity, purchase_history)
VALUES (301, 'Distribuidor A', 'Lisboa', 1500.00, 'Histórico A');


INSERT INTO crops (crop_id, producer_id, culture_type, plantation_date, harvest_date, expected_yield, agricultural_practices, crop_aera_m2, status)
VALUES 
(103, 1, 'Tomate', '2025-03-01', '2025-08-01', 3900, 'Orgânico', 800, 'Harvested'),
(104, 1, 'Batata', '2025-03-15', '2025-08-20', 5100, 'Convencional', 900, 'Harvested'),
(105, 1, 'Alface', '2025-04-01', '2025-09-01', 4750, 'Orgânico', 700, 'Harvested'),
(106, 1, 'Cenoura', '2025-04-10', '2025-09-15', 4950, 'Convencional', 850, 'Harvested'),
(107, 1, 'Couve', '2025-04-20', '2025-09-25', 4100, 'Rotação', 600, 'Harvested'),
(108, 1, 'Abóbora', '2025-05-01', '2025-10-01', 4400, 'Orgânico', 1000, 'Harvested'),
(109, 1, 'Espinafre', '2025-05-10', '2025-10-10', 4600, 'Convencional', 650, 'Harvested'),
(110, 1, 'Pepino', '2025-05-20', '2025-10-20', 5000, 'Rotação', 700, 'Harvested'),
(111, 1, 'Berinjela', '2025-06-01', '2025-11-01', 4700, 'Orgânico', 750, 'Harvested'),
(112, 1, 'Pimentão', '2025-06-10', '2025-11-10', 4300, 'Convencional', 900, 'Harvested');


INSERT INTO production_record (production_id, crops_crop_id, collection_date, quantity_produced, product_quality)
VALUES 
(406, 103, '2025-08-15', 3900.00, 'Média'),
(407, 104, '2025-09-01', 5100.00, 'Alta'),
(408, 105, '2025-09-20', 4750.00, 'Muito Alta'),
(409, 106, '2025-10-05', 4950.00, 'Alta'),
(410, 107, '2025-10-15', 4100.00, 'Baixa'),
(411, 108, '2025-10-22', 4400.00, 'Alta'),
(412, 109, '2025-10-30', 4600.00, 'Média'),
(413, 110, '2025-11-05', 5000.00, 'Muito Alta'),
(414, 111, '2025-11-12', 4700.00, 'Alta'),
(415, 112, '2025-11-20', 4300.00, 'Média');

INSERT INTO commercialization_registration (
    commercialization_id, production_id, distributor_id, commercialization_registrationcol,
    unit_price, volume_sold, total_revenue, logistics_costs, market_demand
)
VALUES 
(506, 406, 301, 'Registro F', 7, 3900, 8190, 250, 'Média'),
(507, 407, 301, 'Registro G', 4, 5100, 14280, 340, 'Alta'),
(508, 408, 301, 'Registro H', 1, 4750, 14012, 355, 'Alta'),
(509, 409, 301, 'Registro I', 2, 4950, 12870, 310, 'Alta'),
(510, 410, 301, 'Registro J', 9, 4100, 7790, 220, 'Baixa'),
(511, 411, 301, 'Registro K', 1, 4400, 11000, 295, 'Alta'),
(512, 412, 301, 'Registro L', 8, 4600, 10810, 280, 'Média'),
(513, 413, 301, 'Registro M', 5, 5000, 13750, 330, 'Alta'),
(514, 414, 301, 'Registro N', 2, 4700, 11985, 300, 'Alta'),
(515, 415, 301, 'Registro O', 3, 4300, 9460, 260, 'Média');

INSERT INTO treatments (treatment_id, treatment_name, treatment_type, unit_measure, supplier)
VALUES 
(301, 'Fertilizante NPK', 'Fertilização', 'kg', 'AgroFert'),
(302, 'Inseticida BioX', 'Controle de Pragas', 'litros', 'EcoDefense'),
(303, 'Herbicida Verde', 'Controle de Ervas', 'litros', 'GreenGrow');

INSERT INTO sensors (sensor_id, crop_id, sensor_type, installation_date)
VALUES 
(201, 103, 'Clima', '2025-03-01'),
(202, 104, 'Solo', '2025-03-02'),
(203, 105, 'Clima', '2025-03-03'),
(204, 106, 'Irrigação', '2025-03-04'),
(205, 107, 'Solo', '2025-03-05'),
(206, 108, 'Clima', '2025-03-06'),
(207, 109, 'Irrigação', '2025-03-07'),
(208, 110, 'Solo', '2025-03-08'),
(209, 111, 'Clima', '2025-03-09'),
(210, 112, 'Irrigação', '2025-03-10');

INSERT INTO sensor_readings (
    reading_id, sensor_id, reading_time, soil_moisture, temperature, air_quality_index, irrigation_efficiency_index
)
VALUES 
(301, 201, '2025-04-01 08:00:00', 35.0, 22, 0.5, 0.2),
(302, 202, '2025-04-01 08:00:00', 30.0, 23, 0.1, 0.3),
(303, 203, '2025-04-01 08:00:00', 40.0, 21, 0.7, 0.7),
(304, 204, '2025-04-01 08:00:00', 25.0, 24, 0.3, 0.9),
(305, 205, '2025-04-01 08:00:00', 45.0, 22, 0.6, 0.1),
(306, 206, '2025-04-01 08:00:00', 33.0, 20, 0.9, 0.3),
(307, 207, '2025-04-01 08:00:00', 29.0, 25, 0.3, 0.5),
(308, 208, '2025-04-01 08:00:00', 32.0, 21, 0.1, 0.4),
(309, 209, '2025-04-01 08:00:00', 38.0, 22, 0.5, 0.1);

SELECT * FROM productors;

SELECT * FROM distributors;

SELECT * FROM crops;

SELECT * FROM production_record;

SELECT * FROM commercialization_registration;

SELECT * FROM treatments;

SELECT * FROM sensors;

SELECT * FROM sensor_readings;



-- RF3: Register alerts for adverse conditions.

DELIMITER $$

-- Trigger: Low Irrigation Efficiency
CREATE TRIGGER trg_low_irrigation_efficiency
AFTER INSERT ON sensor_readings
FOR EACH ROW
BEGIN
    IF NEW.irrigation_efficiency_index < 0.75 THEN
        INSERT INTO alerts (sensor_id, alert_type, triggered_condition, alert_time, resolved)
        VALUES (
            NEW.sensor_id,
            'Baixa Eficiência de Irrigação',
            CONCAT('Eficiência = ', NEW.irrigation_efficiency_index),
            NOW(),
            0
        );
    END IF;
END$$

-- Trigger: High Temperature
CREATE TRIGGER trg_high_temperature
AFTER INSERT ON sensor_readings
FOR EACH ROW
BEGIN
    IF NEW.temperature > 30 THEN
        INSERT INTO alerts (sensor_id, alert_type, triggered_condition, alert_time, resolved)
        VALUES (
            NEW.sensor_id,
            'Temperatura Elevada',
            CONCAT('Temperatura = ', NEW.temperature),
            NOW(),
            0
        );
    END IF;
END$$

-- Trigger: Low Soil Moisture
CREATE TRIGGER trg_low_soil_moisture
AFTER INSERT ON sensor_readings
FOR EACH ROW
BEGIN
    IF NEW.soil_moisture < 20 THEN
        INSERT INTO alerts (sensor_id, alert_type, triggered_condition, alert_time, resolved)
        VALUES (
            NEW.sensor_id,
            'Baixa Humidade do Solo',
            CONCAT('Humidade = ', NEW.soil_moisture),
            NOW(),
            0
        );
    END IF;
END$$

-- Trigger: Poor Air Quality
CREATE TRIGGER trg_poor_air_quality
AFTER INSERT ON sensor_readings
FOR EACH ROW
BEGIN
    IF NEW.air_quality_index < 0.20 THEN
        INSERT INTO alerts (sensor_id, alert_type, triggered_condition, alert_time, resolved)
        VALUES (
            NEW.sensor_id,
            'Má Qualidade do Ar',
            CONCAT('Índice de Qualidade do Ar = ', NEW.air_quality_index),
            NOW(),
            0
        );
    END IF;
END$$

-- Trigger: Extremely High Temperature
CREATE TRIGGER trg_extremely_high_temperature
AFTER INSERT ON sensor_readings
FOR EACH ROW
BEGIN
    IF NEW.temperature > 45 THEN
        INSERT INTO alerts (sensor_id, alert_type, triggered_condition, alert_time, resolved)
        VALUES (
            NEW.sensor_id,
            'Temperatura Extremamente Alta',
            CONCAT('Temperatura = ', NEW.temperature),
            NOW(),
            0
        );
    END IF;
END$$

-- Trigger: Very High Irrigation Efficiency
CREATE TRIGGER trg_very_high_irrigation_efficiency
AFTER INSERT ON sensor_readings
FOR EACH ROW
BEGIN
    IF NEW.irrigation_efficiency_index > 0.95 THEN
        INSERT INTO alerts (sensor_id, alert_type, triggered_condition, alert_time, resolved)
        VALUES (
            NEW.sensor_id,
            'Eficiência de Irrigação Anormalmente Alta',
            CONCAT('Eficiência = ', NEW.irrigation_efficiency_index),
            NOW(),
            0
        );
    END IF;
END$$

DELIMITER ;


-- Assuming your last used was 310, try:
INSERT INTO sensor_readings (
    reading_id, sensor_id, reading_time, soil_moisture, temperature, air_quality_index, irrigation_efficiency_index
)
VALUES 
(310, 210, '2025-04-01 08:00:00', 10, 50, 0.1, 0.97);


SELECT * FROM alerts;

-- RF4: View a producer's crop history over a period of time.

DELIMITER $$

CREATE PROCEDURE GetProducerCropHistory(
    IN p_producer_id INT,
    IN p_start_date DATE,
    IN p_end_date DATE
)
BEGIN
    SELECT crop_id, culture_type, plantation_date, harvest_date, expected_yield, status
    FROM crops
    WHERE producer_id = p_producer_id
      AND (
          plantation_date BETWEEN p_start_date AND p_end_date
          OR harvest_date BETWEEN p_start_date AND p_end_date
      )
    ORDER BY plantation_date;
END$$

DELIMITER ;


CALL GetProducerCropHistory(1, '2025-03-01', '2025-03-30');


-- RF5: View the producers who sell the most products.
DELIMITER $$

CREATE PROCEDURE GetTopSellingProducers()
BEGIN
    SELECT 
        p.producer_id,
        p.productor_name,
        SUM(cz.volume_sold) AS total_volume_sold,
        SUM(cz.total_revenue) AS total_revenue
    FROM productors p
    JOIN crops c ON p.producer_id = c.producer_id
    JOIN production_record pr ON c.crop_id = pr.crops_crop_id
    JOIN commercialization_registration cz ON pr.production_id = cz.production_id
    GROUP BY p.producer_id, p.productor_name
    ORDER BY total_volume_sold DESC;
END$$

DELIMITER ;

CALL GetTopSellingProducers();

-- RF6: Display the current status of treatments and product inventory.
DELIMITER $$

CREATE PROCEDURE GetTreatmentInventoryStatus()
BEGIN
    SELECT 
        t.treatment_id,
        t.treatment_name,
        t.treatment_type,
        t.unit_measure,
        t.supplier,
        IFNULL(SUM(ht.quantity_used), 0) AS total_quantity_used
    FROM treatments t
    LEFT JOIN historical_treatments ht ON t.treatment_id = ht.treatment_id
    GROUP BY 
        t.treatment_id, 
        t.treatment_name, 
        t.treatment_type, 
        t.unit_measure, 
        t.supplier
    ORDER BY total_quantity_used DESC;
END$$

DELIMITER ;

CALL GetTreatmentInventoryStatus();


-- RF7: Extract and process data from IoT sensors in the agricultural field.
DELIMITER $$

CREATE PROCEDURE GetSensorSummary()
BEGIN
    SELECT 
        sensor_id,
        MAX(temperature) AS max_temp,
        MIN(temperature) AS min_temp,
        AVG(temperature) AS avg_temp,
        
        MAX(soil_moisture) AS max_moisture,
        MIN(soil_moisture) AS min_moisture,
        AVG(soil_moisture) AS avg_moisture,
        
        MAX(irrigation_efficiency_index) AS max_efficiency,
        MIN(irrigation_efficiency_index) AS min_efficiency,
        AVG(irrigation_efficiency_index) AS avg_efficiency,
        
        MAX(air_quality_index) AS max_air_quality,
        MIN(air_quality_index) AS min_air_quality,
        AVG(air_quality_index) AS avg_air_quality
    FROM sensor_readings
    GROUP BY sensor_id;
END$$

DELIMITER ;

CALL GetSensorSummary();


-- RF8: Generate reports on agricultural efficiency and resource use.
DELIMITER $$

CREATE PROCEDURE GetAgriculturalEfficiencyReport()
BEGIN
    SELECT 
        c.crop_id,
        c.culture_type,
        
        -- Production
        SUM(pr.quantity_produced) AS total_yield,
        
        -- Treatments
        IFNULL(SUM(ht.quantity_used), 0) AS total_treatment_used,
        
        -- Sensor data
        IFNULL(AVG(sr.irrigation_efficiency_index), 0) AS avg_irrigation_efficiency,
        IFNULL(AVG(sr.temperature), 0) AS avg_temperature,
        IFNULL(AVG(sr.soil_moisture), 0) AS avg_soil_moisture
        
    FROM crops c
    
    LEFT JOIN production_record pr ON c.crop_id = pr.crops_crop_id
    LEFT JOIN historical_treatments ht ON c.crop_id = ht.crop_id
    LEFT JOIN sensors s ON c.crop_id = s.crop_id
    LEFT JOIN sensor_readings sr ON s.sensor_id = sr.sensor_id
    
    GROUP BY c.crop_id, c.culture_type
    ORDER BY total_yield DESC;
END$$

DELIMITER ;

CALL GetAgriculturalEfficiencyReport();

-- RF9: Track feedback from distributors on delivered crops for quality monitoring.

INSERT INTO distributor_feedback (distributors_distributor_id, feedback_date, rating, comments)
VALUES (301, '2025-04-05', 5, 'Ótimo serviço e entrega rápida.');

SELECT * FROM distributor_feedback;

-- RF10: List all crops planted by a specific producer.
DELIMITER $$

CREATE PROCEDURE GetProducerCrops(IN p_producer_id INT)
BEGIN
    SELECT 
        c.crop_id,
        c.culture_type,
        c.plantation_date,
        c.harvest_date,
        c.expected_yield,
        c.status
    FROM crops c
    JOIN productors p ON c.producer_id = p.producer_id
    WHERE p.producer_id = p_producer_id
    ORDER BY c.plantation_date;
END$$

DELIMITER ;

CALL GetProducerCrops(1);


-- RF11: Show the average temperature recorded for each crop.

DELIMITER $$

CREATE PROCEDURE GetAverageTemperaturePerCrop()
BEGIN
    SELECT 
        c.crop_id,
        c.culture_type,
        ROUND(AVG(sr.temperature), 2) AS avg_temperature
    FROM crops c
    JOIN sensors s ON c.crop_id = s.crop_id
    JOIN sensor_readings sr ON s.sensor_id = sr.sensor_id
    GROUP BY c.crop_id, c.culture_type
    ORDER BY avg_temperature DESC;
END$$

DELIMITER ;

CALL GetAverageTemperaturePerCrop();


-- RF12: Automatically alert when the irrigation efficiency index falls below a threshold (e.g., 0.7).

DELIMITER $$

CREATE PROCEDURE CheckIrrigationEfficiency()
BEGIN
    DECLARE efficiency_threshold DECIMAL(4,3) DEFAULT 0.700;

    INSERT INTO alerts (sensor_id, alert_type, triggered_condition, alert_time, resolved)
    SELECT 
        sr.sensor_id,
        'Baixa Eficiência de Irrigação',
        CONCAT('Eficiência = ', sr.irrigation_efficiency_index),
        NOW(),
        0
    FROM sensor_readings sr
    WHERE sr.irrigation_efficiency_index < efficiency_threshold
      AND NOT EXISTS (
          SELECT 1 FROM alerts a
          WHERE a.sensor_id = sr.sensor_id
            AND a.triggered_condition = CONCAT('Eficiência = ', sr.irrigation_efficiency_index)
            AND a.resolved = 0
      );
END$$

DELIMITER ;

CALL CheckIrrigationEfficiency();

SELECT * FROM alerts;