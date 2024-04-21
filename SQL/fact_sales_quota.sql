/*
 Select sales quota attributes
 from the sales quota fact table
*/
SELECT 
SalesQuotaKey AS sales_quota_key,
EmployeeKey AS employee_key,
DateKey AS date_key,
CalendarYear AS year,
CalendarQuarter AS quarter,
SalesAmountQuota AS sales_quota,
Date AS date
FROM
    dbo.FactSalesQuota
WHERE
    CalendarYear IN (2021, 2022, 2023)