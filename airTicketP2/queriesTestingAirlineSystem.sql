-- a. Show all the future flights in the system. 
SELECT * FROM flight;

-- b. Show all of the delayed flights in the system.
Select * from flight where flight_status = "Delayed";

-- c. Show the customer names who bought the tickets
Select f_name, l_name from purchase natural join customer;

-- d. Show all the airplanes owned by the airline Jet Blue.
Select * from airplane where airline_name = "Jet Blue";