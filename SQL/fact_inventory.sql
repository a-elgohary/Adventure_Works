/*
 Select product inventory attributes
 from the product inventory fact table
*/
SELECT
ProductKey AS product_key,
DateKey AS date_key,
MovementDate AS movement_date,
UnitCost AS unit_cost,
UnitsIn AS units_in,
UnitsOut AS units_out,
UnitsBalance AS units_balance
FROM
    dbo.FactProductInventory
WHERE
    LEFT(DateKey, 4) IN (2021, 2022, 2023)
