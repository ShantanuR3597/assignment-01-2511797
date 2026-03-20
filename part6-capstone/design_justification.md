## Storage Systems

To meet the four system goals, a combination of storage systems is used.

For patient readmission prediction, historical structured data from the EHR system is stored in a Data Warehouse, as it allows efficient querying and feature extraction for machine learning models.

For doctor queries using plain English, unstructured data such as doctor notes is stored in a Data Lake and processed using NLP techniques. A vector-based retrieval system can be used to enable semantic search.

For monthly reporting, the Data Warehouse is used since it is optimized for analytical queries like aggregations and trends (e.g., bed occupancy and department costs).

For real-time ICU monitoring, streaming data from ICU devices is ingested and processed using a real-time pipeline, and stored in a fast-access system (such as a time-series or streaming database) to trigger alerts instantly.

---

## OLTP vs OLAP Boundary

The OLTP layer consists of systems like EHR, billing, and ICU devices, where real-time transactional data is generated and updated frequently.

The OLAP layer begins after data ingestion, where data is cleaned, transformed, and stored in the Data Warehouse. This layer is used for reporting, analytics, and machine learning.

Thus, OLTP handles operational workloads, while OLAP supports analytical and decision-making processes.

---

## Trade-offs

One key trade-off in this architecture is between real-time processing and system complexity.

Supporting real-time ICU monitoring requires streaming infrastructure, which increases system complexity and maintenance overhead compared to batch-only systems.

To mitigate this, a hybrid approach is used where critical ICU data is processed in real-time for alerts, while less critical data is processed in batches for reporting and analysis. This ensures both responsiveness and efficiency without overcomplicating the system.
