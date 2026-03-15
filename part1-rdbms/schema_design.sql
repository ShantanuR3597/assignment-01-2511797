-- Customers table
CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);

-- Products table
CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price INTEGER NOT NULL
);

-- Sales Representatives table
CREATE TABLE sales_reps (
    rep_id VARCHAR(10) PRIMARY KEY,
    rep_name VARCHAR(100) NOT NULL
);

-- Orders table
CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    rep_id VARCHAR(10) NOT NULL,
    order_date DATE NOT NULL,
    total_amount INTEGER NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (rep_id) REFERENCES sales_reps(rep_id)
);

-- Order Items table
CREATE TABLE order_items (
    order_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INTEGER NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Sample data for customers
INSERT INTO customers VALUES ('C001','Rahul Sharma','Mumbai');
INSERT INTO customers VALUES ('C002','Priya Mehta','Delhi');
INSERT INTO customers VALUES ('C003','Amit Singh','Mumbai');
INSERT INTO customers VALUES ('C004','Neha Gupta','Bangalore');
INSERT INTO customers VALUES ('C005','Arjun Verma','Mumbai');

-- Sample data for products
INSERT INTO products VALUES ('P001','Laptop',80000);
INSERT INTO products VALUES ('P002','Headphones',3000);
INSERT INTO products VALUES ('P003','Smartphone',50000);
INSERT INTO products VALUES ('P004','Keyboard',1500);
INSERT INTO products VALUES ('P005','Monitor',12000);

-- Sample data for sales representatives
INSERT INTO sales_reps VALUES ('R001','Ankit Jain');
INSERT INTO sales_reps VALUES ('R002','Meera Shah');
INSERT INTO sales_reps VALUES ('R003','Rohan Patel');
INSERT INTO sales_reps VALUES ('R004','Karan Kapoor');
INSERT INTO sales_reps VALUES ('R005','Sneha Desai');

-- Sample data for orders
INSERT INTO orders VALUES ('O001','C001','R001','2023-05-01',15000);
INSERT INTO orders VALUES ('O002','C002','R002','2023-05-03',25000);
INSERT INTO orders VALUES ('O003','C003','R001','2023-05-05',12000);
INSERT INTO orders VALUES ('O004','C004','R003','2023-05-07',18000);
INSERT INTO orders VALUES ('O005','C005','R004','2023-05-09',9000);

-- Sample data for order items
INSERT INTO order_items VALUES ('O001','P001',1);
INSERT INTO order_items VALUES ('O002','P002',2);
INSERT INTO order_items VALUES ('O003','P003',1);
INSERT INTO order_items VALUES ('O004','P004',3);
INSERT INTO order_items VALUES ('O005','P005',1);
