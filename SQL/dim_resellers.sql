/*
 Select the resellers attributes
 from the reseller dimension table
*/
SELECT 
ResellerKey AS reseller_key,
GeographyKey AS geography_key,
BusinessType AS business_type,
ResellerName AS reseller_name,
NumberEmployees AS number_of_employees,
OrderFrequency AS order_frequency,
OrderMonth AS order_month,
YearOpened AS year_opened,
FirstOrderYear AS first_order_year,
LastOrderYear AS last_order_year,
ProductLine AS product_line,
-- Select the street name from the address column
SUBSTRING(AddressLine1, CHARINDEX(' ', AddressLine1) + 1, LEN(AddressLine1)) AS address,
AnnualSales AS annual_sales,
MinPaymentType AS payment_type,
MinPaymentAmount AS min_payment_amount,
AnnualRevenue AS annual_revenue
FROM
    dbo.DimReseller