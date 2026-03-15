## ETL Decisions

### Decision 1 — Standardizing Date Formats
Problem: The raw transactional data contained multiple date formats such as DD/MM/YYYY and MM-DD-YYYY, which could lead to inconsistencies during analysis.

Resolution: All dates were standardized into the ISO format (YYYY-MM-DD) before loading into the warehouse. A separate date dimension table (dim_date) was created to store structured date attributes such as month and year, making time-based analysis easier.

### Decision 2 — Handling NULL Values
Problem: Some fields in the raw dataset contained NULL values for important attributes like store or product information. This could break foreign key relationships and lead to incomplete records in the warehouse.

Resolution: Missing values were either replaced with appropriate defaults or excluded during transformation. Only valid records with complete dimension references were inserted into the warehouse tables to maintain referential integrity.

### Decision 3 — Standardizing Product Category Casing
Problem: Product categories in the raw dataset had inconsistent casing such as "electronics", "Electronics", and "ELECTRONICS". This could cause incorrect aggregation results during reporting.

Resolution: All category values were standardized to a consistent format (Title Case) before loading into the dim_product table. This ensures accurate grouping and reporting in analytical queries.
