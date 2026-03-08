WITH base AS (
  SELECT
    month,
    SUM(invoice_revenue) AS total_revenue,
    COUNT(*) AS total_invoices,
    SUM(IF(segment = 'B2B', invoice_revenue, 0)) AS b2b_revenue,
    COUNTIF(segment = 'B2B') AS b2b_invoices
  FROM `uk-retail-project.UkRetail.dim_invoice_segment`
  GROUP BY month
)
SELECT
  month,
  total_revenue,
  b2b_revenue,
  SAFE_DIVIDE(b2b_revenue, total_revenue) AS b2b_revenue_share,
  total_invoices,
  SAFE_DIVIDE(b2b_invoices, total_invoices) AS b2b_invoice_share
FROM base
ORDER BY month