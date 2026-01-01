create database telecom;
use telecom;
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(50),
    address VARCHAR(100),
    phone_no VARCHAR(30)
);
CREATE TABLE SIM (
    sim_no INT PRIMARY KEY,
    connection_status VARCHAR(20),
    activation_date DATE,
    network_technology VARCHAR(20),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id));
CREATE TABLE PLAN(plan_code varchar(20) primary key,plan_name varchar(20),rental_amount real,validity_period int, data_quota varchar(20),sim_no int, foreign key(sim_no) references SIM(sim_no));
INSERT INTO Customer (customer_id, full_name, address, phone_no) VALUES
(1, 'Nishant Makwana', 'Jodhpur', '9889789734'),
(2, 'Prabhav dubey', 'Bilaspur', '9123456780'),
(3, 'Aditya Verma', 'Patna', '9988776655'),
(4, 'Krishna Lath', 'kota', '9090909090'),
(5, 'Puthivi Raj', 'Kholapur', '9456781230');
INSERT INTO SIM (sim_no, connection_status, activation_date, network_technology, customer_id) VALUES
(201, 'Active', '2025-01-10', '4G', 1),
(202, 'Active', '2025-01-12', '3G', 2),
(203, 'Inactive', '2024-12-20', '4G', 3),
(204, 'terminated', '2024-12-05', 'VoLTE', 4),
(205, 'Active', '2025-01-08', '5G', 5);
INSERT INTO PLAN (plan_code, plan_name, rental_amount, validity_period, data_quota, sim_no) VALUES
('PLAN_1', 'Starter Pack', 149, 28, '1GB/day', 201),
('PLAN_2', 'Value Pack', 249, 28, '0.1GB/day', 202),
('PLAN_3', 'Super Value pack', 349, 56, '2GB/day', 203),
('PLAN_4', 'Mega Plan', 499, 84, '3GB/day', 204),
('PLAN_5', 'Super Mega Plan', 699, 28, 'Unlimited', 205);
SELECT c.customer_id,c.full_name,c.address,c.phone_no,s.sim_no,p.plan_name
FROM Customer c
JOIN SIM s ON c.customer_id = s.customer_id
JOIN PLAN p ON s.sim_no = p.sim_no;
SELECT sim_no,connection_status,activation_date,network_technology,customer_id FROM SIM WHERE connection_status = 'Active';



