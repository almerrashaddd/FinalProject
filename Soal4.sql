-- Create a database with ‘KALBE’ as the name.
CREATE DATABASE KALBE;
USE KALBE;

/*
Inside the database, create a table with the name ‘Inventory’, with columns Item_code,
Item_name, Item_price, and Item_total. Choose its own best data type and the length of it 
according to best practice. Choose one unique column as a primary key and decide columns
constraints.
*/
CREATE TABLE Inventory (
    Item_code INT PRIMARY KEY,
    Item_name VARCHAR(255) UNIQUE NOT NULL,
    Item_price DECIMAL(10, 2) NOT NULL,
    Item_total INT NOT NULL
);

-- Insert below data into the table
INSERT INTO Inventory (Item_code, Item_name, Item_price, Item_total)
VALUES
    (2341, 'Promag_Tablet', 3000.00, 100),
    (2342, 'Hydro_Coco_250ML', 7000.00, 20),
    (2343, 'Nutrive_Benecol_100ML', 20000.00, 30),
    (2344, 'Blackmores_Vit_C_500Mg', 95000.00, 45),
    (2345, 'Entrasol_Gold_370G', 90000.00, 120);

-- Show Item_name that has the highest number in Item_total.
SELECT Item_name
FROM Inventory
WHERE Item_total = (SELECT MAX(Item_total) FROM Inventory);

-- Update the Item_price of the output of question bullet
UPDATE Inventory
SET Item_price = 25000.00
WHERE Item_name = 'Entrasol_Gold_370G';

-- What will happen if we insert another Item_name with Item_code of 2343 into the table?
INSERT INTO Inventory (Item_code, Item_name, Item_price, Item_total)
VALUES (2343, 'Another_Item', 15000.00, 50);

-- Delete the Item_name that has the lowest number of Item_total.
DELETE FROM Inventory
WHERE Item_total = (SELECT MIN(Item_total) FROM Inventory);
