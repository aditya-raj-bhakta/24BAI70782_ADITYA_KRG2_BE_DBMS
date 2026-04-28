-- Suppliers Table
CREATE TABLE Tbl_Suppliers (
    sup_id INT PRIMARY KEY,
    sup_name VARCHAR(100),
    city VARCHAR(50),
    rating INT
);
-- Products Table (linked to Suppliers)
CREATE TABLE Tbl_Products (
    prod_id INT PRIMARY KEY,
    prod_name VARCHAR(100),
    category VARCHAR(50),
    price INT,
    stock_qty INT,
    sup_id INT,
    FOREIGN KEY (sup_id) REFERENCES Tbl_Suppliers(sup_id)
);
-- Orders Table (linked to Products)
CREATE TABLE Tbl_Orders (
    order_id INT PRIMARY KEY,
    prod_id INT,
    cust_id INT,
    order_date DATE,
    qty INT,
    FOREIGN KEY (prod_id) REFERENCES Tbl_Products(prod_id)
);
-- Suppliers
INSERT INTO Tbl_Suppliers (sup_id, sup_name, city, rating) VALUES
(701, 'NextGen Tech', 'Bangalore', 5),
(702, 'Comfort Hub', 'Mumbai', 4);
-- Products (linked to suppliers via sup_id)
INSERT INTO Tbl_Products (prod_id, prod_name, category, price, stock_qty, sup_id) VALUES
(501, 'Laptop Pro', 'Electronics', 75000, 15, 701),
(502, 'Ergo Chair', 'Furniture', 15000, 8, 702);
-- Orders (linked to products via prod_id)
INSERT INTO Tbl_Orders (order_id, prod_id, cust_id, order_date, qty) VALUES
(9001, 501, 101, '2026-04-20', 1),
(9002, 502, 102, '2026-04-21', 2);
SELECT s.sup_name, p.prod_name, o.qty
FROM Tbl_Orders o
JOIN Tbl_Products p ON o.prod_id = p.prod_id
JOIN Tbl_Suppliers s ON p.sup_id = s.sup_id;