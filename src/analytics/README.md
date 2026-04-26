# analytics/

Analytics & BI — loss, profitability, cohort, CTR.

| Service | Lang | Port |
|---|---|---|
| loss-analytics          | Python | 50300 |
| profitability-analytics | Python | 50301 |
| cohort-analytics        | Python | 50302 |
| ctr-analytics           | Python | 50303 |

OLAP store: ClickHouse. ETL/orchestration: Airflow + dbt + Spark.
