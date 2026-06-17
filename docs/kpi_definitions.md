# KPI Definitions

This document defines the main KPIs used in the SQL views and Power BI dashboard.

## Revenue

Sum of net sales revenue from `fact_sales_net`.

SQL source: `sql/kpi/kpi_monthly_summary.sql`

## Orders

Count of invoice-level records after grouping invoice lines by month, invoice, and customer.

SQL source: `sql/kpi/kpi_monthly_summary.sql`

## Customers

Count of distinct known customer IDs. Where the KPI is customer-specific, `UNKNOWN` customer IDs are excluded.

SQL sources:

- `sql/kpi/kpi_monthly_summary.sql`
- `sql/kpi/kpi_monthly_repeat_rate.sql`

## Units

Sum of item quantities from the invoice-level aggregation.

SQL source: `sql/kpi/kpi_monthly_summary.sql`

## Average Order Value (AOV)

Revenue divided by orders.

Formula:

```text
AOV = total revenue / total orders
```

SQL source: `sql/kpi/kpi_monthly_summary.sql`

## Repeat Rate

Share of known customers who placed at least two invoices in the same month.

Formula:

```text
Repeat rate = repeated customers / total known customers
```

SQL source: `sql/kpi/kpi_monthly_repeat_rate.sql`

## Return Rate by Amount

Returned revenue divided by sales revenue.

Formula:

```text
Return rate by amount = return revenue / sales revenue
```

SQL source: `sql/kpi/kpi_monthly_return_rate.sql`

## Return Rate by Orders vs Sales Orders

Return invoices divided by sales invoices.

Formula:

```text
Return order rate vs sales = return orders / sales orders
```

SQL source: `sql/kpi/kpi_monthly_return_rate.sql`

## Return Rate by Orders vs Total Orders

Return invoices divided by all invoices.

Formula:

```text
Return order rate vs total = return orders / total orders
```

SQL source: `sql/kpi/kpi_monthly_return_rate.sql`

## Top 10 Product Contribution

Revenue share contributed by the top 10 products in each month.

SQL source: `sql/analytics/kpi_monthly_top10_product_contribution.sql`

## Product Revenue Concentration

Number and percentage of products required to reach approximately 80% cumulative product revenue.

SQL sources:

- `sql/analytics/product_overall_pareto_base.sql`
- `sql/analytics/kpi_product_concentration_80.sql`

## Customer Revenue Concentration

Number and percentage of known customers required to reach approximately 80% cumulative customer revenue.

SQL source: `sql/analytics/customer_overall_rank_base.sql`

## B2B Revenue Share

Share of revenue from invoices classified as `B2B`.

Current classification:

```text
B2B invoice = invoice revenue >= GBP 50,000
```

SQL sources:

- `sql/warehouse/dim_invoice_segment.sql`
- `sql/kpi/kpi_monthly_b2b_share.sql`

This rule is a working analytical assumption and should be validated against business rules before operational use.
