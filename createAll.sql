CREATE DATABASE IF NOT EXISTS 461proj;

CREATE TABLE employee (
    employee_number INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    street VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    zipcode INT,
    unit_number VARCHAR(50),
    hired_date DATE,
    email VARCHAR(100)
);

CREATE TABLE employee_phone (
    employee_number INT,
    phone_number VARCHAR(15),
    PRIMARY KEY (employee_number, phone_number),
    FOREIGN KEY (employee_number) REFERENCES employee(employee_number)
);

CREATE TABLE associate (
    employee_number INT PRIMARY KEY,
    FOREIGN KEY (employee_number) REFERENCES employee(employee_number)
);

CREATE TABLE partner (
    employee_number INT PRIMARY KEY,
    FOREIGN KEY (employee_number) REFERENCES employee(employee_number)
);

CREATE TABLE property_owners (
    owner_number INT PRIMARY KEY,
    email VARCHAR(100),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    street VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    zipcode INT,
    unit_number INT
);

CREATE TABLE owner_phone (
    owner_number INT,
    phone_number VARCHAR(15),
    PRIMARY KEY (owner_number, phone_number),
    FOREIGN KEY (owner_number) REFERENCES property_owners(owner_number)
);

CREATE TABLE clients (
    client_number INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    street VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    zipcode INT,
    unit_number VARCHAR(50),
    email VARCHAR(100),
    max_rent INT,
    preference VARCHAR(100)
);

CREATE TABLE client_phone (
    client_number INT,
    phone_number VARCHAR(15),
    PRIMARY KEY (client_number, phone_number),
    FOREIGN KEY (client_number) REFERENCES clients(client_number)
);

CREATE TABLE rental_properties (
    property_number INT PRIMARY KEY,
    property_type VARCHAR(50),
    bedrooms INT,
    square_feet INT,
    bathrooms INT,
    monthly_price INT,
    management_fee INT,
	adv BOOLEAN,
    street VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    zipcode INT,
    unit_number VARCHAR(50)
);
CREATE TABLE leases (
    lease_number INT PRIMARY KEY,
    employee_number INT,
    lease_date DATE,
    monthly_rent INT,
    deposit_amount INT,
    duration INT CHECK(duration BETWEEN 3 AND 36),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (employee_number) REFERENCES employee(employee_number)
);


CREATE TABLE sign (
    lease_number INT,
    client_number INT,
    PRIMARY KEY (lease_number, client_number),
    FOREIGN KEY (lease_number) REFERENCES leases(lease_number),
    FOREIGN KEY (client_number) REFERENCES clients(client_number)
);

CREATE TABLE rent_out (
    property_number INT,
    lease_number INT,
    PRIMARY KEY (property_number, lease_number),
    FOREIGN KEY (property_number) REFERENCES rental_properties(property_number),
    FOREIGN KEY (lease_number) REFERENCES leases(lease_number)
);

CREATE TABLE owned_by (
    property_number INT,
    owner_number INT,
    PRIMARY KEY (property_number, owner_number),
    FOREIGN KEY (property_number) REFERENCES rental_properties(property_number),
    FOREIGN KEY (owner_number) REFERENCES property_owners(owner_number)
);

CREATE TABLE involve (
    employee_number INT,
    client_number INT,
    property_number INT,
    PRIMARY KEY (employee_number, client_number, property_number),
    FOREIGN KEY (employee_number) REFERENCES employee(employee_number),
    FOREIGN KEY (client_number) REFERENCES clients(client_number),
    FOREIGN KEY (property_number) REFERENCES rental_properties(property_number)
);

CREATE TABLE assigned (
    employee_number INT,
    property_number INT,
    PRIMARY KEY (employee_number, property_number),
    FOREIGN KEY (employee_number) REFERENCES employee(employee_number),
    FOREIGN KEY (property_number) REFERENCES rental_properties(property_number)
);

CREATE TABLE assigned_to (
    employee_number INT,
    owner_number INT,
    PRIMARY KEY (employee_number, owner_number),
    FOREIGN KEY (employee_number) REFERENCES employee(employee_number),
    FOREIGN KEY (owner_number) REFERENCES property_owners(owner_number)
);

CREATE TABLE written_by (
    lease_number INT,
    employee_number INT,
    PRIMARY KEY (lease_number, employee_number),
    FOREIGN KEY (lease_number) REFERENCES leases(lease_number),
    FOREIGN KEY (employee_number) REFERENCES employee(employee_number)
);

CREATE TABLE property_viewings (
    employee_number INT,
    client_number INT,
    property_number INT,
    view_time TIME,
    view_date DATE,
    PRIMARY KEY (employee_number, client_number, property_number),
    FOREIGN KEY (employee_number) REFERENCES employee(employee_number),
    FOREIGN KEY (client_number) REFERENCES clients(client_number),
    FOREIGN KEY (property_number) REFERENCES rental_properties(property_number)
);


CREATE INDEX leases_dates ON leases(start_date, end_date);

--Triggers

delimiter |
CREATE TRIGGER property_unavailable AFTER INSERT ON rent_out
	FOR EACH ROW BEGIN UPDATE rental_properties
    SET adv = FALSE
    WHERE property_number = NEW.property_number;
    END
    
    |
    
CREATE TRIGGER associate_max_properties BEFORE INSERT ON assigned
	FOR EACH ROW BEGIN DECLARE property_count INT;

	IF EXISTS(
		SELECT 1 FROM associate
		WHERE employee_number = NEW.employee_number
	)THEN

	SELECT COUNT(*)
	INTO property_count
    FROM assigned
    WHERE employee_number = NEW.employee_number;
    
	IF property_count >= 5 THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Associate can manage a maximum of 5 properties';
	END IF;
    END IF;
    END

|
delimiter ;

