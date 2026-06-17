# Limitations

## Data Limitations

- The raw dataset is not included in the repository.
- The creation logic for `fact_sales_net_tbl` is not included, although `fact_sales_net` depends on it.
- Customer IDs can be missing and are represented as `UNKNOWN` in the sales-line fact.
- Some customer analysis excludes `UNKNOWN` customers, which may understate total customer activity.
- Product descriptions are taken using `ANY_VALUE`, so a stock code with multiple descriptions may not show every description variation.

## Business Context Limitations

- No cost or margin data is available, so the dashboard reports revenue rather than profit.
- No stock availability data is available, so lost sales and out-of-stock effects cannot be measured.
- No marketing or channel data is available, so acquisition source and campaign impact cannot be analysed.
- No fulfilment or delivery data is available, so returns cannot be linked to operational service issues.
- No product category mapping is available, so product recommendations are stock-code focused rather than category-led.

## Methodology Limitations

- The B2B segment is based on a simple invoice revenue threshold of GBP 50,000. This is useful for analysis but should not be treated as a confirmed business classification without validation.
- Return metrics are calculated from negative quantity and revenue logic. This should be reconciled against business return definitions if used operationally.
- Monthly repeat rate only captures repeat behaviour within the same month. It does not measure longer-term retention.
- The dashboard screenshots show the report output, but the Power BI relationships and DAX measures are not documented separately yet.

## Portfolio Limitations

- Recruiters may not be able to open the PBIX file without Power BI Desktop.
- The project would benefit from a PDF export or short walkthrough video.
- A data dictionary and model diagram would make the project easier to review quickly.
