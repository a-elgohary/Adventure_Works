/*
 Select customer attributes 
 from customer and geography dimension tables 
 using left join
*/
SELECT
  c.CustomerKey AS customer_key,
  c.GeographyKey AS geography_key,
  c.FirstName + ' ' + c.LastName AS full_name,
  -- Calculate the age by subtracting the birth date from the current date
  DATEDIFF(YEAR, c.BirthDate, GETDATE()) AS age,
  c.MaritalStatus AS martial_status,
  c.Gender AS gender,
  c.YearlyIncome AS yearly_income,
  -- Children at home as a binary variable (1 if yes, 0 if no)
  CASE
    WHEN c.NumberChildrenAtHome > 0 THEN 1
    ELSE 0
  END AS children_at_home,
  c.EnglishEducation AS education,
  c.EnglishOccupation AS occupation,
  c.HouseOwnerFlag AS house_owner,
  -- Car owner as a binary variable (1 if yes, 0 if no)
  CASE
    WHEN c.NumberCarsOwned > 0 THEN 1
    ELSE 0
  END AS car_owner,
  c.CommuteDistance AS commute_distance,
  g.City AS city,
  g.EnglishCountryRegionName AS country,
  -- Select the street name from the address column
  SUBSTRING(AddressLine1, CHARINDEX(' ', AddressLine1) + 1, LEN(AddressLine1)) AS street_name, 
  c.DateFirstPurchase AS first_purchase_date
FROM
  dbo.DimCustomer AS c
  LEFT JOIN dbo.DimGeography AS g
    ON c.GeographyKey = g.GeographyKey