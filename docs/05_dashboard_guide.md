# Dashboard Guide

This Power BI dashboard is designed for business users to monitor sales performance, customer behaviour, product performance, and return trends using the UK Online Retail dataset.

The report consists of four interactive pages connected through a shared month slicer.

---

# 1. Sales Overview

## Purpose

Provide an executive summary of overall business performance.

## Business Questions

- How is the business performing overall?
- Is revenue growing over time?
- Are customer purchasing behaviours changing?
- Are repeat purchases increasing?
- Are returns becoming a concern?

## Key KPIs

- Revenue
- Orders
- Customers
- Average Order Value (AOV)
- Units Sold
- Repeat Rate
- Return Rate

## Visuals

- KPI Cards
- Monthly Revenue & Orders Trend
- Monthly Return Rate
- Monthly Repeat Rate

---

# 2. Product Analysis

## Purpose

Identify the products contributing most to business revenue.

## Business Questions

- Which products generate the highest revenue?
- Does revenue follow the Pareto Principle?
- How concentrated is product revenue?
- Which products should receive more commercial focus?

## Visuals

- Product Pareto Chart
- Top 10 Products
- Revenue Contribution

---

# 3. Customer Analysis

## Purpose

Understand customer purchasing behaviour and revenue contribution.

## Business Questions

- Who are the highest-value customers?
- What percentage of customers generate 80% of revenue?
- How concentrated is customer revenue?
- Which customers should be prioritised?

## Visuals

- Customer Pareto Chart
- Customer Revenue Ranking
- Revenue Contribution Distribution

---

# 4. Return Analysis

## Purpose

Monitor product returns and identify potential operational issues.

## Business Questions

- Is the return rate increasing?
- Which months experience higher returns?
- Are returns affecting revenue significantly?

## Visuals

- Monthly Return Rate
- Return Revenue
- Return Orders

---

# Interactive Features

- Shared Month Slicer across all report pages
- Dynamic KPI Cards
- Interactive filtering
- Cross-highlighting between visuals

---

# Technology Stack

- Google BigQuery
- SQL
- Power BI
- DAX

# Dashboard Navigation

Page 1
Sales Overview
│
├── Executive KPI Monitoring
├── Revenue Trend
├── Repeat Rate
└── Return Rate

↓

Page 2
Product Analysis
│
├── Pareto Analysis
├── Top Products
└── Revenue Contribution

↓

Page 3
Customer Analysis
│
├── Customer Pareto
├── Customer Ranking
└── Revenue Distribution

↓

Page 4
Return Analysis
│
├── Return Rate
├── Return Revenue
└── Return Orders

## Design Principles

The dashboard was designed to support executive decision-making by presenting high-level KPIs first, followed by drill-down analysis into products, customers, and returns. All report pages share a common month slicer to provide a consistent analytical experience.