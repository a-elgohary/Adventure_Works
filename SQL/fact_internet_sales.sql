/*
 This query selects the internet sales
 for the years 2021, 2022, 2023
*/
WITH inventory_level AS (
/*
 Select the available inventory on order
 based on the latest inventory level on the movement date
*/
  SELECT l.*
  FROM dbo.FactProductInventory AS l
  LEFT JOIN dbo.FactProductInventory AS ll
    ON l.ProductKey = ll.ProductKey
    AND l.DateKey = ll.DateKey
    AND l.MovementDate < ll.MovementDate
  WHERE ll.MovementDate IS NULL
)

SELECT 
  s.ProductKey AS product_key,
  s.OrderDateKey AS order_date_key,
  s.DueDateKey AS due_date_key,
  s.ShipDateKey AS ship_date_key,
  s.CustomerKey AS customer_key,
  s.PromotionKey AS promotion_key,
  s.CurrencyKey AS currency_key,
  s.SalesTerritoryKey AS territory_key,
  s.SalesOrderNumber AS order_number, 
  r.SalesReasonKey AS sales_reason_key,
  i.UnitsBalance AS available_stock,
  s.OrderQuantity AS order_quantity,
  s.UnitPrice AS unit_price,
  s.ExtendedAmount AS total_price,
  s.UnitPriceDiscountPct AS discount_percentage,
  s.DiscountAmount AS discount_amount,
  s.ProductStandardCost AS standard_cost,
  s.TotalProductCost AS total_cost,
  s.SalesAmount AS sales_amount,
  s.TaxAmt AS tax_amount,
  s.Freight AS frieght,
  s.OrderDate AS order_date,
  s.DueDate AS due_date,
  s.ShipDate AS ship_date
FROM
  dbo.FactInternetSales AS s
  -- Use a left join to include all the rows from the FactInternetSales table
  LEFT JOIN dbo.FactInternetSalesReason AS r
    ON s.SalesOrderNumber = r.SalesOrderNumber
  LEFT JOIN inventory_level AS i
    ON s.ProductKey = i.ProductKey 
    AND s.OrderDateKey = i.DateKey
WHERE
  -- Use the LEFT function to extract the first four characters of the OrderDateKey column
  LEFT(s.OrderDateKey, 4) IN (2021, 2022, 2023)
ORDER BY OrderDate DESC;