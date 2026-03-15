-- Create Dimension Tables

CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL
);

CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);

-- Create Fact Table

CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    date_id INT NOT NULL,
    store_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- Insert cleaned data into dimension tables

INSERT INTO dim_date VALUES
(1, '2024-01-01', 1, 2024),
(2, '2024-01-02', 1, 2024),
(3, '2024-02-01', 2, 2024),
(4, '2024-02-10', 2, 2024),
(5, '2024-03-01', 3, 2024);

INSERT INTO dim_store VALUES
(1, 'Central Mall Store', 'Mumbai'),
(2, 'City Plaza Store', 'Delhi'),
(3, 'Market Square Store', 'Bangalore');

INSERT INTO dim_product VALUES
(1, 'Laptop', 'Electronics'),
(2, 'Smartphone', 'Electronics'),
(3, 'T-Shirt', 'Clothing'),
(4, 'Jeans', 'Clothing'),
(5, 'Organic Milk', 'Groceries');

-- Insert sample cleaned fact data (10 rows)

INSERT INTO fact_sales VALUES
(1,1,1,1,2,120000),
(2,1,1,2,3,90000),
(3,2,2,3,5,5000),
(4,2,2,4,2,4000),
(5,3,3,5,10,3000),
(6,3,1,1,1,60000),
(7,4,2,2,2,60000),
(8,4,3,3,4,4000),
(9,5,1,4,3,6000),
(10,5,3,5,8,2400);
