-- Creating the Customer table
CREATE TABLE Customer (
    Customer_id   VARCHAR2(20) PRIMARY KEY,
    Customer_Name VARCHAR2(20) NOT NULL,
    Customer_Tel  NUMBER
);

-- Creating the Product table
CREATE TABLE Product (
    Product_id   VARCHAR2(20) PRIMARY KEY,
    Product_Name VARCHAR2(20) NOT NULL,
    Price        NUMBER CHECK (Price > 0)
);

-- Creating the Orders table
CREATE TABLE Orders (
    Customer_id  VARCHAR2(20),
    Product_id   VARCHAR2(20),
    Quantity     NUMBER,
    Total_amount NUMBER,
    OrderDate    DATE DEFAULT SYSDATE,  -- Adding OrderDate column with default SYSDATE
    PRIMARY KEY (Customer_id, Product_id),
    FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id),
    FOREIGN KEY (Product_id) REFERENCES Product(Product_id)
);

-- Adding a Category column to Product table
ALTER TABLE Product ADD Category VARCHAR2(20);

-- Adding an OrderDate column to Orders table (already included in CREATE statement)
ALTER TABLE Orders ADD OrderDate DATE DEFAULT SYSDATE;
