------------------------------------------------
-- 1. Alumni Table
------------------------------------------------
CREATE TABLE Alumni (
    A_ID NUMBER PRIMARY KEY,
    A_name VARCHAR2(100) NOT NULL,
    Contact VARCHAR2(50),
    Address VARCHAR2(200),
    Phone_N VARCHAR2(15) UNIQUE,
    Email VARCHAR2(100) UNIQUE,
    Graduate_Year NUMBER(4)
);

------------------------------------------------
-- 2. Event Table
------------------------------------------------
CREATE TABLE Event (
    Event_ID NUMBER PRIMARY KEY,
    Venue VARCHAR2(100),
    E_Name VARCHAR2(100),
    E_Type VARCHAR2(50),
    A_ID NUMBER,
    FOREIGN KEY (A_ID) REFERENCES Alumni(A_ID)
);

------------------------------------------------
-- 3. Networking Group Table
------------------------------------------------
CREATE TABLE Networking_Group (
    GroupID NUMBER PRIMARY KEY,
    Group_Name VARCHAR2(100),
    Group_Description VARCHAR2(200),
    A_ID NUMBER,
    FOREIGN KEY (A_ID) REFERENCES Alumni(A_ID)
);

------------------------------------------------
-- 4. Donation Table
------------------------------------------------
CREATE TABLE Donation (
    DonationID NUMBER PRIMARY KEY,
    Donation_Date DATE,
    Time VARCHAR2(10),
    Purpose VARCHAR2(200),
    D_Amount NUMBER(10,2),
    A_ID NUMBER,
    FOREIGN KEY (A_ID) REFERENCES Alumni(A_ID)
);

------------------------------------------------
-- 5. Job Table
------------------------------------------------
CREATE TABLE Job (
    JobID NUMBER PRIMARY KEY,
    Job_Title VARCHAR2(100),
    CompanyName VARCHAR2(100),
    A_ID NUMBER,
    FOREIGN KEY (A_ID) REFERENCES Alumni(A_ID)
);

------------------------------------------------
-- 6. Batch Table
------------------------------------------------
CREATE TABLE Batch (
    BatchID NUMBER PRIMARY KEY,
    Total_Alumni NUMBER,
    A_ID NUMBER,
    FOREIGN KEY (A_ID) REFERENCES Alumni(A_ID)
);

------------------------------------------------
-- 7. Session Table
------------------------------------------------
CREATE TABLE Event_Session (
    S_ID NUMBER PRIMARY KEY,
    S_Date DATE,
    S_Time VARCHAR2(10),
    EventID NUMBER,
    FOREIGN KEY (EventID) REFERENCES Event(Event_ID)
);


------------------------------------------------
-- Insert sample data
------------------------------------------------

-- Alumni
INSERT INTO Alumni VALUES (1, 'John Smith', 'Facebook', 'NY, USA', '1234567890', 'john@example.com', 2015);
INSERT INTO Alumni VALUES (2, 'Sara Khan', 'Twitter', 'London, UK', '2345678901', 'sara@example.com', 2016);
INSERT INTO Alumni VALUES (3, 'David Lee', 'LinkedIn', 'Toronto, Canada', '3456789012', 'david@example.com', 2017);

-- Event
INSERT INTO Event VALUES (101, 'Auditorium', 'Alumni Meet', 'Social', 1);
INSERT INTO Event VALUES (102, 'Hall B', 'Career Fair', 'Professional', 2);
INSERT INTO Event VALUES (103, 'Conference Room', 'Workshop', 'Educational', 3);

-- Networking Group
INSERT INTO Networking_Group VALUES (201, 'Tech Group', 'Focus on IT networking', 1);
INSERT INTO Networking_Group VALUES (202, 'Business Leaders', 'Entrepreneurship and startups', 2);
INSERT INTO Networking_Group VALUES (203, 'Research Circle', 'Scientific research collaboration', 3);

-- Donation
INSERT INTO Donation VALUES (301, TO_DATE('2024-05-10','YYYY-MM-DD'), '10:00AM', 'Library Renovation', 5000, 1);
INSERT INTO Donation VALUES (302, TO_DATE('2024-06-15','YYYY-MM-DD'), '02:00PM', 'Scholarship Fund', 3000, 2);
INSERT INTO Donation VALUES (303, TO_DATE('2024-07-20','YYYY-MM-DD'), '11:00AM', 'Sports Complex', 7000, 3);

-- Job
INSERT INTO Job VALUES (401, 'Software Engineer', 'Google', 1);
INSERT INTO Job VALUES (402, 'Marketing Manager', 'Amazon', 2);
INSERT INTO Job VALUES (403, 'Data Scientist', 'Microsoft', 3);

-- Batch
INSERT INTO Batch VALUES (501, 150, 1);
INSERT INTO Batch VALUES (502, 200, 2);
INSERT INTO Batch VALUES (503, 180, 3);

-- Session
INSERT INTO Event_Session VALUES (601, TO_DATE('2024-08-01','YYYY-MM-DD'), '09:00AM', 101);
INSERT INTO Event_Session VALUES (602, TO_DATE('2024-08-05','YYYY-MM-DD'), '01:00PM', 102);
INSERT INTO Event_Session VALUES (603, TO_DATE('2024-08-10','YYYY-MM-DD'), '03:00PM', 103);

select * from Alumni;
select * from Event;
select * from Networking_Group;
select * from Donation;
select * from Job;
select * from Batch;
select * from Event_Session;

-- Single-Row functions

SELECT UPPER(A_name) AS Alumni_Name, Graduate_Year
FROM Alumni;

SELECT SUBSTR(Email, 1, 5) AS Email_Prefix,
       LENGTH(A_name) AS Name_Length
FROM Alumni;




-- Group Functions

SELECT SUM(D_Amount) AS Total_Donations
FROM Donation;


SELECT MAX(Total_Alumni) AS Max_Alumni,
       MIN(Total_Alumni) AS Min_Alumni
FROM Batch;




-- Subqueries

SELECT A_ID, Purpose, D_Amount
FROM Donation
WHERE D_Amount > (SELECT AVG(D_Amount) FROM Donation);

SELECT DISTINCT A.A_ID, A.A_name
FROM Alumni A
WHERE A.A_ID IN (
    SELECT A_ID
    FROM Event
    WHERE Venue = (SELECT Venue FROM Event WHERE Event_ID = 101)
);


-- Join

SELECT A.A_name, E.E_Name
FROM Alumni A
JOIN Event E ON A.A_ID = E.A_ID;


SELECT A.A_name, E.E_Name, S.S_Date
FROM Alumni A
JOIN Event E ON A.A_ID = E.A_ID
JOIN Event_Session S ON E.Event_ID = S.EventID;




--PL/SQL
-- Single-row Functions
BEGIN
  FOR rec IN (
    SELECT * FROM (
      SELECT UPPER(A_name) AS Alumni_Name, Graduate_Year
      FROM Alumni
      ORDER BY A_name
    )
    WHERE ROWNUM <= 3
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Name: ' || rec.Alumni_Name || ', Year: ' || rec.Graduate_Year);
  END LOOP;
END;
/



BEGIN
  FOR rec IN (
    SELECT SUBSTR(Email, 1, 5) AS Email_Prefix,
           LENGTH(A_name) AS Name_Length
    FROM Alumni
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Email Prefix: ' || rec.Email_Prefix || ', Name Length: ' || rec.Name_Length);
  END LOOP;
END;
/




-- Group Functions
DECLARE
    v_total NUMBER;
BEGIN
    SELECT SUM(D_Amount)
    INTO v_total
    FROM Donation;

    DBMS_OUTPUT.PUT_LINE('Total Donations: ' || v_total);
END;
/


DECLARE
    v_max NUMBER;
    v_min NUMBER;
BEGIN
    SELECT MAX(Total_Alumni), MIN(Total_Alumni)
    INTO v_max, v_min
    FROM Batch;

    DBMS_OUTPUT.PUT_LINE('Max Alumni: ' || v_max || ', Min Alumni: ' || v_min);
END;
/


-- Subqueries
BEGIN
    FOR rec IN (
        SELECT A_ID, Purpose, D_Amount
        FROM Donation
        WHERE D_Amount > (SELECT AVG(D_Amount) FROM Donation)
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('A_ID: ' || rec.A_ID || ', Purpose: ' || rec.Purpose || ', Amount: ' || rec.D_Amount);
    END LOOP;
END;
/


BEGIN
    FOR rec IN (
        SELECT DISTINCT A.A_ID, A.A_name
        FROM Alumni A
        WHERE A.A_ID IN (
            SELECT A_ID
            FROM Event
            WHERE Venue = (SELECT Venue FROM Event WHERE Event_ID = 101)
        )
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('A_ID: ' || rec.A_ID || ', Name: ' || rec.A_name);
    END LOOP;
END;
/

--Join
BEGIN
    FOR rec IN (
        SELECT A.A_name, E.E_Name
        FROM Alumni A
        JOIN Event E ON A.A_ID = E.A_ID
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Alumni: ' || rec.A_name || ', Event: ' || rec.E_Name);
    END LOOP;
END;
/


BEGIN
    FOR rec IN (
        SELECT A.A_name, E.E_Name, S.S_Date
        FROM Alumni A
        JOIN Event E ON A.A_ID = E.A_ID
        JOIN Event_Session S ON E.Event_ID = S.EventID
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Alumni: ' || rec.A_name || ', Event: ' || rec.E_Name || ', Date: ' || TO_CHAR(rec.S_Date, 'DD-MON-YYYY'));
    END LOOP;
END;
/









