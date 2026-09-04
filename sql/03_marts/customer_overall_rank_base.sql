-- ============================================================
-- Query: customer_overall_rank_base
--
-- Purpose:
-- Rank customers by revenue and calculate cumulative revenue
-- share for full-period Pareto analysis.
--
-- Grain:
-- One row per identified customer.
--
-- Scope:
-- Full analysis period; not affected by Power BI month filters.
--
-- Used by:
-- Power BI - Customer Analysis page
-- ============================================================
WITH customer_base AS (

SELECT  
  customer_id,
  SUM(revenue) AS customer_revenue


FROM `uk-retail-project.UkRetail.fact_sales_net` 
WHERE customer_id != 'UNKNOWN'
GROUP BY customer_id
) , Ranked AS (
  SELECT 
  customer_id,
  customer_revenue,
  SUM(customer_revenue) OVER() AS total_revenue,
  ROW_NUMBER() OVER (ORDER BY customer_revenue DESC) AS customer_rank
  FROM customer_base
) SELECT
  customer_id,
  customer_revenue,
  total_revenue,
  customer_rank,
  SAFE_DIVIDE(customer_revenue, total_revenue) AS revenue_share,
  SUM(SAFE_DIVIDE(customer_revenue, total_revenue)) OVER (ORDER BY customer_rank) AS cumulative_share
  FROM Ranked
