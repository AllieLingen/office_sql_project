-- Create the trigger table to store logs
CREATE TABLE trigger (
    message VARCHAR(100)
);

DELIMITER $$  
CREATE
	TRIGGER add_employee BEFORE INSERT
	ON employee
	FOR EACH ROW BEGIN
			INSERT INTO trigger VALUES('added new employee'); 
	END$$
DELIMITER ;