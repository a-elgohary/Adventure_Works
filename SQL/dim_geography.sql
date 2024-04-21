/*
 Select geography attributes
 from the geography table
*/
SELECT
  GeographyKey AS geography_key,
  City AS city,
  StateProvinceCode AS state_province_code,
  StateProvinceName AS state_province,
  CountryRegionCode AS country_code,
  EnglishCountryRegionName AS country,
  PostalCode AS postal_code,
  SalesTerritoryKey AS sales_territory_key,
  IpAddressLocator AS ip_address_locator
FROM
  dbo.DimGeography;
