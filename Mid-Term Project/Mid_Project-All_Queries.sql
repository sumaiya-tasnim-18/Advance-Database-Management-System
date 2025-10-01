-- Tables Creation

-- 1. Admin
CREATE TABLE Admin (
    Admin_ID INT PRIMARY KEY,
    Admin_name VARCHAR(100) NOT NULL,
    Admin_phone VARCHAR(15),
    Admin_email VARCHAR(100) UNIQUE
);
DESCRIBE Admin

-- 2. Shop
CREATE TABLE Shop (
    Shop_ID INT PRIMARY KEY,
    Shop_name VARCHAR(100) NOT NULL,
    Shop_status VARCHAR(20),
    Shop_type VARCHAR(50),
    Shop_floor INT,
    A_ID INT,
    FOREIGN KEY (A_ID) REFERENCES Admin(Admin_ID)
);
DESCRIBE Shop

-- 3. Facility
CREATE TABLE Facility (
    Facility_ID INT PRIMARY KEY,
    Facility_name VARCHAR(100),
    Availability_Status VARCHAR(20),
    A_ID INT,
    FOREIGN KEY (A_ID) REFERENCES Admin(Admin_ID)
);
DESCRIBE Facility

-- 4. Employee
CREATE TABLE Employee (
    Employee_ID INT PRIMARY KEY,
    Employee_name VARCHAR(100),
    Emp_salary DECIMAL(10,2),
    Employee_role VARCHAR(50),
    Employee_phone VARCHAR(15),
    Emp_shift_time VARCHAR(20),
    A_ID INT,
    FOREIGN KEY (A_ID) REFERENCES Admin(Admin_ID)
); 
DESCRIBE Employee

-- 5. Request
CREATE TABLE Request (
    Request_ID INT PRIMARY KEY,
    Issue_description VARCHAR(255),
    Reported_by VARCHAR(100),
    Priority_level VARCHAR(20),
    F_ID INT,
    FOREIGN KEY (F_ID) REFERENCES Facility(Facility_ID)
);
DESCRIBE Request

-- 6. Tenant
CREATE TABLE Tenant (
    Tenant_ID INT PRIMARY KEY,
    Tenant_name VARCHAR(100),
    Tenant_email VARCHAR(100) UNIQUE,
    Tenant_phone VARCHAR(15),
    Tenant_ID_proof VARCHAR(50)
);
DESCRIBE Tenant

-- 7. Payment
CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Amount DECIMAL(10,2),
    Payment_date DATE,
    Payment_method VARCHAR(50),
    T_ID INT,
    FOREIGN KEY (T_ID) REFERENCES Tenant(Tenant_ID)
);
DESCRIBE Payment


-- 8. Booking
CREATE TABLE Booking (
    Booking_ID INT PRIMARY KEY,
    Booking_rent DECIMAL(10,2),
    Lease_start_date DATE,
    Lease_end_date DATE,
    Booking_payment_status VARCHAR(20),
    S_ID INT,
    FOREIGN KEY (S_ID) REFERENCES Shop(Shop_ID)
);
DESCRIBE Booking

-- 9. Customer
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_email VARCHAR(100),
    Customer_phone VARCHAR(15),
    Visit_date DATE,
    Feedback VARCHAR(255),
    S_ID INT,
    FOREIGN KEY (S_ID) REFERENCES Shop(Shop_ID)
);
DESCRIBE Customer

-- 10. Guard
CREATE TABLE Guard (
    Guard_ID INT PRIMARY KEY,
    Guard_name VARCHAR(100),
    Guard_phone VARCHAR(15),
    Guard_shift_time VARCHAR(20),
    Guard_salary DECIMAL(10,2),
    E_ID INT,
    FOREIGN KEY (E_ID) REFERENCES Employee(Employee_ID)
);
DESCRIBE Guard

-- Data Insertion

-- Admin 
INSERT INTO Admin VALUES (1, 'John Smith', '01710000001', 'john.smith@example.com');
INSERT INTO Admin VALUES (2, 'Emily Davis', '01710000002', 'emily.davis@example.com');
INSERT INTO Admin VALUES (3, 'Robert Wilson', '01710000003', 'robert.wilson@example.com');
INSERT INTO Admin VALUES (4, 'Sophia Brown', '01710000004', 'sophia.brown@example.com');
INSERT INTO Admin VALUES (5, 'David Lee', '01710000005', 'david.lee@example.com');

Select * from Admin;

-- Shop
INSERT INTO Shop VALUES (101, 'Fashion Hub', 'Open', 'Clothing', 1, 1);
INSERT INTO Shop VALUES (102, 'Tech World', 'Open', 'Electronics', 2, 2);
INSERT INTO Shop VALUES (103, 'Book Corner', 'Closed', 'Books', 1, 3);
INSERT INTO Shop VALUES (104, 'Grocery Mart', 'Open', 'Groceries', 1, 4);
INSERT INTO Shop VALUES (105, 'Sports Zone', 'Open', 'Sports', 3, 5);

select * from Shop;

-- Facility

INSERT INTO Facility VALUES (201, 'Parking Lot', 'Available', 1);
INSERT INTO Facility VALUES (202, 'Food Court', 'Available', 2);
INSERT INTO Facility VALUES (203, 'Play Area', 'Under Maintenance', 3);
INSERT INTO Facility VALUES (204, 'Cinema Hall', 'Available', 4);
INSERT INTO Facility VALUES (205, 'ATM Booth', 'Available', 5);

select * from Facility;

-- Employee

INSERT INTO Employee VALUES (301, 'Alex Johnson', 25000, 'Manager', '01710000011', 'Morning', 1);
INSERT INTO Employee VALUES (302, 'Sarah Lee', 18000, 'Cashier', '01710000012', 'Evening', 2);
INSERT INTO Employee VALUES (303, 'Mark Adams', 22000, 'Supervisor', '01710000013', 'Night', 3);
INSERT INTO Employee VALUES (304, 'Emma Clark', 17000, 'Salesperson', '01710000014', 'Morning', 4);
INSERT INTO Employee VALUES (305, 'Daniel Evans', 24000, 'Technician', '01710000015', 'Evening', 5);

select * from Employee;

-- Request
INSERT INTO Request VALUES (401, 'Broken AC in Food Court', 'Manager', 'High', 202);
INSERT INTO Request VALUES (402, 'Lighting issue in Parking', 'Guard', 'Medium', 201);
INSERT INTO Request VALUES (403, 'Play area swings damaged', 'Customer', 'High', 203);
INSERT INTO Request VALUES (404, 'Cinema projector not working', 'Technician', 'High', 204);
INSERT INTO Request VALUES (405, 'ATM cash refill request', 'Customer', 'Medium', 205);

select * from Request;

-- Tenant
INSERT INTO Tenant VALUES (501, 'Michael Brown', 'michael.brown@example.com', '01710000021', 'NID123456');
INSERT INTO Tenant VALUES (502, 'Sophia Turner', 'sophia.turner@example.com', '01710000022', 'NID654321');
INSERT INTO Tenant VALUES (503, 'Liam Harris', 'liam.harris@example.com', '01710000023', 'NID112233');
INSERT INTO Tenant VALUES (504, 'Emma Wright', 'emma.wright@example.com', '01710000024', 'NID445566');
INSERT INTO Tenant VALUES (505, 'Noah King', 'noah.king@example.com', '01710000025', 'NID778899');

select * from Tenant;

-- Payment
INSERT INTO Payment VALUES (601, 15000, TO_DATE('2025-08-01','YYYY-MM-DD'), 'Cash', 501);
INSERT INTO Payment VALUES (602, 12000, TO_DATE('2025-08-02','YYYY-MM-DD'), 'Bank Transfer', 502);
INSERT INTO Payment VALUES (603, 18000, TO_DATE('2025-08-03','YYYY-MM-DD'), 'Card', 503);
INSERT INTO Payment VALUES (604, 16000, TO_DATE('2025-08-04','YYYY-MM-DD'), 'Cash', 504);
INSERT INTO Payment VALUES (605, 14000, TO_DATE('2025-08-05','YYYY-MM-DD'), 'Bank Transfer', 505);

select * from Payment;

-- Booking
INSERT INTO Booking VALUES
(701, 20000, TO_DATE('2025-08-01','YYYY-MM-DD'), TO_DATE('2026-07-31','YYYY-MM-DD'), 'Paid', 101);

INSERT INTO Booking VALUES
(702, 25000, TO_DATE('2025-08-02','YYYY-MM-DD'), TO_DATE('2026-08-01','YYYY-MM-DD'), 'Unpaid', 102);

INSERT INTO Booking VALUES
(703, 18000, TO_DATE('2025-08-03','YYYY-MM-DD'), TO_DATE('2026-08-02','YYYY-MM-DD'), 'Paid', 103);

INSERT INTO Booking VALUES
(704, 22000, TO_DATE('2025-08-04','YYYY-MM-DD'), TO_DATE('2026-08-03','YYYY-MM-DD'), 'Paid', 104);

INSERT INTO Booking VALUES
(705, 24000, TO_DATE('2025-08-05','YYYY-MM-DD'), TO_DATE('2026-08-04','YYYY-MM-DD'), 'Unpaid', 105);

select * from Booking;

-- Customer
INSERT INTO Customer VALUES (801, 'Liam Wilson', 'liam.wilson@example.com', '01710000031', TO_DATE('2025-08-01','YYYY-MM-DD'), 'Great service', 101);
INSERT INTO Customer VALUES (802, 'Olivia White', 'olivia.white@example.com', '01710000032', TO_DATE('2025-08-02','YYYY-MM-DD'), 'Nice products', 102);
INSERT INTO Customer VALUES (803, 'Noah Thompson', 'noah.thompson@example.com', '01710000033', TO_DATE('2025-08-03','YYYY-MM-DD'), 'Loved the store', 103);
INSERT INTO Customer VALUES (804, 'Emma Martinez', 'emma.martinez@example.com', '01710000034', TO_DATE('2025-08-04','YYYY-MM-DD'), 'Helpful staff', 104);
INSERT INTO Customer VALUES (805, 'Lucas Robinson', 'lucas.robinson@example.com', '01710000035', TO_DATE('2025-08-05','YYYY-MM-DD'), 'Affordable prices', 105);

select * from Customer;

-- Guard
INSERT INTO Guard VALUES (901, 'David Miller', '01710000041', 'Night', 15000, 301);
INSERT INTO Guard VALUES (902, 'Emma Scott', '01710000042', 'Day', 14000, 302);
INSERT INTO Guard VALUES (903, 'Liam Parker', '01710000043', 'Night', 15500, 303);
INSERT INTO Guard VALUES (904, 'Sophia Hall', '01710000044', 'Day', 14500, 304);
INSERT INTO Guard VALUES (905, 'Ethan Lewis', '01710000045', 'Night', 16000, 305);

select * from Guard;


-- Query Writing Using PL/SQL
-- Basic PL/SQL
-- Project Name:Mall Management System, Semester:Summer 2024-25, Course:Advance Database Management System, Section:A

-- 2 variables
DECLARE
    v_emp_salary   NUMBER(10,2);
    v_guard_salary NUMBER(10,2);
BEGIN
    SELECT Emp_salary INTO v_emp_salary
    FROM Employee
    WHERE Employee_ID = 301;

    SELECT SUM(Guard_salary) INTO v_guard_salary
    FROM Guard
    WHERE E_ID = 301;

    DBMS_OUTPUT.PUT_LINE('Employee Salary: ' || v_emp_salary);
    DBMS_OUTPUT.PUT_LINE('Total Guard Salary under Employee: ' || NVL(v_guard_salary, 0));
    DBMS_OUTPUT.PUT_LINE('Combined Total Salary: ' || (v_emp_salary + NVL(v_guard_salary, 0)));
END;
/


-- Project Name:Mall Management System, Semester:Summer 2024-25, Course:Advance Database Management System, Section:A
-- Using 2 Operators
DECLARE
    v_payment_amount NUMBER(10,2);
    v_booking_rent   NUMBER(10,2);
    v_balance        NUMBER(10,2);
BEGIN
    SELECT Amount INTO v_payment_amount
    FROM Payment
    WHERE T_ID = 501;

    SELECT Booking_rent INTO v_booking_rent
    FROM Booking
    WHERE S_ID = 101;

    v_balance := v_payment_amount - v_booking_rent;  -- operator 1: subtraction
    v_balance := v_balance * 1;                     -- operator 2: multiplication (dummy to show 2 operators)

    DBMS_OUTPUT.PUT_LINE('Balance Amount: ' || v_balance);
END;
/


-- Project Name:Mall Management System, Semester:Summer 2024-25, Course:Advance Database Management System, Section:A
-- -2 single-row function
DECLARE
    v_name  VARCHAR2(100);
    v_role  VARCHAR2(50);
BEGIN
    SELECT UPPER(Employee_name), INITCAP(Employee_role)
    INTO v_name, v_role
    FROM Employee
    WHERE Employee_ID = 302;

    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Employee Role: ' || v_role);
END;
/

-- Project Name:Mall Management System, Semester:Summer 2024-25, Course:Advance Database Management System, Section:A
-- 2 group function

DECLARE
    v_total  NUMBER(10,2);
    v_avg    NUMBER(10,2);
BEGIN
    SELECT SUM(Amount), AVG(Amount)
    INTO v_total, v_avg
    FROM Payment;

    DBMS_OUTPUT.PUT_LINE('Total Payment: ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Average Payment: ' || v_avg);
END;
/

-- Project Name:Mall Management System, Semester:Summer 2024-25, Course:Advance Database Management System, Section:A
-- Using 2 loop
DECLARE
BEGIN
    FOR rec IN (SELECT Shop_name, Shop_type FROM Shop) LOOP
        DBMS_OUTPUT.PUT_LINE('Shop: ' || rec.Shop_name || ' | Type: ' || rec.Shop_type);
    END LOOP;

    FOR i IN 101..105 LOOP
        DBMS_OUTPUT.PUT_LINE('Shop ID: ' || i);
    END LOOP;
END;
/



-- Project Name:Mall Management System, Semester:Summer 2024-25, Course:Advance Database Management System, Section:A
-- Using 2 conditional statements
DECLARE
    v_status Booking.Booking_payment_status%TYPE;
BEGIN
    SELECT Booking_payment_status INTO v_status
    FROM Booking
    WHERE Booking_ID = 702;

    -- IF statement
    IF v_status = 'Paid' THEN
        DBMS_OUTPUT.PUT_LINE('Booking is Paid');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Booking is Not Paid');
    END IF;

    -- CASE statement
    CASE v_status
        WHEN 'Paid' THEN DBMS_OUTPUT.PUT_LINE('Status = Paid');
        WHEN 'Unpaid' THEN DBMS_OUTPUT.PUT_LINE('Status = Unpaid');
        ELSE DBMS_OUTPUT.PUT_LINE('Status Unknown');
    END CASE;
END;
/

-- Project Name:Mall Management System, Semester:Summer 2024-25, Course:Advance Database Management System, Section:A
-- Using 2 subquery

DECLARE
    v_emp_name Employee.Employee_name%TYPE;
BEGIN
    SELECT Employee_name INTO v_emp_name
    FROM Employee
    WHERE Emp_salary = (SELECT MAX(Emp_salary) FROM Employee);

    DBMS_OUTPUT.PUT_LINE('Employee with Max Salary: ' || v_emp_name);

    -- Second subquery example: Find Shop name managed by Admin_ID = (subquery)
    DECLARE
        v_shop_name Shop.Shop_name%TYPE;
    BEGIN
        SELECT Shop_name INTO v_shop_name
        FROM Shop
        WHERE A_ID = (SELECT Admin_ID FROM Admin WHERE Admin_name = 'Emily Davis');

        DBMS_OUTPUT.PUT_LINE('Shop managed by Emily Davis: ' || v_shop_name);
    END;
END;
/

-- Project Name:Mall Management System, Semester:Summer 2024-25, Course:Advance Database Management System, Section:A
-- Using 2 joining
DECLARE
BEGIN
    FOR rec IN (SELECT E.Employee_name, G.Guard_name
                FROM Employee E
                JOIN Guard G ON E.Employee_ID = G.E_ID) LOOP
        DBMS_OUTPUT.PUT_LINE('Employee: ' || rec.Employee_name || ' | Guard: ' || rec.Guard_name);
    END LOOP;

    FOR rec2 IN (SELECT S.Shop_name, A.Admin_name
                 FROM Shop S
                 JOIN Admin A ON S.A_ID = A.Admin_ID) LOOP
        DBMS_OUTPUT.PUT_LINE('Shop: ' || rec2.Shop_name || ' | Admin: ' || rec2.Admin_name);
    END LOOP;
END;
/


-- Project Name:Mall Management System, Semester:Summer 2024-25, Course:Advance Database Management System, Section:A
-- Advance PL/SQL
-- Using 2 stored function
CREATE OR REPLACE FUNCTION Total_Salary(emp_id IN NUMBER)
RETURN NUMBER
IS
    v_emp_salary   NUMBER(10,2);
    v_guard_salary NUMBER(10,2);
BEGIN
    SELECT Emp_salary INTO v_emp_salary
    FROM Employee
    WHERE Employee_ID = emp_id;

    SELECT NVL(SUM(Guard_salary),0) INTO v_guard_salary
    FROM Guard
    WHERE E_ID = emp_id;

    RETURN v_emp_salary + v_guard_salary;
END;
/
SELECT Total_Salary(301) AS total_salary FROM dual;

-- Project Name:Mall Management System, Semester:Summer 2024-25, Course:Advance Database Management System, Section:A
-- Using 2 stored function

CREATE OR REPLACE FUNCTION Tenant_Total_Payment(t_id IN NUMBER)
RETURN NUMBER
IS
    v_total NUMBER(10,2);
BEGIN
    SELECT NVL(SUM(Amount),0) INTO v_total
    FROM Payment
    WHERE T_ID = t_id;

    RETURN v_total;
END;
/

SELECT Tenant_Total_Payment(501) AS total_payment
FROM dual;



-- Project Name:Mall Management System, Semester:Summer 2024-25, Course:Advance Database Management System, Section:A
-- 2 stored procedure
CREATE OR REPLACE PROCEDURE Show_Shops_Admins
IS
BEGIN
    FOR rec IN (SELECT S.Shop_name, A.Admin_name
                FROM Shop S
                JOIN Admin A ON S.A_ID = A.Admin_ID) LOOP
        DBMS_OUTPUT.PUT_LINE('Shop: ' || rec.Shop_name || ' | Admin: ' || rec.Admin_name);
    END LOOP;
END;
/

BEGIN
    Show_Shops_Admins;  -- Call the procedure
END;
/

-- Project Name:Mall Management System, Semester:Summer 2024-25, Course:Advance Database Management System, Section:A
-- 2 stored procedure

CREATE OR REPLACE PROCEDURE Show_Emp_Guard_Salary(emp_id IN NUMBER)
IS
    v_total_salary NUMBER(10,2);
BEGIN
    v_total_salary := Total_Salary(emp_id);
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || emp_id || ' | Total Salary (including guards): ' || v_total_salary);
END;
/


BEGIN
    Show_Emp_Guard_Salary(301);
    Show_Emp_Guard_Salary(302);
    Show_Emp_Guard_Salary(303);
END;
/


-- Project Name:Mall Management System, Semester:Summer 2024-25, Course:Advance Database Management System, Section:A
-2 table-based record

DECLARE
    TYPE emp_table_type IS TABLE OF Employee%ROWTYPE;
    emp_table emp_table_type;
BEGIN
    SELECT * BULK COLLECT INTO emp_table FROM Employee;
    FOR i IN 1..emp_table.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Employee Name: ' || emp_table(i).Employee_name || ' | Salary: ' || emp_table(i).Emp_salary);
    END LOOP;
END;
/

-- Project Name:Mall Management System, Semester:Summer 2024-25, Course:Advance Database Management System, Section:A
-2 table-based record

DECLARE
    TYPE tenant_table_type IS TABLE OF Tenant%ROWTYPE;
    tenant_table tenant_table_type;
BEGIN
    SELECT * BULK COLLECT INTO tenant_table FROM Tenant;
    FOR i IN 1..tenant_table.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Tenant Name: ' || tenant_table(i).Tenant_name || ' | Email: ' || tenant_table(i).Tenant_email);
    END LOOP;
END;
/

-- Project Name:Mall Management System, Semester:Summer 2024-25, Course:Advance Database Management System, Section:A
-- 2 explicit cursor
DECLARE
    CURSOR shop_cur IS SELECT Shop_name, Shop_type FROM Shop;
    v_name Shop.Shop_name%TYPE;
    v_type Shop.Shop_type%TYPE;
BEGIN
    OPEN shop_cur;
    LOOP
        FETCH shop_cur INTO v_name, v_type;
        EXIT WHEN shop_cur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Shop: ' || v_name || ' | Type: ' || v_type);
    END LOOP;
    CLOSE shop_cur;
END;
/


-- Project Name:Mall Management System, Semester:Summer 2024-25, Course:Advance Database Management System, Section:A
-- 2 explicit cursor

DECLARE
    CURSOR cust_cur IS
        SELECT C.Customer_name, S.Shop_name
        FROM Customer C
        JOIN Shop S ON C.S_ID = S.Shop_ID;
    v_cust Customer.Customer_name%TYPE;
    v_shop Shop.Shop_name%TYPE;
BEGIN
    OPEN cust_cur;
    LOOP
        FETCH cust_cur INTO v_cust, v_shop;
        EXIT WHEN cust_cur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Customer: ' || v_cust || ' | Shop: ' || v_shop);
    END LOOP;
    CLOSE cust_cur;
END;
/

-- Project Name:Mall Management System, Semester:Summer 2024-25, Course:Advance Database Management System, Section:A
-- 2 cursor-based record

DECLARE
    CURSOR emp_cur IS SELECT Employee_name, Emp_salary FROM Employee;
    emp_rec emp_cur%ROWTYPE;
BEGIN
    OPEN emp_cur;
    LOOP
        FETCH emp_cur INTO emp_rec;
        EXIT WHEN emp_cur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Employee: ' || emp_rec.Employee_name || ' | Salary: ' || emp_rec.Emp_salary);
    END LOOP;
    CLOSE emp_cur;
END;
/

-- Project Name:Mall Management System, Semester:Summer 2024-25, Course:Advance Database Management System, Section:A
-- 2 cursor-based record

DECLARE
    CURSOR guard_cur IS SELECT Guard_name, Guard_shift_time FROM Guard;
    guard_rec guard_cur%ROWTYPE;
BEGIN
    OPEN guard_cur;
    LOOP
        FETCH guard_cur INTO guard_rec;
        EXIT WHEN guard_cur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Guard: ' || guard_rec.Guard_name || ' | Shift: ' || guard_rec.Guard_shift_time);
    END LOOP;
    CLOSE guard_cur;
END;
/

-- Project Name:Mall Management System, Semester:Summer 2024-25, Course:Advance Database Management System, Section:A
-- 2 row level trigger

CREATE OR REPLACE TRIGGER log_payment_insert
AFTER INSERT ON Payment
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('New Payment Inserted: Payment_ID = ' || :NEW.Payment_ID || ', Amount = ' || :NEW.Amount);
END;
/

-- Insert a Test Payment
INSERT INTO Payment (Payment_ID, Amount, Payment_date, Payment_method, T_ID)
VALUES (606, 17000, TO_DATE('2025-08-06','YYYY-MM-DD'), 'Card', 501);

-- Verifying if the Row is in Table
SELECT * FROM Payment WHERE Payment_ID = 606;

-- Cleanup (optional, after testing just cleaned that unnecessary row)
DELETE FROM Payment WHERE Payment_ID = 606;


-- Project Name:Mall Management System, Semester:Summer 2024-25, Course:Advance Database Management System, Section:A
-- 2 row level trigger

CREATE OR REPLACE TRIGGER log_customer_insert
AFTER INSERT ON Customer
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('New Customer: ' || :NEW.Customer_name || ' | Shop ID: ' || :NEW.S_ID);
END;
/

-- Insert a Test Customer
INSERT INTO Customer (Customer_ID, Customer_name, Customer_email, Customer_phone, Visit_date, Feedback, S_ID)
VALUES (806, 'Sophia Green', 'sophia.green@example.com', '01710000036', TO_DATE('2025-08-06','YYYY-MM-DD'), 'Excellent service', 102);

-- Verifying the Row is Inserted
SELECT * FROM Customer WHERE Customer_ID = 806;

-- Cleanup (optional, after testing just cleaned that unnecessary row)
DELETE FROM Customer WHERE Customer_ID = 806;



-- Project Name:Mall Management System, Semester:Summer 2024-25, Course:Advance Database Management System, Section:A
-- 2 statement level trigger

CREATE OR REPLACE TRIGGER log_shop_update
AFTER UPDATE ON Shop
BEGIN
    DBMS_OUTPUT.PUT_LINE('Shop table updated at ' || SYSDATE);
END;
/

-- Testing log_shop_update Trigger
UPDATE Shop
SET Shop_status = 'Closed'
WHERE Shop_ID = 101;

-- Reverted the previuos value
UPDATE Shop
SET Shop_status = 'Open'
WHERE Shop_ID = 101;


-- Project Name:Mall Management System, Semester:Summer 2024-25, Course:Advance Database Management System, Section:A
-- 2 statement level trigger

CREATE OR REPLACE TRIGGER log_payment_delete
AFTER DELETE ON Payment
BEGIN
    DBMS_OUTPUT.PUT_LINE('Payment table rows deleted at ' || SYSDATE);
END;
/
-- Testing  the Trigger, Inserting a sample row
INSERT INTO Payment (Payment_ID, Amount, Payment_date, Payment_method, T_ID)
VALUES (606, 17000, TO_DATE('2025-08-06','YYYY-MM-DD'), 'Card', 501);

-- Performing the Triggering Action
DELETE FROM Payment
WHERE Payment_ID = 606;   



-- Project Name:Mall Management System, Semester:Summer 2024-25, Course:Advance Database Management System, Section:A
-- 2 package

-- Package Specification
CREATE OR REPLACE PACKAGE emp_pkg IS
    FUNCTION Get_Total_Salary(emp_id IN NUMBER) RETURN NUMBER;
    PROCEDURE Show_Employee(emp_id IN NUMBER);
END emp_pkg;
/

-- Package Body
CREATE OR REPLACE PACKAGE BODY emp_pkg IS
    FUNCTION Get_Total_Salary(emp_id IN NUMBER) RETURN NUMBER IS
        v_salary NUMBER(10,2);
    BEGIN
        SELECT Emp_salary INTO v_salary FROM Employee WHERE Employee_ID = emp_id;
        RETURN v_salary;
    END;

    PROCEDURE Show_Employee(emp_id IN NUMBER) IS
        v_name Employee.Employee_name%TYPE;
        v_salary NUMBER(10,2);
    BEGIN
        SELECT Employee_name, Emp_salary INTO v_name, v_salary
        FROM Employee WHERE Employee_ID = emp_id;
        DBMS_OUTPUT.PUT_LINE('Employee: ' || v_name || ' | Salary: ' || v_salary);
    END;
END emp_pkg;
/

-- Checking package objects
SELECT object_name, object_type, status
FROM user_objects
WHERE object_name = 'EMP_PKG';



-- Project Name:Mall Management System, Semester:Summer 2024-25, Course:Advance Database Management System, Section:A
-- 2 package

-- Package Specification
CREATE OR REPLACE PACKAGE tenant_pkg IS
    FUNCTION Total_Payment(t_id IN NUMBER) RETURN NUMBER;
    PROCEDURE Show_Tenant(t_id IN NUMBER);
END tenant_pkg;
/
-- Package Body
CREATE OR REPLACE PACKAGE BODY tenant_pkg IS
    FUNCTION Total_Payment(t_id IN NUMBER) RETURN NUMBER IS
        v_total NUMBER(10,2);
    BEGIN
        SELECT NVL(SUM(Amount),0) INTO v_total FROM Payment WHERE T_ID = t_id;
        RETURN v_total;
    END;

    PROCEDURE Show_Tenant(t_id IN NUMBER) IS
        v_name Tenant.Tenant_name%TYPE;
    BEGIN
        SELECT Tenant_name INTO v_name FROM Tenant WHERE Tenant_ID = t_id;
        DBMS_OUTPUT.PUT_LINE('Tenant: ' || v_name || ' | Total Payment: ' || Total_Payment(t_id));
    END;
END tenant_pkg;
/

-- Checking package objects
SELECT object_name, object_type, status
FROM user_objects
WHERE object_name = 'TENANT_PKG';


























