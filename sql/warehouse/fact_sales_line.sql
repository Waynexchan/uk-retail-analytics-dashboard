SELECT  
  Invoice,
  InvoiceDate,
  DATE(InvoiceDate) AS invoice_date,
  DATE_TRUNC(DATE(InvoiceDate), MONTH) AS month,
  IFNULL(CAST(Customer_ID AS STRING),'UNKNOWN') AS customer_id,
  StockCode,
  Quantity,
  Price,
  TotalSales AS revenue,
  is_return,
  is_valid_sale
FROM `uk-retail-project.UkRetail.uk_retail_cleaned`