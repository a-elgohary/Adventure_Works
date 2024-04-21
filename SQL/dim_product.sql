/* 
 Select distinct product attributes 
 including conditional transformations and joins 
*/
SELECT 
  DISTINCT p.ProductKey AS product_key, -- Unique identifier for the product
  p.ProductAlternateKey AS alternate_key,
  CASE 
   /*
    Assign key 38 for products with 'Paint' in their name and no subcategory
    Assign key 39 for products with no subcategory
   */
    WHEN p.ProductSubcategoryKey IS NULL AND p.EnglishProductName LIKE 'Paint%' THEN 38
    WHEN p.ProductSubcategoryKey IS NULL THEN 39
    ELSE p.ProductSubcategoryKey
  END AS subcategory_key, 
  p.EnglishProductName AS product_name,
  ISNULL(p.ModelName, '-') AS model_name, -- Model name or '-' if null
  p.Color AS color,
  p.FinishedGoodsFlag AS finished_goods,
  p.DaysToManufacture AS days_to_manufacture,
  p.SafetyStockLevel AS safety_stock_level,
  p.ReorderPoint AS reorder_point,
  -- If the product price is null, get the value from fact inventory table
  COALESCE(
    p.StandardCost,
    (SELECT MAX(UnitCost)
     FROM dbo.FactProductInventory
     WHERE ProductKey = p.ProductKey)
  ) AS standard_cost,
  ISNULL(p.ListPrice, 0) AS list_price, -- List price of the product or 0 if null
  ISNULL(p.DealerPrice, 0) AS dealer_price, -- Dealer price of the product or 0 if null
  p.StartDate AS start_date,
  p.EndDate AS end_date,
  CASE 
  /*
    Product status column
    Set 'TRUE' if status is 'current'
    'FALSE' for other cases
  */
    WHEN Status = 'current' THEN 'TRUE'
    ELSE 'FALSE'
  END AS 'current'
FROM 
  dbo.DimProduct AS p 
  LEFT JOIN dbo.FactProductInventory AS i -- Left join with product inventory facts
  ON p.ProductKey = i.ProductKey -- Joining on product key
