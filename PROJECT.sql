--1.USERS_LOGIN TABLE
CREATE TABLE Users_login (
    user_id NUMBER ,
    username VARCHAR2(50) NOT NULL,
    password VARCHAR2(255) NOT NULL,
    role VARCHAR2(20) , 
    
    constraint my_user_id_pk primary key(user_id),
    constraint my_username_uk unique(username),
    constraint my_role_ck check (role IN ('Admin', 'UnderWriter', 'Operational User', 'Broker', 'Sales Agent'))
);

SELECT * FROM USERS_LOGIN;

--2.BROKER_DETAILS TABLE
CREATE TABLE Broker_details (
    broker_id NUMBER,
    broker_name VARCHAR2(100) NOT NULL,
    company_name VARCHAR2(150),
    email VARCHAR2(100) NOT NULL,
    phone_number VARCHAR2(20) NOT NULL,
    license_number VARCHAR2(50) NOT NULL,
    commission_rate NUMBER(10,2),
    status VARCHAR2(20),
    
    constraint my_broker_id_pk primary key(broker_id),
    constraint my_company_name_uk unique(company_name),
    constraint my_email_uk unique(email),
    constraint my_phone_number_uk unique(phone_number),
    constraint my_license_number_uk unique(license_number),
    constraint my_commission_rate_ck check (commission_rate BETWEEN 0 AND 1000),
    constraint my_b_status_ck check (status IN ('Active', 'Inactive'))
    
);
SELECT * FROM BROKER_DETAILS;

/*CREATE TABLE Policies (
    policy_id NUMBER PRIMARY KEY,
    user_id NUMBER REFERENCES Users(user_id),
    vehicle_id NUMBER REFERENCES Vehicles(vehicle_id),
    coverage_type VARCHAR2(50) CHECK (coverage_type IN ('Comprehensive', 'TPL')),
    premium_amount NUMBER(10,2),
    issue_date DATE DEFAULT SYSDATE,
    status VARCHAR2(20) CHECK (status IN ('Issued', 'Pending', 'Cancelled'))
);*/

--3.VEHICLE_DETAILS TABLE
CREATE TABLE Vehicle_details (
    vehicle_id NUMBER ,
    owner_id NUMBER ,
    model VARCHAR2(50) NOT NULL,
    registration_number VARCHAR2(20) NOT NULL,
    insured_value NUMBER NOT NULL,
    
    constraint my_vehicle_id_pk primary key(vehicle_id),
    constraint my_owner_id_fk foreign key(owner_id) references users_login(user_id),
    constraint my_registration_number_uk unique(registration_number)
    
);
SELECT * FROM VEHICLE_DETAILS;

--4.POLICY_DETAILS TABLE
CREATE TABLE Policy_details (
    policy_id NUMBER ,
    user_id NUMBER,
    broker_id NUMBER ,
    vehicle_id NUMBER ,
    coverage_type VARCHAR2(50) ,
    premium_amount NUMBER(30,2) NOT NULL ,
    issue_date DATE NOT NULL ,
    status VARCHAR2(20) ,
    
    constraint my_policy_id_pk primary key(policy_id),
    constraint my_P_user_id_fk foreign key(user_id) references users_login(user_id),
    constraint my_P_broker_id_fk foreign key(broker_id) references broker_details(broker_id),
    constraint my_P_vehicle_id_fk foreign key(vehicle_id) references vehicle_details(vehicle_id),
    constraint my_coverage_type_ck check (coverage_type IN ('Comprehensive', 'TPL')),
    constraint my_p_status_ck check (status IN ('Issued', 'Pending', 'Cancelled'))

);

SELECT * FROM POLICY_DETAILS;



--5.CLAIM_STATUS TABLE
CREATE TABLE Claim_status (
    claim_id NUMBER ,
    policy_id NUMBER ,
    claim_amount NUMBER(20,2) NOT NULL,
    claim_status VARCHAR2(20) ,
    filed_date DATE NOT NULL,
    processed_by NUMBER ,
    
    constraint my_claim_id_pk primary key(claim_id),
    constraint my_c_policy_id_fk foreign key(policy_id) references policy_details(policy_id),
    constraint my_claim_status_ck CHECK (claim_status IN ('Pending', 'Approved', 'Rejected')),
    constraint my_processed_by_fk foreign key(processed_by) references users_login(user_id)
);

SELECT * FROM CLAIM_STATUS;

--6.TRANSACTION_DETAILS TABLE
CREATE TABLE Transaction_details (
    transaction_id NUMBER ,
    user_id NUMBER ,
    amount NUMBER(20,2) NOT NULL,
    transaction_type VARCHAR2(20), 
    transaction_date DATE NOT NULL,
    
    constraint my_transaction_id_pk primary key(transaction_id),
    constraint my_t_user_id_fk foreign key(user_id) references users_login(user_id),
    constraint my_transaction_type_ck CHECK (transaction_type IN ('Premium Payment', 'Claim Settlement'))
);

SELECT * FROM TRANSACTION_DETAILS;


--INSERT INTO Users_login (user_id, username, password, role) VALUES
INSERT INTO Users_login VALUES(1, 'admin_001', 'Adm!n#2025', 'Admin');
INSERT INTO Users_login VALUES(2, 'admin_002', 'Adm!n#Xyz2', 'Admin');
INSERT INTO Users_login VALUES(3, 'underwriter_A', 'Und3rW!t3r#A1', 'UnderWriter');
INSERT INTO Users_login VALUES(4, 'underwriter_B', 'Und3rW!t3r#B2', 'UnderWriter');
INSERT INTO Users_login VALUES(5, 'ops_user_01', 'Op3r@t10n$U1', 'Operational User');
INSERT INTO Users_login VALUES(6, 'ops_user_02', 'Op3r@t10n$U2', 'Operational User');
INSERT INTO Users_login VALUES(7, 'broker_A1', 'Br0k3r#A123!', 'Broker');
INSERT INTO Users_login VALUES(8, 'broker_B2', 'Br0k3r#B456!', 'Broker');
INSERT INTO Users_login VALUES(9, 'sales_rep_01', 'S@l3sAgenT#1!', 'Sales Agent');
INSERT INTO Users_login VALUES(10, 'sales_rep_02', 'S@l3sAgenT#2!', 'Sales Agent');
INSERT INTO Users_login VALUES(11, 'broker_X1', 'Br0k3rX@11!', 'Broker');
INSERT INTO Users_login VALUES(12, 'underwriter_X2', 'Und3rX!t3r#22!', 'UnderWriter');
INSERT INTO Users_login VALUES(13, 'ops_team_03', 'Op$Team#303!', 'Operational User');
INSERT INTO Users_login VALUES(14, 'broker_Y1', 'Br0k3rY@14!', 'Broker');
INSERT INTO Users_login VALUES(15, 'sales_rep_03', 'S@l3sAg#303!', 'Sales Agent');
INSERT INTO Users_login VALUES(16, 'admin_003', 'Adm!n@003$#', 'Admin');
INSERT INTO Users_login VALUES(17, 'underwriter_C', 'Und3rW!t3r#C3', 'UnderWriter');
INSERT INTO Users_login VALUES(18, 'broker_Z1', 'Br0k3rZ@18!', 'Broker');
INSERT INTO Users_login VALUES(19, 'ops_team_04', 'Op$Team#404!', 'Operational User');
INSERT INTO Users_login VALUES(20, 'sales_rep_04', 'S@l3sAg#404!', 'Sales Agent');
INSERT INTO Users_login VALUES(21, 'admin_004', 'Adm!n@004$#', 'Admin');
INSERT INTO Users_login VALUES(22, 'underwriter_D', 'Und3rW!t3r#D4', 'UnderWriter');
INSERT INTO Users_login VALUES(23, 'broker_W1', 'Br0k3rW@23!', 'Broker');
INSERT INTO Users_login VALUES(24, 'ops_team_05', 'Op$Team#505!', 'Operational User');
INSERT INTO Users_login VALUES(25, 'sales_rep_05', 'S@l3sAg#505!', 'Sales Agent');

--INSERT INTO Broker_details VALUES  (broker_id, broker_name, company_name, email, phone_number, license_number, commission_rate, status) VALUES 
INSERT INTO Broker_details VALUES(1, 'John Smith', 'SecureInsure Brokers', 'john.smith@secure.com', '9876543211', 'LIC10001', 5.5, 'Active');
INSERT INTO Broker_details VALUES(2, 'Alice Johnson', 'Global Cover Ltd.', 'alice.johnson@globalcover.com', '9876543212', 'LIC10002', 6.0, 'Active');
INSERT INTO Broker_details VALUES(3, 'Michael Brown', 'SafeShield Insurance', 'michael.brown@safeshield.com', '9876543213', 'LIC10003', 4.5, 'Active');
INSERT INTO Broker_details VALUES(4, 'Emma Wilson', 'TrustGuard Brokers', 'emma.wilson@trustguard.com', '9876543214', 'LIC10004', 5.0, 'Inactive');
INSERT INTO Broker_details VALUES(5, 'David Lee', 'SecureWay Brokers', 'david.lee@secureway.com', '9876543215', 'LIC10005', 6.2, 'Active');
INSERT INTO Broker_details VALUES(6, 'Sophia Taylor', 'Guardian Insurance', 'sophia.taylor@guardian.com', '9876543216', 'LIC10006', 5.7, 'Active');
INSERT INTO Broker_details VALUES(7, 'James Anderson', 'Reliance Brokers', 'james.anderson@reliance.com', '9876543217', 'LIC10007', 4.8, 'Inactive');
INSERT INTO Broker_details VALUES(8, 'Isabella Martinez', 'ShieldCover Ltd.', 'isabella.martinez@shieldcover.com', '9876543218', 'LIC10008', 6.5, 'Active');
INSERT INTO Broker_details VALUES(9, 'Robert Thomas', 'Elite Insurance', 'robert.thomas@elite.com', '9876543219', 'LIC10009', 5.3, 'Active');
INSERT INTO Broker_details VALUES(10, 'Emily Harris', 'PrimeGuard Brokers', 'emily.harris@primeguard.com', '9876543220', 'LIC10010', 5.9, 'Active');
INSERT INTO Broker_details VALUES(11, 'Daniel White', 'AssureTrust Ltd.', 'daniel.white@assuretrust.com', '9876543221', 'LIC10011', 4.7, 'Active');
INSERT INTO Broker_details VALUES(12, 'Olivia Lewis', 'CoverPlus Brokers', 'olivia.lewis@coverplus.com', '9876543222', 'LIC10012', 6.1, 'Inactive');
INSERT INTO Broker_details VALUES(13, 'William Hall', 'ProInsure Agency', 'william.hall@proinsure.com', '9876543223', 'LIC10013', 5.4, 'Active');
INSERT INTO Broker_details VALUES(14, 'Charlotte Allen', 'Fortress Insurance', 'charlotte.allen@fortress.com', '9876543224', 'LIC10014', 6.3, 'Active');
INSERT INTO Broker_details VALUES(15, 'Matthew Young', 'IronClad Brokers', 'matthew.young@ironclad.com', '9876543225', 'LIC10015', 4.9, 'Active');
INSERT INTO Broker_details VALUES(16, 'Mia Scott', 'Pioneer Insurance', 'mia.scott@pioneer.com', '9876543226', 'LIC10016', 5.2, 'Active');
INSERT INTO Broker_details VALUES(17, 'Benjamin King', 'Royal Shield Ltd.', 'benjamin.king@royalshield.com', '9876543227', 'LIC10017', 5.8, 'Inactive');
INSERT INTO Broker_details VALUES(18, 'Amelia Wright', 'TrustedCover Brokers', 'amelia.wright@trustedcover.com', '9876543228', 'LIC10018', 5.6, 'Active');
INSERT INTO Broker_details VALUES(19, 'Henry Carter', 'Swift Insurance', 'henry.carter@swift.com', '9876543229', 'LIC10019', 6.0, 'Active');
INSERT INTO Broker_details VALUES(20, 'Evelyn Baker', 'Secure Future Brokers', 'evelyn.baker@securefuture.com', '9876543230', 'LIC10020', 5.1, 'Inactive');
INSERT INTO Broker_details VALUES(21, 'Liam Adams', 'Reliable Shield Ltd.', 'liam.adams@reliableshield.com', '9876543231', 'LIC10021', 4.6, 'Active');
INSERT INTO Broker_details VALUES(22, 'Ava Nelson', 'Ultimate Cover Insurance', 'ava.nelson@ultimatecover.com', '9876543232', 'LIC10022', 5.0, 'Active');
INSERT INTO Broker_details VALUES(23, 'Noah Carter', 'ShieldMax Brokers', 'noah.carter@shieldmax.com', '9876543233', 'LIC10023', 5.7, 'Active');
INSERT INTO Broker_details VALUES(24, 'Harper Rivera', 'TrustZone Insurance', 'harper.rivera@trustzone.com', '9876543234', 'LIC10024', 6.4, 'Inactive');
INSERT INTO Broker_details VALUES(25, 'Elijah Perez', 'TitanGuard Brokers', 'elijah.perez@titanguard.com', '9876543235', 'LIC10025', 6.2, 'Active');

--INSERT INTO Vehicle_details VALUES (vehicle_id, owner_id, model, registration_number, insured_value) VALUES
INSERT INTO Vehicle_details VALUES (1, 7, 'Toyota Corolla', 'ABC123', 600000);
INSERT INTO Vehicle_details VALUES (2, 8, 'Honda City', 'XYZ789', 500000);
INSERT INTO Vehicle_details VALUES (3, 9, 'Suzuki Swift', 'LMN456', 700000);
INSERT INTO Vehicle_details VALUES (4, 10, 'Hyundai Verna', 'PQR234', 900000);
INSERT INTO Vehicle_details VALUES (5, 11, 'Kia Seltos', 'JKL789', 1200000);
INSERT INTO Vehicle_details VALUES (6, 12, 'Ford Endeavour', 'GHI123', 1500000);
INSERT INTO Vehicle_details VALUES (7, 13, 'Nissan Magnite', 'DEF456', 400000);
INSERT INTO Vehicle_details VALUES (8, 14, 'Renault Kwid', 'STU890', 350000);
INSERT INTO Vehicle_details VALUES (9, 15, 'Tata Nexon', 'VWX567', 850000);
INSERT INTO Vehicle_details VALUES (10, 16, 'Jeep Compass', 'YZA432', 1100000);
INSERT INTO Vehicle_details VALUES (11, 17, 'Maruti Alto', 'BCD654', 300000);
INSERT INTO Vehicle_details VALUES (12, 18, 'MG Hector', 'EFG987', 950000);
INSERT INTO Vehicle_details VALUES (13, 19, 'Mahindra Thar', 'HIJ321', 1400000);
INSERT INTO Vehicle_details VALUES (14, 20, 'Volkswagen Polo', 'KLM654', 800000);
INSERT INTO Vehicle_details VALUES (15, 21, 'Honda Civic', 'NOP987', 1000000);
INSERT INTO Vehicle_details VALUES (16, 22, 'Audi A3', 'QRS123', 2500000);
INSERT INTO Vehicle_details VALUES (17, 23, 'BMW X1', 'TUV456', 3200000);
INSERT INTO Vehicle_details VALUES (18, 24, 'Mercedes C-Class', 'WXY789', 4000000);
INSERT INTO Vehicle_details VALUES (19, 25, 'Hyundai i20', 'ZAB234', 550000);
INSERT INTO Vehicle_details VALUES (20, 5, 'Toyota Fortuner', 'CDE567', 1800000);
INSERT INTO Vehicle_details VALUES (21, 6, 'Kia Sonet', 'FGH890', 750000);
INSERT INTO Vehicle_details VALUES (22, 1, 'Mahindra XUV700', 'IJK321', 1300000);
INSERT INTO Vehicle_details VALUES (23, 2, 'Tata Harrier', 'LMN654', 1700000);
INSERT INTO Vehicle_details VALUES (24, 3, 'Ford EcoSport', 'OPQ987', 920000);
INSERT INTO Vehicle_details VALUES (25, 4, 'Skoda Superb', 'RST123', 2800000);


--INSERT INTO Policy_details VALUES (policy_id, user_id, vehicle_id, coverage_type, premium_amount, issue_date, status) VALUES
INSERT INTO Policy_details (policy_id, user_id, BROKER_ID, vehicle_id, coverage_type, premium_amount, issue_date, status) VALUES(1, 7, 1, 'Comprehensive', 12000, '15-JAN-24', 'Issued');
INSERT INTO Policy_details VALUES(102, 8, 2,5, 'TPL', 8000, '22-NOV-23', 'Issued');
INSERT INTO Policy_details VALUES(103, 9, 3, 7, 'Comprehensive', 14000, '10-MAR-24', 'Issued');
INSERT INTO Policy_details VALUES(104, 10, 4, 8, 'TPL', 9000, '30-SEP-23', 'Issued');
INSERT INTO Policy_details VALUES(105, 11, 5,6, 'Comprehensive', 18000, '05-MAY-24', 'Issued');
INSERT INTO Policy_details VALUES(106, 12, 6,9, 'Comprehensive', 22000, '18-DEC-23', 'Issued');
INSERT INTO Policy_details VALUES(107, 13, 7,10, 'TPL', 7000, '25-FEB-24', 'Issued');
INSERT INTO Policy_details VALUES(108, 14, 8, 1, 'TPL', 6000, '14-AUG-23', 'Issued');
INSERT INTO Policy_details VALUES(109, 15, 9, 2, 'Comprehensive', 15000, '20-APR-24', 'Issued');
INSERT INTO Policy_details VALUES(110, 16, 10, 3, 'TPL', 11000, '10-JUL-23', 'Issued');
INSERT INTO Policy_details VALUES(111, 17, 11,4,'Comprehensive', 5000, '08-JUN-24', 'Issued');
INSERT INTO Policy_details VALUES(112, 18, 12,11, 'Comprehensive', 14500, '30-OCT-23', 'Issued');
INSERT INTO Policy_details VALUES(113, 19, 13, 12,'Comprehensive', 25000, '12-FEB-24', 'Issued');
INSERT INTO Policy_details VALUES(114, 20, 14,15, 'TPL', 10000, '25-SEP-23', 'Issued');
INSERT INTO Policy_details VALUES(115, 21, 15,13, 'Comprehensive', 17000, '28-MAR-24', 'Issued');
INSERT INTO Policy_details VALUES(116, 22, 16, 14,'TPL', 45000, '07-DEC-23', 'Issued');
INSERT INTO Policy_details VALUES(117, 23, 17,20, 'Comprehensive', 60000, '01-JAN-24', 'Issued');
INSERT INTO Policy_details VALUES(118, 24, 18, 19,'TPL', 75000, '15-NOV-23', 'Issued');
INSERT INTO Policy_details VALUES(119, 25, 19,18, 'TPL', 7000, '02-APR-24', 'Issued');
INSERT INTO Policy_details VALUES(120, 5, 20,17, 'Comprehensive', 30000, '19-JUL-23', 'Issued');
INSERT INTO Policy_details VALUES(121, 6, 21,16, 'TPL', 11000, '22-MAY-24', 'Issued');
INSERT INTO Policy_details VALUES(122, 1, 22,25, 'Comprehensive', 22000, '05-AUG-23', 'Issued');
INSERT INTO Policy_details VALUES(123, 2, 23,24, 'TPL', 18000, '17-FEB-24', 'Issued');
INSERT INTO Policy_details VALUES(124, 3, 24,23, 'Comprehensive', 14000, '11-OCT-23', 'Issued');
INSERT INTO Policy_details VALUES(125, 4, 25,22,'TPL', 39000, '30-JUN-24', 'Issued');



--INSERT INTO Claims VALUES(claim_id, policy_id, claim_amount, claim_status, filed_date, processed_by) VALUES
INSERT INTO Claim_Status VALUES(1, 103, 5000, 'Approved', '12-JAN-24', 3);
INSERT INTO Claim_Status VALUES(2, 106, 10000, 'Pending', '25-FEB-23', 4);
INSERT INTO Claim_Status VALUES(3, 109, 12000, 'Rejected', '17-MAR-24', 5);
INSERT INTO Claim_Status VALUES(4, 112, 3000, 'Approved', '05-MAY-23', 6);
INSERT INTO Claim_Status VALUES(5, 115, 8000, 'Pending', '29-SEP-24', 7);
INSERT INTO Claim_Status VALUES(6, 118, 7000, 'Approved', '08-JUN-23', 8);
INSERT INTO Claim_Status VALUES(7, 121, 11000, 'Rejected', '15-OCT-24', 9);
INSERT INTO Claim_Status VALUES(8, 124, 9500, 'Pending', '23-NOV-23', 10);
INSERT INTO Claim_Status VALUES(9, 102, 15000, 'Approved', '07-APR-24', 11);
INSERT INTO Claim_Status VALUES(10, 105, 4500, 'Pending', '11-DEC-23', 12);
INSERT INTO Claim_Status VALUES(11, 107, 13200, 'Approved', '14-AUG-24', 3);
INSERT INTO Claim_Status VALUES(12, 110, 8700, 'Pending', '19-JUL-23', 4);
INSERT INTO Claim_Status VALUES(13, 113, 14500, 'Rejected', '05-SEP-24', 5);
INSERT INTO Claim_Status VALUES(14, 116, 9900, 'Approved', '28-OCT-23', 6);
INSERT INTO Claim_Status VALUES(15, 119, 6500, 'Pending', '30-NOV-24', 7);
INSERT INTO Claim_Status VALUES(16, 122, 7300, 'Rejected', '04-JAN-23', 8);
INSERT INTO Claim_Status VALUES(17, 125, 15800, 'Approved', '22-MAY-24', 9);
INSERT INTO Claim_Status VALUES(18, NULL, 12500, 'Rejected', '09-FEB-23', 10);
INSERT INTO Claim_Status VALUES(19, 114, 9200, 'Pending', '15-JUN-24', 11);
INSERT INTO Claim_Status VALUES(20, 108, 13500, 'Approved', '27-MAR-23', 12);
INSERT INTO Claim_Status VALUES(21, 111, 8800, 'Pending', '31-AUG-24', 3);
INSERT INTO Claim_Status VALUES(22, 114, 10200, 'Rejected', '13-OCT-23', 4);
INSERT INTO Claim_Status VALUES(23, 117, 5500, 'Approved', '02-DEC-24', 5);
INSERT INTO Claim_Status VALUES(24, 120, 11700, 'Pending', '18-JUL-23', 6);
INSERT INTO Claim_Status VALUES(25, 123, 9600, 'Approved', '06-APR-24', 7);


--INSERT INTO Transaction_details VALUES(transaction_id, user_id, amount, transaction_type, transaction_date) VALUES
INSERT INTO Transaction_details VALUES(1, 7, 5000, 'Premium Payment', '12-JAN-24');
INSERT INTO Transaction_details VALUES(2, 8, 10000, 'Premium Payment', '25-FEB-23');
INSERT INTO Transaction_details VALUES(3, 9, 12000, 'Claim Settlement', '17-MAR-24');
INSERT INTO Transaction_details VALUES(4, 10, 3000, 'Premium Payment', '05-MAY-23');
INSERT INTO Transaction_details VALUES(5, 11, 8000, 'Premium Payment', '29-SEP-24');
INSERT INTO Transaction_details VALUES(6, 12, 7000, 'Claim Settlement', '08-JUN-23');
INSERT INTO Transaction_details VALUES(7, 13, 11000, 'Premium Payment', '15-OCT-24');
INSERT INTO Transaction_details VALUES(8, 14, 9500, 'Claim Settlement', '23-NOV-23');
INSERT INTO Transaction_details VALUES(9, 15, 15000, 'Premium Payment', '07-APR-24');
INSERT INTO Transaction_details VALUES(10, 16, 4500, 'Claim Settlement', '11-DEC-23');
INSERT INTO Transaction_details VALUES(11, 17, 13200, 'Premium Payment', '14-AUG-24');
INSERT INTO Transaction_details VALUES(12, 18, 8700, 'Claim Settlement', '19-JUL-23');
INSERT INTO Transaction_details VALUES(13, 19, 14500, 'Premium Payment', '05-SEP-24');
INSERT INTO Transaction_details VALUES(14, 20, 9900, 'Premium Payment', '28-OCT-23');
INSERT INTO Transaction_details VALUES(15, 21, 6500, 'Claim Settlement', '30-NOV-24');
INSERT INTO Transaction_details VALUES(16, 22, 7300, 'Premium Payment', '04-JAN-23');
INSERT INTO Transaction_details VALUES(17, 23, 15800, 'Claim Settlement', '22-MAY-24');
INSERT INTO Transaction_details VALUES(18, 24, 12500, 'Premium Payment', '09-FEB-23');
INSERT INTO Transaction_details VALUES(19, 25, 9200, 'Claim Settlement', '15-JUN-24');
INSERT INTO Transaction_details VALUES(20, 5, 13500, 'Premium Payment', '27-MAR-23');
INSERT INTO Transaction_details VALUES(21, 6, 8800, 'Claim Settlement', '31-AUG-24');
INSERT INTO Transaction_details VALUES(22, 3, 10200, 'Premium Payment', '13-OCT-23');
INSERT INTO Transaction_details VALUES(23, 4, 5500, 'Claim Settlement', '02-DEC-24');
INSERT INTO Transaction_details VALUES(24, 1, 11700, 'Premium Payment', '18-JUL-23');
INSERT INTO Transaction_details VALUES(25, 2, 9600, 'Claim Settlement', '06-APR-24');

SELECT * FROM USER_TABLES;

select username,length(username), UPPER(PASSWORD),SUBSTR(ROLE,1,3)
from USERS_LOGIN ORDER BY USERNAME;

SELECT BROKER_NAME,LICENSE_NUMBER, COMMISSION_RATE, STATUS
FROM BROKER_DETAILS
WHERE STATUS = 'Inactive';

SELECT U.USER_ID, U.USERNAME, U.ROLE,B.BROKER_ID,B.BROKER_NAME
FROM USERS_LOGIN U,BROKER_DETAILS B
WHERE U.USER_ID=B.BROKER_ID 
AND STATUS = 'Inactive';

SELECT POLICY_ID, COVERAGE_TYPE, MAX(PREMIUM_AMOUNT),STATUS
FROM POLICY_DETAILS
WHERE POLICY_ID > 110
GROUP BY POLICY_ID, COVERAGE_TYPE, STATUS
HAVING MAX(PREMIUM_AMOUNT) > 10000
ORDER BY POLICY_ID;

SELECT * FROM POLICY_DETAILS
WHERE PREMIUM_AMOUNT > 
(SELECT PREMIUM_AMOUNT FROM POLICY_DETAILS
WHERE ISSUE_DATE = '20-04-24'); 

SELECT * FROM POLICY_DETAILS
WHERE PREMIUM_AMOUNT > ANY
(SELECT PREMIUM_AMOUNT FROM POLICY_DETAILS
WHERE POLICY_ID > 110);

--List of Policies Issued by Brokers
SELECT p.policy_id, u.username, p.coverage_type, p.premium_amount, p.issue_date
FROM Policy_details p
JOIN Users_login u ON p.user_id = u.user_id
WHERE u.role = 'Broker';

SELECT c.claim_id, c.claim_amount, t.transaction_id, t.amount  
FROM CLAIM_STATUS c  
JOIN TRANSACTION_DETAILS t ON c.claim_id = t.transaction_id;

SELECT p.policy_id, SUM(c.claim_amount) AS total_claimed  
FROM POLICY_DETAILS p  
JOIN CLAIM_STATUS c ON p.policy_id = c.policy_id  
GROUP BY p.policy_id
ORDER BY POLICY_ID DESC;

SELECT VEHICLE_ID ,MODEL, REGISTRATION_NUMBER, INSURED_VALUE
FROM VEHICLE_DETAILS
WHERE OWNER_ID > 20;

SELECT T.TRANSACTION_ID, T.USER_ID,T.TRANSACTION_TYPE,P.POLICY_ID, B.BROKER_NAME, B.COMPANY_NAME
FROM TRANSACTION_DETAILS T JOIN POLICY_DETAILS P
ON T.USER_ID = P.USER_ID
JOIN BROKER_DETAILS B
ON P.BROKER_ID = B.BROKER_ID 
WHERE TRANSACTION_TYPE = 'Premium Payment'
AND COVERAGE_TYPE = 'TPL'
ORDER BY AMOUNT;

SELECT C.CLAIM_ID, C.CLAIM_AMOUNT, C.CLAIM_STATUS, B.BROKER_NAME
FROM CLAIM_STATUS C LEFT JOIN BROKER_DETAILS B
ON C.CLAIM_ID = B.BROKER_ID
WHERE CLAIM_STATUS = 'Rejected';

SELECT BROKER_NAME, COMPANY_NAME, STATUS
FROM BROKER_DETAILS
WHERE COMPANY_NAME NOT IN ('Guardian Insurance')
AND STATUS = 'Inactive';

SELECT VEHICLE_ID,MODEL, REGISTRATION_NUMBER, INSURED_VALUE , 
CASE 
WHEN INSURED_VALUE > 300000 THEN INSURED_VALUE * 0.02
WHEN INSURED_VALUE > 800000 THEN INSURED_VALUE * 0.03
WHEN INSURED_VALUE > 1200000 THEN INSURED_VALUE * 0.04
ELSE INSURED_VALUE *0.1
END AS OFFER_VALUE
FROM VEHICLE_DETAILS;

SELECT TRANSACTION_ID, SUM(AMOUNT), TRANSACTION_TYPE,TRANSACTION_DATE
FROM TRANSACTION_DETAILS
WHERE TRANSACTION_TYPE = 'Claim Settlement'
GROUP BY TRANSACTION_ID,TRANSACTION_TYPE,TRANSACTION_DATE
HAVING SUM(AMOUNT) > 10000;








--SELECT PREMIUM_AMOUNT FROM POLICY_DETAILS
--WHERE POLICY_ID > 110;

--List of Policies Issued by Brokers
SELECT p.policy_id, u.username, p.coverage_type, p.premium_amount, p.issue_date
FROM Policy_details p
JOIN Users_login u ON p.user_id = u.user_id
WHERE u.role = 'Broker';

--Get Claim Details with User Info
SELECT c.claim_id, p.policy_id, u.username, c.claim_amount, c.claim_status, c.filed_date
FROM Claim_status c
JOIN Policy_details p ON c.policy_id = p.policy_id
JOIN Users_login u ON p.user_id = u.user_id;


--Business Logic Queries
--Calculate Premium Based on Vehicle Value
/*SELECT user_id, vehicle_id, insured_value, 
       CASE 
          WHEN insured_value < 500000 THEN insured_value * 0.02
          WHEN insured_value BETWEEN 500000 AND 1000000 THEN insured_value * 0.015
          ELSE insured_value * 0.01
       END AS premium_amount
FROM Vehicle_DETAILS;*/

--List of Policies Issued by Brokers
SELECT p.policy_id, u.username, p.coverage_type, p.premium_amount, p.issue_date
FROM Policy_details p
JOIN Users_login u ON p.user_id = u.user_id
WHERE u.role = 'Broker';

--Get Claim Details with User Info
SELECT c.claim_id, p.policy_id, u.username, c.claim_amount, c.claim_status, c.filed_date
FROM Claim_status c
JOIN Policy_details p ON c.policy_id = p.policy_id
JOIN Users_login u ON p.user_id = u.user_id;

--Total Premium Collected Per Month
SELECT TO_CHAR(transaction_date, 'YYYY-MM') AS month, SUM(amount) AS total_premium
FROM Transactions
WHERE transaction_type = 'Premium Payment'
GROUP BY TO_CHAR(transaction_date, 'YYYY-MM');


--Verification Queries
--Check Broker Assignments in Policies
SELECT policy_id, user_id, broker_id, coverage_type, premium_amount, issue_date, status
FROM Policy_details
ORDER BY broker_id;

-- Check Total Policies Assigned to Each Broker
SELECT b.broker_name, COUNT(p.policy_id) AS total_policies
FROM Brokers b
LEFT JOIN Policies p ON b.broker_id = p.broker_id
GROUP BY b.broker_name;


-- Reports
--Total Policies Issued by Each Broker
SELECT u.username AS broker, COUNT(p.policy_id) AS total_policies
FROM Users_login u
JOIN Policy_details p ON u.user_id = p.user_id
WHERE u.role = 'Broker'
GROUP BY u.username;

--Pending Claims Report
SELECT claim_id, policy_id, claim_amount, filed_date
FROM Claim_status
WHERE claim_status = 'Pending';
