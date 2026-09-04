# Data Validation

This document summarises validation checks that are present or recommended for this project.

## Validation Evidenced by Current Files

The repository contains SQL views and CSV exports that make several checks possible:

- Monthly KPI exports can be reconciled against `fact_sales_net`.
- Return-rate logic separates return revenue, sales revenue, return invoices, sales invoices, and total invoices.
- Repeat-rate logic excludes `UNKNOWN` customer IDs before calculating repeat customers.
- Product concentration analysis excludes stock codes listed in `ref_excluded_stockcode` where that reference table is joined.
- Customer concentration analysis excludes `UNKNOWN` customer IDs.

## Suggested Validation Checks

These checks should be added before treating the dashboard as production-quality reporting:

- Row count reconciliation from raw data to cleaned data, sales-line fact, and net sales fact.
- Date range check to confirm the reporting period is complete.
- Null checks on invoice number, invoice date, stock code, quantity, price, and revenue.
- Duplicate invoice-line checks if a unique line identifier is available.
- Revenue reconciliation between line-level revenue and monthly KPI revenue.
- Return logic validation to confirm negative quantities and return invoices are treated consistently.
- Customer ID coverage check showing the share of revenue and orders linked to `UNKNOWN`.
- Product exclusion check showing which stock codes are excluded from product concentration analysis.
- Segment validation to confirm whether the GBP 50,000 B2B threshold is commercially appropriate.

## Manual Values to Add

- Raw data row count: [insert value]
- Cleaned data row count: [insert value]
- Net sales fact row count: [insert value]
- Number of duplicate records identified: [insert value]
- Revenue reconciliation difference: [insert value]
- Share of revenue from `UNKNOWN` customers: [insert value]
- Share of orders from `UNKNOWN` customers: [insert value]

## Current Limitation

The SQL transformation for `fact_sales_net_tbl` is not included in the repository. Because several KPI views depend on `fact_sales_net`, the project would be stronger if this table creation logic were documented or replaced with a reproducible SQL view.
