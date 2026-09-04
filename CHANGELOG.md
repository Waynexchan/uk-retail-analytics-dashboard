# Changelog

## 2026-09-04

### Added

- Added a dedicated Executive Summary page with headline KPIs, key commercial insights, business recommendations, and navigation to detailed analysis pages.
- Added a shared `DimMonth` dimension to provide consistent month filtering across monthly reporting tables.
- Added interactive month filtering across headline KPIs and supporting trend visuals.
- Added filter-aware DAX measures for selected-period KPI reporting.
- Added dynamic analytical text for selected dashboard insights and Pareto labels.
- Added average and reference lines to provide context for monthly product concentration, repeat purchase, and return-rate trends.
- Added conditional data bars to Top 10 product and customer revenue tables.
- Added report navigation and Home Page buttons across analytical pages.
- Added reset-filter functionality to the Sales Overview page.
- Added `docs/dashboard_guide.md` to document the report structure, interactions, and analytical purpose of each page.
- Added final portfolio screenshots for Executive Summary, Sales Overview, Product Analysis, and Customer Analysis.

### Changed

- Redesigned the Power BI report into a four-page analytical story:
  1. Executive Summary
  2. Sales Overview
  3. Product Analysis
  4. Customer Analysis
- Improved dashboard layout, visual hierarchy, spacing, titles, subtitles, and analytical annotations.
- Updated the Sales Overview page to support coordinated month filtering across KPI cards and monthly charts.
- Refined Product Analysis to emphasise Top 10 revenue contribution, Pareto concentration, and monthly concentration trends.
- Refined Customer Analysis to emphasise Top 10 customer contribution, Pareto concentration, and same-month repeat purchasing behaviour.
- Improved Top 10 product and customer tables with clearer ranking, revenue contribution, and conditional formatting.
- Updated Pareto annotations to communicate the number of products and customers required to reach approximately 80% of revenue.
- Refined dashboard terminology to distinguish same-month repeat purchasing from broader customer retention.
- Updated business insights and recommendations to align with the final dashboard analysis.
- Updated README documentation to reflect the final Power BI report, analytical model, dashboard features, findings, and limitations.

### Removed

- Removed unused Power BI fields and measures that were no longer required by the final dashboard.
- Removed redundant or development-stage dashboard elements from the final portfolio presentation.

### Validation

- Confirmed that the shared month slicer filters the intended KPI cards and monthly visuals consistently.
- Confirmed that dashboard visuals render without Power BI errors.
- Reconciled headline dashboard KPIs with the reporting datasets used by the Power BI model.
- Reviewed product and customer Pareto outputs against the final analytical views.

---

## 2026-06-17

### Added

- Added professional case-study documentation structure for a UK junior data analyst / commercial analyst portfolio.
- Added `docs/business_problem.md` to frame the commercial objective, stakeholders, and decision context.
- Added `docs/kpi_definitions.md` to define dashboard KPIs and link them to SQL sources.
- Added `docs/data_cleaning_steps.md` to explain the SQL cleaning and modelling workflow.
- Added `docs/data_validation.md` to document current and recommended validation checks.
- Added `docs/insights_and_recommendations.md` to separate business insights from recommendations.
- Added `docs/limitations.md` to clearly state data, business, methodology, and portfolio limitations.

### Changed

- Reworked `README.md` from a short project summary into a professional analytics case study.
- Added business problem, key questions, dataset overview, tools, cleaning summary, model summary, KPI definitions, dashboard overview, insights, recommendations, limitations, and next improvements.
- Reframed existing results in commercial language without changing the core analysis logic.

### Not Changed

- No SQL analysis logic was changed.
- No Power BI report file was changed.
- No exported CSV data was changed.
