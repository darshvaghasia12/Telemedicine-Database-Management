

CREATE TABLE doctor (
doctor_id INT PRIMARY KEY,
doctor_firstName VARCHAR(30) NOT NULL,
doctor_lastName VARCHAR(30) NOT NULL,
doctor_specialization VARCHAR(30),
doctor_fees INT,
total_earnings INT,
doctor_availability TIME,
doctor_address VARCHAR(50),
doctor_emailID VARCHAR(30),
doctor_phoneNumber INT
);

CREATE TABLE patient (
patient_id INT PRIMARY KEY,
patient_firstName VARCHAR(30) NOT NULL,
patient_lastName VARCHAR(30) NOT NULL,
patient_age INT,
patient_address VARCHAR(50),
patient_salary INT,
patient_emailID VARCHAR(30),
patient_phoneNumber INT
);

CREATE TABLE chemist(
chemist_id INT PRIMARY KEY,
chemist_firstName VARCHAR(30) NOT NULL,
chemist_lastName VARCHAR(30) NOT NULL,
pharmacy_name VARCHAR(30) NOT NULL,
pharmacy_address VARCHAR(50) NOT NULL,
pharmacy_emailID VARCHAR(30) NOT NULL,
pharmacy_phoneNumber INT
);

CREATE TABLE medicine (
medicine_id INT PRIMARY KEY,
medicine_name VARCHAR(30) NOT NULL,
medicine_price INT,
medicine_expiryDate DATE,
medicine_quantity INT
);


CREATE TABLE transaction1 (
transaction_id INT PRIMARY KEY,
transaction_date DATE,
transaction_time TIME,
transaction_amount INT,
patient_id INT,
doctor_id INT,
FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id)
);

CREATE TABLE consultation (
consultation_id INT PRIMARY KEY,
consultation_date DATE,
patient_id INT,
doctor_id INT,
chemist_id INT,
FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id),
FOREIGN KEY (chemist_id) REFERENCES chemist(chemist_id)
);

CREATE TABLE consultationItem (
consultationItem_id INT PRIMARY KEY,
consultation_instructions VARCHAR(50),
consultation_id INT,
medicine_id INT,
FOREIGN KEY (consultation_id) REFERENCES consultation(consultation_id), 
FOREIGN KEY (medicine_id) REFERENCES medicine(medicine_id)
);

CREATE TABLE medicineDelivery (
medicineDelivery_id INT PRIMARY KEY,
delivery_date DATE,
patient_id INT,
chemist_id INT,
FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
FOREIGN KEY (chemist_id) REFERENCES chemist(chemist_id)
);

CREATE TABLE deliveryItem (
medicineDeliveryItem_id INT PRIMARY KEY,
delivery_instructions VARCHAR(50),
medicine_id INT,
medicineDelivery_id INT,
FOREIGN KEY (medicine_id) REFERENCES medicine(medicine_id),
FOREIGN KEY (medicineDelivery_id) REFERENCES medicineDelivery(medicineDelivery_id) );

INSERT INTO doctor VALUES (101, 'Jason', 'Shapiro', 'General Physician', 350, 50000,
'09:00:00', 'Clarendon Street', 'shapiro@doc.com', 2113114111);
INSERT INTO doctor VALUES (102, 'Matt', 'LeBlanc', 'Cardiologist', 350, 100000,
'11:00:00', 'Ackerman Street', 'leblanc@doc.com', 2113114222);
INSERT INTO doctor VALUES (103, 'Ross', 'Geller', 'Dermatologist', 350,75000, '12:00:00', 'Lancaster Street', 'geller@doc.com', 2113114333);
INSERT INTO doctor VALUES (104, 'Michael', 'Scott', 'ENT Specialist', 350,43000, '13:00:00', 'Westcott Street', 'scott@doc.com', 2113114444);
INSERT INTO doctor VALUES (105, 'Dwight', 'Schrute', 'Pediatrician', 350,69000,
'14:00:00', 'South Beech Street', 'schrute@doc.com', 2113114555);
INSERT INTO doctor VALUES (106, 'Jim', 'Halper', 'Dentist', 350,90000, '15:00:00',
'Ostrom Street', 'halper@doc.com', 2113114666);
INSERT INTO doctor VALUES (107, 'Pam', 'Beasley', 'Eye Specialist', 350,80000, '16:00:00', 'Glendale Street', 'beasley@doc.com', 2113114777);
INSERT INTO doctor VALUES (108, 'Rachel Green', 'Shapiro', 'Psychiatrist', 350,120000, '17:00:00', 'Marshall Street', 'green@doc.com', 2113114888);
INSERT INTO doctor VALUES (109, 'Angela', 'Thomson', 'General Physician', 350,100000, '18:00:00', 'Baker Street', 'thomson@doc.com', 2113114999);
INSERT INTO doctor VALUES (110, 'Chandler', 'Bing', 'Mindfulness Specialist', 350,73000, '19:00:00', 'Euclid Street', 'bing@doc.com', 2113114000);
INSERT INTO doctor VALUES (111, 'Richard', 'Roy', 'Eye Specialist', 350,67000, '18:00:00', 'Concord Street', 'richard@doc.com', 2119114000);
INSERT INTO doctor VALUES (113, 'Andy', 'Bernard', 'Dentist', 350,58000, '14:00:00', 'Laker Street', 'andy@doc.com', 2119114123);


select * from doctor;

INSERT INTO patient VALUES (201, 'Sankalp', 'Singh', '27', '437 Clarendon Street',
'100000', 'ssingh@syr.edu', 2013014011);
INSERT INTO patient VALUES (202, 'Stanley', 'Cooper', '43', '237 Westcott Street',
'120000', 'cooper@pat.com', 2013014911);
INSERT INTO patient VALUES (203, 'Kevin', 'Donas', '45', '123 Lancaster Street',
'800000', 'donas@pat.com', 2013014811);
INSERT INTO patient VALUES (204, 'Toby', 'Mcguire', '32', '734 Ostrom Street',
'700000', 'toby@syr.edu', 2013014711);
INSERT INTO patient VALUES (205, 'Chris', 'Hemsworth', '35', '444 Ackerman
Street', '130000', 'hems@syr.edu', 2013014611);
INSERT INTO patient VALUES (206, 'Robert', 'Jr', '44', '40 Baker Street',
'140000', 'robert@syr.edu', 2013014511);
INSERT INTO patient VALUES (207, 'Evan', 'Smith', '22', '22 Baker Street',
'150000', 'smith@syr.edu', 2013014411);
INSERT INTO patient VALUES (208, 'Tommy', 'Lee', '50', '333 Euclid Av', '160000',
'lee@syr.edu', 2013014311);
INSERT INTO patient VALUES (209, 'Brad', 'Pitt', '53', '99 Manchester Street',
'170000', 'pitt@syr.edu', 2013014211);
INSERT INTO patient VALUES (210, 'John', 'Rambo', '66', '101 Stron Av', '180000',
'rambo@syr.edu', 2013014114);

INSERT INTO chemist VALUES (301, 'Katie', 'Holmes', 'CVS Pharmacy', 'Marshall Street', 'cvs@gmail.com', 2113114114);
INSERT INTO chemist VALUES (302, 'Tom', 'Cruise', 'Chase Pharmacy', 'Ackerman Street', 'chase@gmail.com', 2113114111);
INSERT INTO chemist VALUES (303, 'Barney', 'Stinson', 'Jet Pharmacy', 'Lancaster
Street', 'jet@gmail.com', 2113114112);
INSERT INTO chemist VALUES (304, 'Lily', 'Dawson', 'Blue Pharmacy', 'Clarendon
Street', 'blue@gmail.com', 2113114113);
INSERT INTO chemist VALUES (305, 'Robin', 'Dannings', 'Green Pharmacy', 'Euclid
Street', 'green@gmail.com', 2113114115);
INSERT INTO chemist VALUES (306, 'Ted', 'Mosby', 'Yellow Pharmacy', 'Ostrom
Street', 'yellow@gmail.com', 2113114116);
INSERT INTO chemist VALUES (307, 'Marshall', 'Anderson', 'Red Cross Pharmacy',
'Comstock Street', 'redc@gmail.com', 2113114117);
INSERT INTO chemist VALUES (308, 'Kevin', 'Donas', 'Health Plus Pharmacy',
'Gilbert Street', 'healthp@gmail.com', 2113114118);
INSERT INTO chemist VALUES (309, 'Margeret', 'Robbie', 'Trust Pharmacy', 'Westcott
Street', 'trust@gmail.com', 2113114119);
INSERT INTO chemist VALUES (310, 'James', 'Blunt', 'CVS Pharmacy', 'Lyra Street',
'cvsp@gmail.com', 2113114110);

INSERT INTO medicine VALUES (401, 'Paracep', 5, '2020-05-05', 10);
INSERT INTO medicine VALUES (402, 'TZ', 3, '2021-05-05', 20);
INSERT INTO medicine VALUES (403, 'Benadryl', 4, '2022-05-05', 30);
INSERT INTO medicine VALUES (404, 'Dcold', 6, '2020-10-05', 40);
INSERT INTO medicine VALUES (405, 'Chestcold', 1, '2020-08-05', 50);
INSERT INTO medicine VALUES (406, 'Norflox', 2, '2020-06-05', 60);
INSERT INTO medicine VALUES (407, 'Crocin', 8, '2021-03-05', 70);
INSERT INTO medicine VALUES (408, 'Vicks', 10, '2023-05-20', 20);
INSERT INTO medicine VALUES (409, 'BandAid', 2, '2021-10-10', 90);
INSERT INTO medicine VALUES (410, 'Azithromycine', 4, '2022-07-07', 80);

INSERT INTO transaction1 VALUES (501, '2019-12-02', '09:00:00', 350, 201, 101);
INSERT INTO transaction1 VALUES (502, '2019-12-03', '10:00:00', 350, 202, 102); 
INSERT INTO transaction1 VALUES (503, '2019-12-04', '11:00:00', 350, 203, 103); 
INSERT INTO transaction1 VALUES (504, '2019-12-05', '12:00:00', 350, 204, 104); 
INSERT INTO transaction1 VALUES (505, '2019-12-06', '13:00:00', 350, 205, 105); 
INSERT INTO transaction1 VALUES (506, '2019-12-07', '14:00:00', 350, 206, 106);
INSERT INTO transaction1 VALUES (508, '2019-12-09', '16:00:00', 350, 208, 108);
INSERT INTO transaction1 VALUES (510, '2019-12-11', '18:00:00', 350, 210, 110); 
INSERT INTO transaction1 VALUES (511, '2019-12-13', '10:00:00', 350, 202, 111); 
INSERT INTO transaction1 VALUES (512, '2019-12-13', '11:00:00', 350, 203, 113); 
INSERT INTO transaction1 VALUES (513, '2019-12-14', '12:00:00', 350, 204, 113); 
INSERT INTO transaction1 VALUES (514, '2019-12-15', '13:00:00', 350, 205, 113); 
INSERT INTO transaction1 VALUES (515, '2019-12-16', '14:00:00', 350, 207, 113); 
INSERT INTO transaction1 VALUES (516, '2019-12-17', '15:00:00', 350, 209, 113); 
INSERT INTO transaction1 VALUES (517, '2019-12-18', '16:00:00', 350, 206, 107); 
INSERT INTO transaction1 VALUES (518, '2019-12-13', '14:00:00', 350, 205, 104); 
INSERT INTO transaction1 VALUES (519, '2019-12-15', '13:00:00', 350, 202, 104); 
INSERT INTO transaction1 VALUES (520, '2019-12-13', '12:00:00', 350, 206, 113);

INSERT INTO consultation VALUES (601, '2019-12-02', 201, 101, 301);
INSERT INTO consultation VALUES (602, '2019-12-03', 202, 102, 302);
INSERT INTO consultation VALUES (603, '2019-12-04', 203, 103, 303);
INSERT INTO consultation VALUES (604, '2019-12-05', 204, 104, 304);
INSERT INTO consultation VALUES (605, '2019-12-06', 205, 105, 305);
INSERT INTO consultation VALUES (606, '2019-12-07', 206, 106, 306);
INSERT INTO consultation VALUES (607, '2019-12-08', 207, 107, 307);
INSERT INTO consultation VALUES (608, '2019-12-09', 208, 108, 308);
INSERT INTO consultation VALUES (609, '2019-12-10', 209, 109, 309);
INSERT INTO consultation VALUES (610, '2019-12-11', 210, 110, 310);
INSERT INTO consultation VALUES (611, '2019-12-11', 207, 105, 310);
INSERT INTO consultation VALUES (612, '2019-12-11', 207, 104, 310);
INSERT INTO consultation VALUES (613, '2019-12-11', 207, 103, 310);
INSERT INTO consultation VALUES (614, '2019-12-13', 204, 113, 305);


INSERT INTO consultationItem VALUES (701, 'Take 3 times a day', 601, 401);
INSERT INTO consultationItem VALUES (702, 'Take 2 times a day', 602, 402);
INSERT INTO consultationItem VALUES (703, 'Take 1 times a day', 603, 403);
INSERT INTO consultationItem VALUES (704, 'Take 4 times a day', 604, 404);
INSERT INTO consultationItem VALUES (705, 'Take 5 times a day', 605, 405);
INSERT INTO consultationItem VALUES (706, 'Apply daily', 606, 406);
INSERT INTO consultationItem VALUES (707, 'Apply 2 times daily', 607, 407); 
INSERT INTO consultationItem VALUES (708, 'Apply 3 times daily', 608, 408); 
INSERT INTO consultationItem VALUES (709, 'Apply 4 times daily', 609, 409); 
INSERT INTO consultationItem VALUES (710, 'Apply 5 times daily', 610, 410);


INSERT INTO medicineDelivery VALUES (801, '2019-12-03', 201, 301);
INSERT INTO medicineDelivery VALUES (802, '2019-12-04', 202, 302);
INSERT INTO medicineDelivery VALUES (803, '2019-12-05', 203, 303);
INSERT INTO medicineDelivery VALUES (804, '2019-12-06', 204, 304);
INSERT INTO medicineDelivery VALUES (805, '2019-12-07', 205, 305);
INSERT INTO medicineDelivery VALUES (806, '2019-12-08', 206, 306);
INSERT INTO medicineDelivery VALUES (807, '2019-12-09', 207, 307);
INSERT INTO medicineDelivery VALUES (808, '2019-12-10', 208, 308);
INSERT INTO medicineDelivery VALUES (809, '2019-12-11', 209, 309);
INSERT INTO medicineDelivery VALUES (810, '2019-12-12', 210, 310);
INSERT INTO medicineDelivery VALUES (811, '2019-12-08', 203, 305);
INSERT INTO medicineDelivery VALUES (812, '2019-12-07', 205, 305);
INSERT INTO medicineDelivery VALUES (813, '2019-12-06', 207, 307);
INSERT INTO medicineDelivery VALUES (814, '2019-12-05', 209, 307);
INSERT INTO medicineDelivery VALUES (815, '2019-12-07', 201, 307);


INSERT INTO deliveryItem VALUES (901, 'Deliver today', 401, 801);
INSERT INTO deliveryItem VALUES (902, 'Deliver tomorrow', 402, 802);
INSERT INTO deliveryItem VALUES (903, 'Deliver tomorrow', 403, 803);
INSERT INTO deliveryItem VALUES (904, 'Deliver today', 404, 804);
INSERT INTO deliveryItem VALUES (905, 'Deliver tomorrow', 405, 805);
INSERT INTO deliveryItem VALUES (906, 'Deliver tomorrow', 406, 806);
INSERT INTO deliveryItem VALUES (907, 'Deliver today', 407, 807);
INSERT INTO deliveryItem VALUES (908, 'Deliver tomorrow', 408, 808);
INSERT INTO deliveryItem VALUES (909, 'Deliver today', 409, 809);
INSERT INTO deliveryItem VALUES (910, 'Deliver tomorrow', 410, 810);



SELECT dm.doctor_id, dm.doctor_firstName, dm.doctor_lastName, dm.doctor_specialization, COUNT(consultation_id) AS 'Total Doctor Consultations'
FROM doctor dm
LEFT OUTER JOIN consultation cm
ON dm.doctor_id=cm.doctor_id
GROUP BY dm.doctor_id, dm.doctor_firstName, dm.doctor_lastName, dm.doctor_specialization 
UNION
SELECT dm.doctor_id, dm.doctor_firstName, dm.doctor_lastName, dm.doctor_specialization, COUNT(consultation_id) AS 'Total Doctor Consultations'
FROM doctor dm
RIGHT OUTER JOIN consultation cm
ON dm.doctor_id=cm.doctor_id
GROUP BY dm.doctor_id, dm.doctor_firstName, dm.doctor_lastName, dm.doctor_specialization;

SELECT pm.patient_id, pm.patient_firstName, pm.patient_lastName, pm.patient_age, COUNT(consultation_id) AS 'Total Patient Consultations'
FROM patient pm
LEFT OUTER JOIN consultation cm
ON pm.patient_id=cm.patient_id
GROUP BY pm.patient_id, pm.patient_firstName, pm.patient_lastName, pm.patient_age
UNION
SELECT pm.patient_id, pm.patient_firstName, pm.patient_lastName, pm.patient_age, COUNT(consultation_id) AS 'Total Patient Consultations'
FROM patient pm
RIGHT OUTER JOIN consultation cm
ON pm.patient_id=cm.patient_id
GROUP BY pm.patient_id, pm.patient_firstName, pm.patient_lastName, pm.patient_age;

SELECT dm.doctor_id, dm.doctor_firstName, dm.doctor_lastName, dm.doctor_fees, dm.total_earnings, COUNT(transaction_id) AS 'Total Doctor Transactions'
FROM doctor dm
LEFT OUTER JOIN transaction1 tm
ON dm.doctor_id=tm.doctor_id
GROUP BY dm.doctor_id, dm.doctor_firstName, dm.doctor_lastName, dm.doctor_fees, dm.total_earnings
UNION
SELECT dm.doctor_id, dm.doctor_firstName, dm.doctor_lastName, dm.doctor_fees, dm.total_earnings, COUNT(transaction_id) AS 'Total Doctor Transactions'
FROM doctor dm
RIGHT OUTER JOIN transaction1 tm
ON dm.doctor_id=tm.doctor_id
GROUP BY dm.doctor_id, dm.doctor_firstName, dm.doctor_lastName, dm.doctor_fees, dm.total_earnings;

SELECT pm.patient_id, pm.patient_firstName, pm.patient_lastName, pm.patient_age, COUNT(transaction_id) AS 'Total Patient Transactions'
FROM patient pm
LEFT OUTER JOIN transaction1 tm
ON pm.patient_id=tm.patient_id
GROUP BY pm.patient_id, pm.patient_firstName, pm.patient_lastName, pm.patient_age
UNION
SELECT pm.patient_id, pm.patient_firstName, pm.patient_lastName, pm.patient_age, COUNT(transaction_id) AS 'Total Patient Transactions'
FROM patient pm
RIGHT OUTER JOIN transaction1 tm
ON pm.patient_id=tm.patient_id
GROUP BY pm.patient_id, pm.patient_firstName, pm.patient_lastName, pm.patient_age;

SELECT cm.chemist_id, cm.chemist_firstName, cm.chemist_lastName, cm.pharmacy_name, cm.pharmacy_address, COUNT(medicineDelivery_id) AS 'Total Medicine Deliveries'
FROM chemist cm
LEFT OUTER JOIN medicineDelivery mdm ON cm.chemist_id=mdm.chemist_id
GROUP BY cm.chemist_id, cm.chemist_firstName, cm.chemist_lastName, cm.pharmacy_name, cm.pharmacy_address
UNION
SELECT cm.chemist_id, cm.chemist_firstName, cm.chemist_lastName, cm.pharmacy_name, cm.pharmacy_address, COUNT(medicineDelivery_id) AS 'Total Medicine Deliveries'
FROM chemist cm
RIGHT OUTER JOIN medicineDelivery mdm ON cm.chemist_id=mdm.chemist_id
GROUP BY cm.chemist_id, cm.chemist_firstName, cm.chemist_lastName, cm.pharmacy_name, cm.pharmacy_address;


