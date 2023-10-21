-- AlgoGen API Project



-- Creating a new database
CREATE DATABASE interview;

-- Selecting the database
USE interview;


-- Creating a new table 
CREATE TABLE api_data_table(
    id INT PRIMARY KEY IDENTITY(1, 1),
	heads CHAR(1),
	number_static INT,
	live INT,
	diff INT,
	diff_percent FLOAT
);


-- Truncating table
TRUNCATE TABLE api_data_table;

-- Checking if the table is truncated or not
SELECT * FROM api_data_table;


-- Creating trigger for diff * diff_percent
CREATE TRIGGER diff_and_diffpercent
ON api_data_table
AFTER INSERT
AS
BEGIN
    
    UPDATE api_data_table
    SET diff = ABS(new.number_static - new.live),
        diff_percent = ROUND(CASE WHEN new.number_static = 0 THEN NULL ELSE (ABS(new.number_static - new.live) * 1.0 / new.number_static) * 100 END, 2)
    FROM INSERTED new
    WHERE api_data_table.id = new.id;
    
END;


-- Inserting data into table
INSERT INTO api_data_table (heads, number_static, live)
VALUES ('A', 120, 150), ('B', 200, 170), ('C', 100, 40);


-- Checking if the trigger works
SELECT * FROM api_data_table;
