/*
 Select date attributes
 from the date dimension table
 for the years 2021, 2022, and 2023
*/
SELECT
  DateKey AS date_key,
  FullDateAlternateKey AS date,
  EnglishDayNameOfWeek AS week_day,
  DayNumberOfMonth AS day,
  LEFT(EnglishMonthName, 3) AS month,
  MonthNumberOfYear AS month,
  CalendarYear AS year,
  CalendarQuarter AS quarter,
  CalendarSemester AS semester,
  FiscalYear AS fiscal_year -- Fiscal year starts on July
FROM
  dbo.DimDate
WHERE
  CalendarYear IN (2021, 2022, 2023)
ORDER BY
  date ASC;
