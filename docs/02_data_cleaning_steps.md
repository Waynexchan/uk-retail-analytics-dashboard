# Data Cleaning and Transformation Steps

## Source Layer

The raw transaction table is referenced in BigQuery as:

```text
uk-retail-project.UkRetail.uk_retail_raw
```

The raw table itself is not stored in this repository.

## Cleaned Transaction Layer

SQL file: `sql/warehouse/uk_retail_cleaned.sql`

Main transformations:

- Retains invoice, invoice date, customer, country, product, quantity, price, and total sales fields.
- Converts invoice timestamp to a reporting month using `DATE_TRUNC`.
- Creates `is_return` where quantity is negative.
- Creates `is_valid_sale` where quantity is positive and price is positive.

## Sales-Line Fact

SQL file: `sql/warehouse/fact_sales_line.sql`

Main transformations:

- Converts invoice timestamp into `invoice_date`.
- Keeps month as a reporting date.
- Converts customer ID to a string.
- Replaces missing customer IDs with `UNKNOWN`.
- Renames `TotalSales` to `revenue`.
- Carries return and valid-sale flags into the reporting layer.

## Net Sales Fact

SQL file: `sql/warehouse/fact_sales_net.sql`

This view points to `fact_sales_net_tbl`, which is assumed to contain net sales records used by the KPI and analytics views. The logic that creates `fact_sales_net_tbl` is not included in the repository and should be documented if available.

Manual detail to add:

- [insert net sales filtering rule]
- [insert treatment of returns in fact_sales_net_tbl]
- [insert reconciliation between fact_sales_line and fact_sales_net_tbl]

## Invoice-Level Fact

SQL file: `sql/warehouse/fact_invoice_net.sql`

Main transformations:

- Groups net sales by invoice, month, and customer.
- Calculates invoice revenue.
- Calculates invoice units.

## Dimensions

SQL files:

- `sql/warehouse/dim_customer.sql`
- `sql/warehouse/dim_product.sql`
- `sql/warehouse/dim_invoice_segment.sql`

Customer dimension:

- Creates one row per customer ID.
- Stores one country value per customer.

Product dimension:

- Creates one row per stock code.
- Stores a trimmed product description.

Invoice segment dimension:

- Classifies invoice-level records as `B2B` where invoice revenue is at least GBP 50,000.
- Classifies remaining invoices as `Retail`.

## KPI and Analytics Views

SQL folders:

- `sql/kpi/`
- `sql/analytics/`

These views calculate monthly summary KPIs, return rates, repeat rates, B2B share, product contribution, product Pareto analysis, and customer revenue ranking.

## Recommended Cleaning Documentation to Add

- Raw row count before cleaning: [insert value]
- Cleaned row count after transformation: [insert value]
- Number of missing customer IDs: [insert value]
- Number of return lines: [insert value]
- Number of invalid sale lines removed or flagged: [insert value]
- Explanation of how `fact_sales_net_tbl` is created: [insert detail]
