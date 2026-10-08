SELECT DISTINCT first_name, last_name
FROM clients;

SELECT property_owners.first_name, property_owners.last_name, SUM(rental_properties.square_feet) AS total_square_feet
FROM property_owners
JOIN owned_by
    ON property_owners.owner_number = property_owners.owner_number
JOIN rental_properties
    ON owned_by.property_number = rental_properties.property_number
GROUP BY property_owners.owner_number, property_owners.first_name, property_owners.last_name;

SET @month = 1;
SET @year = 2024;


  
SELECT employee.employee_number, employee.first_name, employee.last_name, property_viewings.property_number, property_viewings.view_date
FROM property_viewings
JOIN employee
    ON property_viewings.employee_number = employee.employee_number
JOIN associate
    ON employee.employee_number = associate.employee_number
WHERE MONTH(property_viewings.view_date) = @month
  AND YEAR(property_viewings.view_date) = @year
ORDER BY employee.employee_number;

SET @start_date = '2024-01-01';
SET @end_date   = '2024-12-31';

SELECT property_number, COUNT(*) AS total_viewings
FROM property_viewings
WHERE view_date BETWEEN @start_date AND @end_date
GROUP BY property_number
ORDER BY total_viewings DESC;

SET @month = 1;
SET @year  = 2024;

SELECT 
    property_owners.owner_number,
    property_owners.first_name,
    property_owners.last_name,
    SUM(leases.monthly_rent) AS total_rent
FROM leases
JOIN rent_out
    ON leases.lease_number = rent_out.lease_number
JOIN owned_by
    ON rent_out.property_number = owned_by.property_number
JOIN property_owners
    ON owned_by.owner_number = property_owners.owner_number
WHERE MONTH(leases.start_date) <= @month
  AND YEAR(leases.start_date) <= @year
  AND MONTH(leases.end_date) >= @month
  AND YEAR(leases.end_date) >= @year
GROUP BY property_owners.owner_number, property_owners.first_name, property_owners.last_name
ORDER BY total_rent DESC;


SET @owner_id = 1;

SELECT 
    clients.client_number,
    clients.first_name,
    clients.last_name
FROM clients
JOIN property_viewings
    ON clients.client_number = property_viewings.client_number
JOIN rental_properties
    ON property_viewings.property_number = rental_properties.property_number
JOIN owned_by
    ON rental_properties.property_number = owned_by.property_number
WHERE rental_properties.property_type = 'residential'
  AND owned_by.owner_number = @owner_id
GROUP BY clients.client_number, clients.first_name, clients.last_name
HAVING COUNT(DISTINCT property_viewings.property_number) >= 3;

SELECT DISTINCT po1.first_name, po1.last_name
FROM property_owners po1
WHERE NOT EXISTS (
    SELECT rental_properties.city
    FROM rental_properties
    JOIN owned_by ON rental_properties.property_number = owned_by.property_number
    JOIN property_owners po2 ON owned_by.owner_number = po2.owner_number
    WHERE po2.first_name = 'Pat'
      AND po2.last_name = 'Doe'
      AND rental_properties.property_type = 'commercial'
      AND rental_properties.city NOT IN (
          SELECT rp2.city
          FROM rental_properties rp2
          JOIN owned_by ob2 ON rp2.property_number = ob2.property_number
          WHERE ob2.owner_number = po1.owner_number
            AND rp2.property_type = 'residential'
      )
);

SET @year = 2026;

SELECT employee.employee_number, employee.first_name, employee.last_name, COUNT(rent_out.property_number) AS properties_leased
FROM partner
JOIN employee
    ON partner.employee_number = employee.employee_number
JOIN leases
    ON employee.employee_number = leases.employee_number
JOIN rent_out
    ON leases.lease_number = rent_out.lease_number
WHERE YEAR(leases.lease_date) = @year
GROUP BY employee.employee_number, employee.first_name, employee.last_name
ORDER BY properties_leased DESC
LIMIT 3;

DELIMITER //

CREATE FUNCTION management_fees_3_months()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_fees INT;

    SELECT COALESCE(SUM(rental_properties.management_fee), 0)
    INTO total_fees
    FROM rental_properties
    JOIN rent_out
        ON rental_properties.property_number = rent_out.property_number
    JOIN leases
        ON rent_out.lease_number = leases.lease_number
    WHERE leases.start_date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH);

    RETURN total_fees;
END //

DELIMITER ;

SELECT management_fees_3_months();

DELETE
