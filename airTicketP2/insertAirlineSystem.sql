-- a.  Insert one airline name "Jet blue"
INSERT INTO airline VALUES 
('Jet Blue'), 
('American Airlines'), 
('Delta Air Lines');

-- b. Insert two airports named JFK in NYC and PVG in Shanghai 
INSERT INTO airport VALUES
('JFK', 'John F. Kennedy International Airport', 'New York City', 'USA', 'International', 8),
('PVG', 'Shanghai Pudong International Airport', 'Shanghai', 'China', 'International', 5),
('LAX', 'Los Angeles International Airport', 'Los Angeles', 'USA', 'International', 9),
('LHR', 'Heathrow Airport', 'London', 'UK', 'International', 5),
('CDG', 'Charles de Gaulle Airport', 'Paris', 'France', 'International', 7);

-- c. Insert at least three customers with appropriate names and other attributes
INSERT INTO customer VALUES
('Zack', 'Dong', '1985-01-15', 'zackdong@email.com', 'zack123', '123 Elm St', 12, 5, 'New York', 'NY', 10001, 2125550123, 'A1234567', '2025-01-15', 'USA'),
('Cody', 'Smith', '1990-02-20', 'codysmith@email.com', 'cody123', '456 Maple Ave', 18, 7, 'Los Angeles', 'CA', 90001, 3105550123, 'B1234568', '2026-02-20', 'USA'),
('Jim', 'Bean', '1988-03-25', 'jimbean@email.com', 'jim123', '789 Oak Rd', 22, 9, 'Chicago', 'IL', 60007, 3125550123, 'C1234569', '2027-03-25', 'USA'),
('Alice', 'Johnson', '1975-04-30', 'alicejohnson@email.com', 'alice123', '101 Pine Ln', 2, 2, 'Miami', 'FL', 33101, 3055550123, 'D1234570', '2028-04-30', 'USA'),
('Bob', 'Marley', '1965-05-15', 'bobmarley@email.com', 'bob123', '202 Birch Pl', 32, 11, 'Seattle', 'WA', 98101, 2065550123, 'E1234571', '2029-05-15', 'Jamaica');

-- d. Insert at least three airplanes. 
INSERT INTO airplane VALUES
('A320-1', 'Jet Blue', 150, 'Airbus', 320, '2015-01-10', 9),
('B737-1', 'American Airlines', 130, 'Boeing', 737, '2016-02-15', 8),
('B777-1', 'Delta Air Lines', 300, 'Boeing', 777, '2014-03-20', 10),
('A380-1', 'Jet Blue', 500, 'Airbus', 380, '2017-04-25', 7),
('B787-1', 'American Airlines', 250, 'Boeing', 787, '2018-05-30', 6);
       
-- e. Insert At least One airline Staff working for Jet Blue.
INSERT INTO airline_staff VALUES
('Tom', 'Hanks', 'tomhanks@jetblue.com', 'Jet Blue', 'tomhanks', 'password123', '1965-07-09', 7185550123),
('Sally', 'Field', 'sallyfield@aa.com', 'American Airlines', 'sallyfield', 'password123', '1970-08-12', 2145550123),
('Bruce', 'Willis', 'brucewillis@delta.com', 'Delta Air Lines', 'brucewillis', 'password123', '1960-09-14', 4045550123);

-- f. Insert several flights with on-time, and delayed statuses.
INSERT INTO flight VALUES
(101, 'Jet Blue', 'A320-1', 'One-way', 99.99, 'JFK', '2023-09-01', '08:00:00', 'LAX', '2023-09-01', '11:00:00', 'On Time'),
(102, 'American Airlines', 'B737-1', 'Round-trip', 199.99, 'LAX', '2023-09-02', '09:00:00', 'LHR', '2023-09-02', '23:00:00', 'Delayed'),
(103, 'Delta Air Lines', 'B777-1', 'One-way', 299.99, 'LHR', '2023-09-03', '10:00:00', 'PVG', '2023-09-04', '10:00:00', 'On Time'),
(104, 'Jet Blue', 'A380-1', 'Round-trip', 399.99, 'JFK', '2023-09-04', '07:00:00', 'CDG', '2023-09-04', '20:00:00', 'Canceled'),
(105, 'American Airlines', 'B787-1', 'One-way', 499.99, 'CDG', '2023-09-05', '21:00:00', 'JFK', '2023-09-05', '23:00:00', 'Delayed');

-- g. Insert some tickets for corresponding flights and insert some purchase records (customers bought some tickets).
INSERT INTO ticket VALUES
('T001', 101, 'Jet Blue', 'A320-1', 99.99),
('T002', 102, 'American Airlines', 'B737-1', 250.00),
('T003', 103, 'Delta Air Lines', 'B777-1', 350.00),
('T004', 104, 'Jet Blue', 'A380-1', 400.00),
('T005', 105, 'American Airlines', 'B787-1', 550.00),
('T006', 101, 'Jet Blue', 'A320-1', 200.00),
('T007', 102, 'American Airlines', 'B737-1', 300.00),
('T008', 103, 'Delta Air Lines', 'B777-1', 400.00),
('T009', 104, 'Jet Blue', 'A380-1', 450.00),
('T010', 105, 'American Airlines', 'B787-1', 600.00),
('T011', 101, 'Jet Blue', 'A320-1', 110.00),
('T012', 102, 'American Airlines', 'B737-1', 210.00),
('T013', 103, 'Delta Air Lines', 'B777-1', 310.00),
('T014', 104, 'Jet Blue', 'A380-1', 410.00),
('T015', 105, 'American Airlines', 'B787-1', 510.00);

-- Insert purchase records
INSERT INTO purchase VALUES
('T001', 'zackdong@email.com', '2023-08-25', '12:00:00', 'Credit', 4111111111111111, 'Zack Dong', '2024-01-15'),
('T002', 'codysmith@email.com', '2023-08-26', '14:30:00', 'Debit', 4222222222222222, 'Cody Smith', '2025-02-20'),
('T003', 'jimbean@email.com', '2023-08-27', '16:45:00', 'Credit', 4333333333333333, 'Jim Bean', '2026-03-25'),
('T004', 'alicejohnson@email.com', '2023-08-28', '19:00:00', 'Debit', 4444444444444444, 'Alice Johnson', '2027-04-30'),
('T005', 'bobmarley@email.com', '2023-08-29', '20:15:00', 'Credit', 4555555555555555, 'Bob Marley', '2028-05-15');




    