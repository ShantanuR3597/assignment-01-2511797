-- Q1: List all customers from Mumbai along with their total order value

SELECT c.customer_id,
       c.customer_name,
       SUM(o.total_amount) AS total_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE c.city = 'Mumbai'
GROUP BY c.customer_id, c.customer_name;


-- Q2: Find the top 3 products by total quantity sold

SELECT p.product_name,
       SUM(oi.quantity) AS total_quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
LIMIT 3;


-- Q3: List all sales representatives and the number of unique customers they have handled

SELECT r.rep_name,
       COUNT(DISTINCT o.customer_id) AS unique_customers
FROM sales_reps r
JOIN orders o ON r.rep_id = o.rep_id
GROUP BY r.rep_name;


-- Q4: Find all orders where the total value exceeds 10,000, sorted by value descending

SELECT *
FROM orders
WHERE total_amount > 10000
ORDER BY total_amount DESC;


-- Q5: Identify any products that have never been ordered

SELECT p.product_name
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;
