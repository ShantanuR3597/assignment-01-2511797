## Anomaly Analysis

### Insert Anomaly

In the `orders_flat.csv` dataset, product information is stored together with order information in the same table. This means that a new product cannot be added to the system unless an order exists for that product. For example, if the company introduces a new product but no customer has ordered it yet, there is no way to insert that product into the table without creating a fake order row. This dependency between orders and products creates an insert anomaly.

### Update Anomaly

Customer information appears multiple times across different rows because each order record repeats the customer details. For example, if customer `CUST005` appears in multiple rows and their city changes from one location to another, every row containing that customer must be updated. If even one row is missed, the database will contain inconsistent data where the same customer appears to live in two different cities.

### Delete Anomaly

Because all information is stored in a single table, deleting an order can unintentionally remove important information about a product or customer. For example, if the only order containing a particular product is deleted, the product information would also disappear from the database. This results in the loss of product data even though the product should still exist in the company's catalog.


## Normalization Justification

Keeping all order, customer, product, and sales representative data in a single table might appear simpler at first, but it quickly leads to serious data management issues. The `orders_flat.csv` dataset demonstrates how storing everything together results in redundancy and inconsistencies. Customer information, for example, is repeated across multiple rows for each order they place. If a customer changes their city or contact details, every record containing that customer must be updated. This creates the risk of update anomalies where some rows are updated while others are not, resulting in inconsistent information.

Another problem is insert anomalies. In the current structure, it is impossible to add a new product or sales representative unless an order exists that references them. This limits the flexibility of the system and forces the company to insert incomplete or artificial records just to store new information. Similarly, delete anomalies can occur when removing an order record removes the only reference to a product or customer.

Normalization solves these issues by separating the data into logical tables such as customers, products, orders, and order items. Each table stores a single type of information, reducing redundancy and improving data integrity. By using primary keys and foreign keys, relationships between tables are maintained without duplicating data. This structure makes the system easier to maintain, prevents inconsistencies, and supports scalable database design.
