/*Project: Human Resource Management System (HRMS)
1. Project Overview
The HRMS helps organizations manage their employees efficiently.
It includes features like employee records, salary processing, leave management, attendance tracking, and performance reviews.
2. Database Schema Design
Tables and Schema*/

select * from user_tables;
select * from user_views;
select * from user_synonyms;

--1. Employees Table
CREATE TABLE Employees_info (
    employee_id NUMBER ,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    phone_number VARCHAR2(15) NOT NULL,
    hire_date DATE NOT NULL,
    job_title VARCHAR2(50) NOT NULL,
    salary NUMBER(10,2) NOT NULL,
    status VARCHAR2(20) CHECK (status IN ('Active', 'Resigned', 'Terminated')),
    created_at DATE not null,
    
     constraint my_emp_emp_id_pk primary key(employee_id),
     constraint my_emp_email_uk unique(email),
     constraint my_emp_phone_number_uk unique(phone_number),
     constraint my_emp_status_ck check (status IN ('Active', 'Resigned', 'Terminated'))
);
select *  from Employees_info;

INSERT INTO Employees_info (employee_id, first_name, last_name, email, phone_number, hire_date, job_title, salary, status, created_at) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '9876543210', TO_DATE('10-MAY-2022', 'DD-MON-YYYY'), 'Software Engineer', 60000.00, 'Active', SYSDATE);

INSERT INTO Employees_info VALUES
(2, 'Jane', 'Smith', 'jane.smith@example.com', '9876543211', TO_DATE('15-AUG-2021', 'DD-MON-YYYY'), 'HR Manager', 70000.00, 'Active', SYSDATE);

INSERT INTO Employees_info VALUES
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', '9876543212', TO_DATE('20-NOV-2020', 'DD-MON-YYYY'), 'Data Analyst', 55000.00, 'Resigned', SYSDATE);

INSERT INTO Employees_info VALUES
(4, 'Robert', 'Brown', 'robert.brown@example.com', '9876543213', TO_DATE('18-MAR-2019', 'DD-MON-YYYY'), 'Project Manager', 90000.00, 'Active', SYSDATE);

INSERT INTO Employees_info VALUES
(5, 'Michael', 'Williams', 'michael.williams@example.com', '9876543214', TO_DATE('25-JUN-2023', 'DD-MON-YYYY'), 'System Administrator', 62000.00, 'Active', SYSDATE);

INSERT INTO Employees_info VALUES
(6, 'Sarah', 'Miller', 'sarah.miller@example.com', '9876543215', TO_DATE('10-SEP-2018', 'DD-MON-YYYY'), 'Network Engineer', 58000.00, 'Resigned', SYSDATE);

INSERT INTO Employees_info VALUES
(7, 'David', 'Taylor', 'david.taylor@example.com', '9876543216', TO_DATE('30-JUL-2022', 'DD-MON-YYYY'), 'UX Designer', 50000.00, 'Active', SYSDATE);

INSERT INTO Employees_info VALUES
(8, 'Emma', 'Anderson', 'emma.anderson@example.com', '9876543217', TO_DATE('12-DEC-2017', 'DD-MON-YYYY'), 'Database Administrator', 65000.00, 'Terminated', SYSDATE);

INSERT INTO Employees_info VALUES
(9, 'William', 'Thomas', 'william.thomas@example.com', '9876543218', TO_DATE('22-FEB-2016', 'DD-MON-YYYY'), 'Finance Manager', 75000.00, 'Resigned', SYSDATE);

INSERT INTO Employees_info VALUES
(10, 'Olivia', 'Martinez', 'olivia.martinez@example.com', '9876543219', TO_DATE('05-APR-2023', 'DD-MON-YYYY'), 'Marketing Specialist', 48000.00, 'Active', SYSDATE);

INSERT INTO Employees_info VALUES
(11, 'James', 'Lee', 'james.lee@example.com', '9876543220', TO_DATE('01-OCT-2021', 'DD-MON-YYYY'), 'Business Analyst', 67000.00, 'Active', SYSDATE);

INSERT INTO Employees_info VALUES
(12, 'Sophia', 'Garcia', 'sophia.garcia@example.com', '9876543221', TO_DATE('14-JUN-2015', 'DD-MON-YYYY'), 'Software Developer', 72000.00, 'Resigned', SYSDATE);

INSERT INTO Employees_info VALUES
(13, 'Benjamin', 'Rodriguez', 'benjamin.rodriguez@example.com', '9876543222', TO_DATE('09-SEP-2019', 'DD-MON-YYYY'), 'DevOps Engineer', 80000.00, 'Active', SYSDATE);

INSERT INTO Employees_info VALUES
(14, 'Ava', 'Lopez', 'ava.lopez@example.com', '9876543223', TO_DATE('27-JAN-2020', 'DD-MON-YYYY'), 'Quality Assurance Engineer', 59000.00, 'Resigned', SYSDATE);

INSERT INTO Employees_info VALUES
(15, 'Mason', 'Harris', 'mason.harris@example.com', '9876543224', TO_DATE('19-MAR-2017', 'DD-MON-YYYY'), 'Legal Advisor', 85000.00, 'Terminated', SYSDATE);

SELECT * FROM EMPLOYEES_INFO;



--2. Departments Table
CREATE TABLE Emp_Departments (
    department_id NUMBER ,
    department_name VARCHAR2(50)NOT NULL,
    manager_id NUMBER,
    
     constraint my_dep_id_pk primary key(department_id),
     constraint my_department_name_uk unique(department_name),
     constraint my_d_manager_id_fk foreign key(manager_id) references Employees_info(employee_id)
);

INSERT INTO Emp_Departments (department_id, department_name, manager_id) VALUES
(1, 'Human Resources', 2);
INSERT INTO Emp_Departments VALUES
(2, 'Finance', 9);
INSERT INTO Emp_Departments VALUES
(3, 'Engineering', 1);
INSERT INTO Emp_Departments VALUES
(4, 'Marketing', 10);
INSERT INTO Emp_Departments VALUES
(5, 'Sales', 15);
INSERT INTO Emp_Departments VALUES
(6, 'Customer Support', 5);
INSERT INTO Emp_Departments VALUES
(7, 'Research & Development', 13);
INSERT INTO Emp_Departments VALUES
(8, 'Legal', 14);
INSERT INTO Emp_Departments VALUES
(9, 'IT Support', 6);
INSERT INTO Emp_Departments VALUES
(10, 'Operations', 7);
INSERT INTO Emp_Departments VALUES
(11, 'Quality Assurance', 12);
INSERT INTO Emp_Departments VALUES
(12, 'Supply Chain', 4);
INSERT INTO Emp_Departments VALUES
(13, 'Public Relations', 11);
INSERT INTO Emp_Departments VALUES
(14, 'Training & Development', 3);
INSERT INTO Emp_Departments VALUES
(15, 'Business Intelligence', 8);

COMMIT;

SELECT * FROM EMP_DEPARTMENTS;

--3. Payroll Table
CREATE TABLE Payroll_details (
    payroll_id NUMBER ,
    employee_id NUMBER ,
    base_salary NUMBER(15,2) NOT NULL,
    bonus NUMBER(15,2) DEFAULT 0,
    deductions NUMBER(15,2) DEFAULT 0,
    net_salary AS (base_salary + bonus - deductions),
    pay_date DATE DEFAULT SYSDATE NOT NULL,
    
     constraint my_payroll_id_pk primary key(payroll_id),
     constraint my_p_employee_id_fk foreign key(employee_id) references Employees_info(employee_id)
    
);
INSERT INTO Payroll_details (payroll_id, employee_id, base_salary, bonus, deductions, pay_date) VALUES
(1, 1, 50000.00, 5000.00, 2000.00, TO_DATE('01-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Payroll_details (payroll_id, employee_id, base_salary, bonus, deductions, pay_date) VALUES 
(2, 2, 60000.00, 7000.00, 2500.00, TO_DATE('01-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Payroll_details (payroll_id, employee_id, base_salary, bonus, deductions, pay_date) VALUES
(3, 3, 55000.00, 6500.00, 1800.00, TO_DATE('01-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Payroll_details (payroll_id, employee_id, base_salary, bonus, deductions, pay_date) VALUES
(4, 4, 58000.00, 6000.00, 2200.00, TO_DATE('01-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Payroll_details (payroll_id, employee_id, base_salary, bonus, deductions, pay_date) VALUES
(5, 5, 45000.00, 4000.00, 1500.00, TO_DATE('01-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Payroll_details (payroll_id, employee_id, base_salary, bonus, deductions, pay_date)VALUES
(6, 6, 62000.00, 8000.00, 2700.00, TO_DATE('01-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Payroll_details (payroll_id, employee_id, base_salary, bonus, deductions, pay_date)VALUES
(7, 7, 48000.00, 4500.00, 1600.00, TO_DATE('01-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Payroll_details (payroll_id, employee_id, base_salary, bonus, deductions, pay_date)VALUES
(8, 8, 53000.00, 6000.00, 2000.00, TO_DATE('01-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Payroll_details (payroll_id, employee_id, base_salary, bonus, deductions, pay_date) VALUES
(9, 9, 59000.00, 7500.00, 2300.00, TO_DATE('01-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Payroll_details (payroll_id, employee_id, base_salary, bonus, deductions, pay_date)VALUES
(10, 10, 64000.00, 9000.00, 3000.00, TO_DATE('01-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Payroll_details (payroll_id, employee_id, base_salary, bonus, deductions, pay_date)VALUES
(11, 11, 52000.00, 5000.00, 1900.00, TO_DATE('01-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Payroll_details (payroll_id, employee_id, base_salary, bonus, deductions, pay_date) VALUES
(12, 12, 61000.00, 8500.00, 2800.00, TO_DATE('01-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Payroll_details (payroll_id, employee_id, base_salary, bonus, deductions, pay_date)VALUES
(13, 13, 57000.00, 7000.00, 2100.00, TO_DATE('01-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Payroll_details (payroll_id, employee_id, base_salary, bonus, deductions, pay_date)VALUES
(14, 14, 49000.00, 5500.00, 1700.00, TO_DATE('01-FEB-2025', 'DD-MON-YYYY'));
INSERT INTO Payroll_details (payroll_id, employee_id, base_salary, bonus, deductions, pay_date) VALUES
(15, 15, 63000.00, 9500.00, 3200.00, TO_DATE('01-FEB-2025', 'DD-MON-YYYY'));

COMMIT;

SELECT * FROM PAYROLL_DETAILS;

--4. Attendance Table
CREATE TABLE Attendance (
    attendance_id NUMBER ,
    employee_id NUMBER ,
    check_in_time DATE NOT NULL,
    check_out_time DATE NOT NULL,
    work_hours NUMBER GENERATED ALWAYS AS (ROUND((check_out_time - check_in_time) * 24, 2)) VIRTUAL,
    
    constraint my_attendance_id_pk primary key(attendance_id),
    constraint my_a_employee_id_fk foreign key(employee_id) references Employees_info(employee_id)
    
);

INSERT INTO Attendance (attendance_id, employee_id, check_in_time, check_out_time) VALUES
(101, 1, TO_DATE('01-FEB-2025 09:00', 'DD-MON-YYYY HH24:MI'), TO_DATE('01-FEB-2025 17:30', 'DD-MON-YYYY HH24:MI'));
INSERT INTO Attendance (attendance_id, employee_id, check_in_time, check_out_time)VALUES
(102, 2, TO_DATE('01-FEB-2025 08:45', 'DD-MON-YYYY HH24:MI'), TO_DATE('01-FEB-2025 17:15', 'DD-MON-YYYY HH24:MI'));
INSERT INTO Attendance (attendance_id, employee_id, check_in_time, check_out_time) VALUES
(103, 3, TO_DATE('01-FEB-2025 09:10', 'DD-MON-YYYY HH24:MI'), TO_DATE('01-FEB-2025 18:00', 'DD-MON-YYYY HH24:MI'));
INSERT INTO Attendance (attendance_id, employee_id, check_in_time, check_out_time)VALUES
(104, 4, TO_DATE('01-FEB-2025 08:30', 'DD-MON-YYYY HH24:MI'), TO_DATE('01-FEB-2025 17:00', 'DD-MON-YYYY HH24:MI'));
INSERT INTO Attendance (attendance_id, employee_id, check_in_time, check_out_time)VALUES
(105, 5, TO_DATE('01-FEB-2025 09:00', 'DD-MON-YYYY HH24:MI'), TO_DATE('01-FEB-2025 17:45', 'DD-MON-YYYY HH24:MI'));
INSERT INTO Attendance (attendance_id, employee_id, check_in_time, check_out_time)VALUES
(106, 6, TO_DATE('01-FEB-2025 09:15', 'DD-MON-YYYY HH24:MI'), TO_DATE('01-FEB-2025 18:30', 'DD-MON-YYYY HH24:MI'));
INSERT INTO Attendance (attendance_id, employee_id, check_in_time, check_out_time)VALUES
(107, 7, TO_DATE('01-FEB-2025 08:50', 'DD-MON-YYYY HH24:MI'), TO_DATE('01-FEB-2025 17:20', 'DD-MON-YYYY HH24:MI'));
INSERT INTO Attendance (attendance_id, employee_id, check_in_time, check_out_time)VALUES
(108, 8, TO_DATE('01-FEB-2025 09:05', 'DD-MON-YYYY HH24:MI'), TO_DATE('01-FEB-2025 17:35', 'DD-MON-YYYY HH24:MI'));
INSERT INTO Attendance (attendance_id, employee_id, check_in_time, check_out_time)VALUES
(109, 9, TO_DATE('01-FEB-2025 08:40', 'DD-MON-YYYY HH24:MI'), TO_DATE('01-FEB-2025 17:10', 'DD-MON-YYYY HH24:MI'));
INSERT INTO Attendance (attendance_id, employee_id, check_in_time, check_out_time)VALUES
(110, 10, TO_DATE('01-FEB-2025 09:20', 'DD-MON-YYYY HH24:MI'), TO_DATE('01-FEB-2025 18:15', 'DD-MON-YYYY HH24:MI'));
INSERT INTO Attendance (attendance_id, employee_id, check_in_time, check_out_time)VALUES
(111, 11, TO_DATE('01-FEB-2025 08:55', 'DD-MON-YYYY HH24:MI'), TO_DATE('01-FEB-2025 17:25', 'DD-MON-YYYY HH24:MI'));
INSERT INTO Attendance (attendance_id, employee_id, check_in_time, check_out_time)VALUES
(112, 12, TO_DATE('01-FEB-2025 09:30', 'DD-MON-YYYY HH24:MI'), TO_DATE('01-FEB-2025 18:45', 'DD-MON-YYYY HH24:MI'));
INSERT INTO Attendance (attendance_id, employee_id, check_in_time, check_out_time)VALUES
(113, 13, TO_DATE('01-FEB-2025 08:35', 'DD-MON-YYYY HH24:MI'), TO_DATE('01-FEB-2025 17:05', 'DD-MON-YYYY HH24:MI'));
INSERT INTO Attendance (attendance_id, employee_id, check_in_time, check_out_time)VALUES
(114, 14, TO_DATE('01-FEB-2025 09:10', 'DD-MON-YYYY HH24:MI'), TO_DATE('01-FEB-2025 17:40', 'DD-MON-YYYY HH24:MI'));
INSERT INTO Attendance (attendance_id, employee_id, check_in_time, check_out_time)VALUES
(115, 15, TO_DATE('01-FEB-2025 09:25', 'DD-MON-YYYY HH24:MI'), TO_DATE('01-FEB-2025 18:50', 'DD-MON-YYYY HH24:MI'));

COMMIT;

SELECT * FROM ATTENDANCE;


--5. Leave Requests Table
CREATE TABLE LeaveRequests (
    leave_id NUMBER,
    employee_id NUMBER,
    leave_type VARCHAR2(20),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR2(20) ,
    requested_on DATE DEFAULT SYSDATE,
    
    constraint my_leave_id_pk primary key(leave_id),
    constraint my_l_employee_id_fk foreign key(employee_id) references Employees_info(employee_id),
    constraint my_leave_type_ck check (leave_type IN ('Sick', 'Casual', 'Annual', 'Maternity', 'Paternity')),
    constraint my_leave_status_ck CHECK (status IN ('Pending', 'Approved', 'Rejected'))

    
);
INSERT INTO LeaveRequests (leave_id, employee_id, leave_type, start_date, end_date, status, requested_on) VALUES 
    (101, 1, 'Sick', TO_DATE('01-MAR-2025', 'DD-MON-YYYY'), TO_DATE('03-MAR-2025', 'DD-MON-YYYY'), 'Pending', SYSDATE);
INSERT INTO LeaveRequests (leave_id, employee_id, leave_type, start_date, end_date, status, requested_on) VALUES 
    (102, 2, 'Casual', TO_DATE('25-FEB-2025', 'DD-MON-YYYY'), TO_DATE('26-FEB-2025', 'DD-MON-YYYY'), 'Approved', SYSDATE);
INSERT INTO LeaveRequests (leave_id, employee_id, leave_type, start_date, end_date, status, requested_on) VALUES 
    ( 103, 3, 'Annual', TO_DATE('10-APR-2025', 'DD-MON-YYYY'), TO_DATE('20-APR-2025', 'DD-MON-YYYY'), 'Rejected', SYSDATE);
INSERT  INTO LeaveRequests (leave_id, employee_id, leave_type, start_date, end_date, status, requested_on) VALUES 
    ( 104, 4, 'Maternity', TO_DATE('01-JUN-2025', 'DD-MON-YYYY'), TO_DATE('31-AUG-2025', 'DD-MON-YYYY'), 'Approved', SYSDATE);
INSERT  INTO LeaveRequests (leave_id, employee_id, leave_type, start_date, end_date, status, requested_on) VALUES 
    ( 105, 5, 'Sick', TO_DATE('05-MAR-2025', 'DD-MON-YYYY'), TO_DATE('06-MAR-2025', 'DD-MON-YYYY'), 'Pending', SYSDATE);
INSERT INTO LeaveRequests (leave_id, employee_id, leave_type, start_date, end_date, status, requested_on) VALUES 
    ( 106, 6, 'Casual', TO_DATE('15-MAR-2025', 'DD-MON-YYYY'), TO_DATE('16-MAR-2025', 'DD-MON-YYYY'), 'Approved', SYSDATE);
   INSERT INTO LeaveRequests (leave_id, employee_id, leave_type, start_date, end_date, status, requested_on) VALUES 
    ( 107, 7, 'Annual', TO_DATE('01-JUL-2025', 'DD-MON-YYYY'), TO_DATE('15-JUL-2025', 'DD-MON-YYYY'), 'Rejected', SYSDATE);
    INSERT INTO LeaveRequests (leave_id, employee_id, leave_type, start_date, end_date, status, requested_on) VALUES 
    (108, 8,  'Paternity', TO_DATE('10-MAY-2025', 'DD-MON-YYYY'), TO_DATE('24-MAY-2025', 'DD-MON-YYYY'), 'Approved', SYSDATE);
   INSERT INTO LeaveRequests (leave_id, employee_id, leave_type, start_date, end_date, status, requested_on) VALUES 
    ( 109, 9, 'Sick', TO_DATE('28-FEB-2025', 'DD-MON-YYYY'), TO_DATE('01-MAR-2025', 'DD-MON-YYYY'), 'Pending', SYSDATE);
 INSERT INTO LeaveRequests (leave_id, employee_id, leave_type, start_date, end_date, status, requested_on) VALUES 
    ( 110, 10, 'Casual', TO_DATE('05-APR-2025', 'DD-MON-YYYY'), TO_DATE('06-APR-2025', 'DD-MON-YYYY'), 'Approved', SYSDATE);
INSERT INTO LeaveRequests (leave_id, employee_id, leave_type, start_date, end_date, status, requested_on) VALUES 
    ( 111, 11, 'Annual', TO_DATE('10-AUG-2025', 'DD-MON-YYYY'), TO_DATE('25-AUG-2025', 'DD-MON-YYYY'), 'Rejected', SYSDATE);
INSERT INTO LeaveRequests (leave_id, employee_id, leave_type, start_date, end_date, status, requested_on) VALUES 
    ( 112, 12, 'Maternity', TO_DATE('20-JUN-2025', 'DD-MON-YYYY'), TO_DATE('20-SEP-2025', 'DD-MON-YYYY'), 'Approved', SYSDATE);
INSERT  INTO LeaveRequests (leave_id, employee_id, leave_type, start_date, end_date, status, requested_on) VALUES 
    ( 113, 13, 'Sick', TO_DATE('07-MAR-2025', 'DD-MON-YYYY'), TO_DATE('09-MAR-2025', 'DD-MON-YYYY'), 'Pending', SYSDATE);
INSERT INTO LeaveRequests (leave_id, employee_id, leave_type, start_date, end_date, status, requested_on) VALUES 
    ( 114, 14, 'Casual', TO_DATE('15-APR-2025', 'DD-MON-YYYY'), TO_DATE('16-APR-2025', 'DD-MON-YYYY'), 'Approved', SYSDATE);
 INSERT  INTO LeaveRequests (leave_id, employee_id, leave_type, start_date, end_date, status, requested_on) VALUES 
    ( 115, 15, 'Annual', TO_DATE('01-SEP-2025', 'DD-MON-YYYY'), TO_DATE('10-SEP-2025', 'DD-MON-YYYY'), 'Rejected', SYSDATE);
    
    COMMIT;
    
SELECT * FROM LeaveRequests;


--6. Performance Reviews Table
CREATE TABLE Performance_Reviews (
    review_id NUMBER,
    employee_id NUMBER,
    review_date DATE DEFAULT SYSDATE NOT NULL,
    rating NUMBER CHECK (rating BETWEEN 1 AND 5),
    comments VARCHAR2(255),
    
    constraint my_review_id_pk primary key(review_id),
    constraint my_pr_employee_id_fk foreign key(employee_id) references Employees_info(employee_id),
    constraint my_rating_ck CHECK (rating BETWEEN 1 AND 5)
);

INSERT INTO Performance_Reviews (review_id, employee_id, review_date, rating, comments) 
VALUES (101, 1, TO_DATE('02-MAR-2025', 'DD-MON-YYYY'), 4, 'Consistently meets expectations.');

INSERT INTO Performance_Reviews (review_id, employee_id, review_date, rating, comments) 
VALUES (102, 2, TO_DATE('18-FEB-2025', 'DD-MON-YYYY'), 5, 'Outstanding contribution to the team.');

INSERT INTO Performance_Reviews (review_id, employee_id, review_date, rating, comments) 
VALUES (103, 3, TO_DATE('12-JAN-2025', 'DD-MON-YYYY'), 3, 'Needs improvement in project management.');

INSERT INTO Performance_Reviews (review_id, employee_id, review_date, rating, comments) 
VALUES (104, 4, TO_DATE('22-DEC-2024', 'DD-MON-YYYY'), 2, 'Lacks attention to detail, requires mentoring.');

INSERT INTO Performance_Reviews (review_id, employee_id, review_date, rating, comments) 
VALUES (105, 5, TO_DATE('28-NOV-2024', 'DD-MON-YYYY'), 4, 'Great at collaboration and teamwork.');

INSERT INTO Performance_Reviews (review_id, employee_id, review_date, rating, comments) 
VALUES (106, 6, TO_DATE('14-OCT-2024', 'DD-MON-YYYY'), 5, 'Excellent leadership skills.');

INSERT INTO Performance_Reviews (review_id, employee_id, review_date, rating, comments) 
VALUES (107, 7, TO_DATE('07-SEP-2024', 'DD-MON-YYYY'), 3, 'Satisfactory performance with some gaps.');

INSERT INTO Performance_Reviews (review_id, employee_id, review_date, rating, comments) 
VALUES (108, 8, TO_DATE('01-AUG-2024', 'DD-MON-YYYY'), 2, 'Frequently misses deadlines.');

INSERT INTO Performance_Reviews (review_id, employee_id, review_date, rating, comments) 
VALUES (109, 9, TO_DATE('17-JUL-2024', 'DD-MON-YYYY'), 4, 'Shows strong technical skills.');

INSERT INTO Performance_Reviews (review_id, employee_id, review_date, rating, comments) 
VALUES (110, 10, TO_DATE('12-JUN-2024', 'DD-MON-YYYY'), 5, 'Highly motivated and result-oriented.');

INSERT INTO Performance_Reviews (review_id, employee_id, review_date, rating, comments) 
VALUES (111, 11, TO_DATE('24-MAY-2024', 'DD-MON-YYYY'), 2, 'Struggles with communication and teamwork.');

INSERT INTO Performance_Reviews (review_id, employee_id, review_date, rating, comments) 
VALUES (112, 12, TO_DATE('20-APR-2024', 'DD-MON-YYYY'), 3, 'Decent performance but lacks initiative.');

INSERT INTO Performance_Reviews (review_id, employee_id, review_date, rating, comments) 
VALUES (113, 13, TO_DATE('10-MAR-2024', 'DD-MON-YYYY'), 4, 'Good analytical skills and problem-solving.');

INSERT INTO Performance_Reviews (review_id, employee_id, review_date, rating, comments) 
VALUES (114, 14, TO_DATE('28-FEB-2024', 'DD-MON-YYYY'), 5, 'Always exceeds expectations.');

INSERT INTO Performance_Reviews (review_id, employee_id, review_date, rating, comments) 
VALUES (115, 15, TO_DATE('12-JAN-2024', 'DD-MON-YYYY'), 3, 'Meets expectations but needs better planning.');

COMMIT;

SELECT * FROM PERFORMANCE_REVIEWS;


SELECT * FROM USER_TABLES;

--QUERIES

SELECT EMPLOYEE_ID,JOB_TITLE, UPPER(SUBSTR(FIRST_NAME,1,4)) AS NAME
FROM EMPLOYEES_INFO;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, STATUS
FROM EMPLOYEES_INFO
WHERE JOB_TITLE = 'Software Engineer';

SELECT DEPARTMENT_ID,DEPARTMENT_NAME
FROM EMP_DEPARTMENTS
WHERE DEPARTMENT_NAME IN('Finance','Sales');

SELECT EMPLOYEE_ID, FIRST_NAME, JOB_TITLE, SALARY,
CASE 
WHEN SALARY > 50000 THEN SALARY * 0.02
WHEN SALARY > 70000 THEN SALARY * 0.03
WHEN SALARY > 90000 THEN SALARY * 0.04
ELSE SALARY *0.1
END AS SAL_INCREMENT
FROM EMPLOYEES_INFO;

SELECT E.EMPLOYEE_ID,E.FIRST_NAME, P.PAYROLL_ID, P.NET_SALARY
FROM EMPLOYEES_INFO E, PAYROLL_DETAILS P
WHERE E.EMPLOYEE_ID = P.PAYROLL_ID;

SELECT PAYROLL_ID, SUM(BONUS), PAY_DATE
FROM PAYROLL_DETAILS
GROUP BY PAYROLL_ID, PAY_DATE
HAVING SUM(BONUS) > 5000;

SELECT ATTENDANCE_ID, WORK_HOURS
FROM ATTENDANCE
WHERE WORK_HOURS = 8.5;

SELECT LEAVE_ID, LEAVE_TYPE, STATUS
FROM LEAVEREQUESTS
WHERE UPPER(LEAVE_TYPE) = 'CASUAL'
AND UPPER(STATUS) = 'APPROVED';

SELECT * FROM EMPLOYEES_INFO
WHERE SALARY > ANY
(SELECT SALARY FROM EMPLOYEES_INFO
WHERE EMPLOYEE_ID > 5);

SELECT R.REVIEW_ID, R.EMPLOYEE_ID,E.EMPLOYEE_ID,E.FIRST_NAME, R.COMMENTS
FROM PERFORMANCE_REVIEWS R JOIN EMPLOYEES_INFO E
ON R.EMPLOYEE_ID = E.EMPLOYEE_ID
WHERE RATING > 3;


--VIEW
CREATE VIEW VW_EMP_MAR_05 AS
 SELECT * FROM EMPLOYEES_INFO
 WHERE SALARY > 50000;
 
 SELECT * FROM VW_EMP_MAR_05;
 
 
--SYNONYM
CREATE SYNONYM LEV_REQ
 FOR LEAVEREQUESTS;
 
--ANALYTICAL FUNCTION
SELECT * FROM 
(
SELECT FIRST_NAME,
RANK()OVER(ORDER BY SALARY DESC) RANK
FROM EMPLOYEES_INFO
)
WHERE RANK = 3;

SELECT * FROM 
(
SELECT FIRST_NAME,
DENSE_RANK()OVER(ORDER BY SALARY ASC) RANK
FROM EMPLOYEES_INFO
)
WHERE RANK = 10;

--LEAD()| LAG()
SELECT FIRST_NAME,LAST_NAME,EMPLOYEE_ID,SALARY,
LAG(SALARY) OVER(ORDER BY SALARY ) AS PREVIOUS_VALUE
FROM EMPLOYEES_INFO;

SELECT FIRST_NAME,LAST_NAME,EMPLOYEE_ID,SALARY,
LEAD(SALARY) OVER(ORDER BY SALARY ) AS NEXT_VALUE
FROM EMPLOYEES_INFO;



 




