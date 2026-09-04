SELECT
  Invoice,
  InvoiceDate,
  DATE_TRUNC(DATE(InvoiceDate), MONTH) AS month,
  Customer_ID,
  Country,
  Description,
  StockCode,
  Quantity,
  Price,
  TotalSales,
  CASE WHEN Quantity < 0 THEN 1 ELSE 0 END AS is_return,
  CASE WHEN Quantity > 0 AND Price > 0 THEN 1 ELSE 0 END AS is_valid_sale


FROM `uk-retail-project.UkRetail.uk_retail_raw`