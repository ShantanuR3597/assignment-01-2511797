## Anomaly Analysis

### Insert Anomaly
In the orders_flat table, product information is stored together with order data. If a new product needs to be added but no order has been placed yet, the product cannot be inserted without creating an order record.

### Update Anomaly
Customer details such as city may appear in multiple rows. If the customer moves to a new city, every record must be updated. Missing even one update results in inconsistent data.

### Delete Anomaly
If the only order containing a product is deleted, the product information will also be removed from the database, causing loss of product data.
