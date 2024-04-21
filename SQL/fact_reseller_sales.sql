/*
 This query selects the resellers sales
 for the years 2021, 2022, 2023
*/
SELECT 
  ProductKey AS product_key, 
  OrderDateKey AS order_date_key, 
  DueDateKey AS due_date_key, 
  ShipDateKey AS ship_date_key, 
  ResellerKey AS reseller_key, 
  EmployeeKey AS employee_key, 
  PromotionKey AS promotion_key, 
  CurrencyKey AS currency_key, 
  SalesTerritoryKey AS sales_territory_key, 
  SalesOrderNumber AS sales_order, 
  SalesOrderLineNumber AS sales_order_line, 
  RevisionNumber AS revision_number, 
  OrderQuantity AS order_quantity, 
  UnitPrice AS unit_price, 
  ExtendedAmount AS extended_amount, 
  UnitPriceDiscountPct AS discount_percentage, 
  DiscountAmount AS discount_amount, 
  ProductStandardCost AS standard_cost, 
  TotalProductCost AS total_cost, 
  SalesAmount AS sales_amount, 
  -- Calculate the gross profit as the difference between sales amount and total product cost
  SalesAmount - TotalProductCost AS gross_profit, 
  TaxAmt AS tax, 
  Freight AS freight, 
  -- Calculate the sale income as the difference between gross profit and tax amount
  SalesAmount - TotalProductCost - TaxAmt AS sale_income, 
  CarrierTrackingNumber AS carrier_tracking_number, 
  CustomerPONumber AS customer_po, 
  OrderDate AS order_date, 
  DueDate AS due_date, 
  ShipDate AS ship_date 
FROM 
  dbo.FactResellerSales 
WHERE 
  -- Use the LEFT function to extract the first four characters of the OrderDateKey column
  LEFT(OrderDateKey, 4) IN (2021, 2022, 2023);
