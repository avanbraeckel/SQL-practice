-- Austin Van Braeckel
/**
*  A script that creates and populates the tables needed for the 8 programs labeled "pi.sql"
*  where 'i' is replaced with the integers from 1 to 8.
*/

-- Drop the tables if they exist already
DROP TABLE IF EXISTS v;
DROP TABLE IF EXISTS c;
DROP TABLE IF EXISTS t;

-- Create the tables
CREATE TABLE IF NOT EXISTS v (Vno CHAR(5), Vname CHAR(20), City CHAR(10), Vbalance NUMERIC(10,2),
    PRIMARY KEY (Vno));
CREATE TABLE IF NOT EXISTS c (Account CHAR(5), Cname CHAR(20), Province CHAR(3), Cbalance NUMERIC(10,2),
    Crlimit INTEGER, PRIMARY KEY (Account));
CREATE TABLE IF NOT EXISTS t (Tno CHAR(5), Vno CHAR(5), Account CHAR(5), T_date DATE, Amount NUMERIC(10,2),
    PRIMARY KEY (Tno));

-- Insert the records
INSERT INTO v VALUES ('V1', 'IKEA', 'Toronto', 200.00), 
                    ('V2', 'Walmart', 'Waterloo', 671.05),
                    ('V3', 'Esso', 'Windsor', 0.00),
                    ('V4', 'Esso', 'Waterloo', 225.00);
INSERT INTO c VALUES ('A1', 'Smith', 'ONT', 2515.00, 2000), 
                    ('A2', 'Jones', 'BC', 2014.00, 2500),
                    ('A3', 'Doc', 'ONT', 150.00, 1000);
INSERT INTO t VALUES ('T1', 'V2', 'A1', '2022-07-15', 1325.00), 
                    ('T2', 'V2', 'A3', '2021-12-16', 1900.00),
                    ('T3', 'V3', 'A1', '2022-09-01', 2500.00),
                    ('T4', 'V4', 'A2', '2022-03-20', 1613.00),
                    ('T5', 'V4', 'A3', '2022-05-31', 2212.00);




