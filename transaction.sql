ROLLBACK;
SET SQL_SAFE_UPDATES = 0;

-- partner that is replacing the old partner
SET @newpartner = 1;
-- owner whose partner is being switched out
SET @owner = 1;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;
UPDATE assigned_to
SET employee_number = @newpartner
WHERE owner_number = @owner;

UPDATE leases
JOIN rent_out ON leases.lease_number = rent_out.lease_number
JOIN owned_by ON rent_out.property_number = owned_by.property_number
SET leases.employee_number = @newpartner
WHERE owned_by.owner_number = @owner
AND leases.end_date >= CURDATE();

COMMIT;


