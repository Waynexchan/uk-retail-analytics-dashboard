# SQL Architecture

The SQL layer is organised into four stages:

## 01_staging

Cleans and standardises the raw UK retail dataset.

## 02_warehouse

Builds reusable fact and dimension tables.

## 03_marts

Contains curated datasets exported from BigQuery as CSV files
and loaded into Power BI.

## 04_analysis

Contains supporting and exploratory analyses not directly loaded
into the current Power BI report.

## Current Power BI data flow

Raw CSV
→ BigQuery staging
→ BigQuery warehouse tables
→ BigQuery analytical marts
→ CSV export
→ Power BI