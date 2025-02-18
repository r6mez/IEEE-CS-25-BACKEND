CREATE DATABASE Sheroweida;
USE Sheroweida;

CREATE TABLE AirlineCompanies(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    headquarters VARCHAR(255),
    fleet_size INT,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Planes(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    company_id INT,
    passenger_capacity INT,
    fuel_capacity INT,
    current_fuel INT NOT NULL DEFAULT 0,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (company_id) REFERENCES AirlineCompanies(id)
);

CREATE TABLE Users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    gender VARCHAR(6) NOT NULL,
    age INT CHECK(age > 0),
    address VARCHAR(255),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Passengers(
    user_id INT PRIMARY KEY,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE Employee(
    user_id INT PRIMARY KEY,
    role varchar(16),
    salary INT ,
    company_id INT ,
    FOREIGN KEY (company_id) REFERENCES AirlineCompanies(id),
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE Runways(
    id INT PRIMARY KEY AUTO_INCREMENT,
    status VARCHAR(5),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Flights(
    id INT PRIMARY KEY AUTO_INCREMENT,
    from_location VARCHAR(255) NOT NULL,
    destination_location VARCHAR(255) NOT NULL,
    take_off_time DATETIME NOT NULL,
    arrival_time DATETIME NOT NULL,
    plane_id INT NOT NULL,
    runway_id INT NOT NULL,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (plane_id) REFERENCES Planes(id),
    FOREIGN KEY (runway_id) REFERENCES Runways(id)
);

CREATE TRIGGER check_fuel_before_flight
BEFORE INSERT ON Flights
FOR EACH ROW
BEGIN
    DECLARE plane_fuel INT;
    DECLARE min_required_fuel INT;

    SELECT current_fuel, fuel_capacity INTO plane_fuel, min_required_fuel 
    FROM Planes WHERE id = NEW.plane_id;

    SET min_required_fuel = min_required_fuel * 0.3;

    IF plane_fuel < min_required_fuel THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A plane cannot take off if its fuel level is below 30%';
    END IF;
END;


CREATE TABLE Flies_on(
    passenger_id INT,
    flight_id INT,
    PRIMARY KEY(passenger_id,flight_id),
    FOREIGN KEY (passenger_id) REFERENCES Passengers(user_id),
    FOREIGN KEY (flight_id) REFERENCES Flights(id)
);

CREATE TABLE Work_on(
    employee_id INT,
    flight_id INT,
    PRIMARY KEY(employee_id,flight_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(user_id),
    FOREIGN KEY (flight_id) REFERENCES Flights(id)
);


-- QEURIES : 

-- Find all upcoming flights departing from Shroweida in the next 7 days.
select * 
from flights
where from_location = 'Shroweida' and DATEDIFF(DATE(take_off_time), CURDATE()) <= 7;


-- Find all passengers, pilots, Flight attendee for the plane which has ID=1244
select u.id, u.name, u.gender, u.address, u.age, f.plane_id
from flies_on r
    left join Passengers p on r.passenger_id = p.user_id
    left join flights f on r.flight_id = f.id
    left join users u on p.user_id = u.id
WHERE plane_id = 1244;

select u.id, u.name, u.gender, u.address, u.age, e.role, e.salary, e.company_id, f.plane_id
from flies_on r
    left join Employee e on r.passenger_id = e.user_id
    left join flights f on r.flight_id = f.id
    left join users u on e.user_id = u.id
WHERE plane_id = 1244;

-- All Open runways
select * from runways where status = 'open';

-- All planes, its company, passengers capacity that will flight to Tanta
select p.name, c.name, p.passenger_capacity
from flights f 
    left join planes p on f.plane_id = p.id
    left join AirlineCompanies c on p.company_id = c.id
where destination_location = 'Tanta';