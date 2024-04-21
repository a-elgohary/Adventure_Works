/*
 Select employee attributes
 from the employee table
*/
SELECT
  EmployeeKey AS employee_key,
  ParentEmployeeKey AS parent_employee_key,
  SalesTerritoryKey AS sales_territory_key,
  FirstName + ' ' + LastName AS fullname,
  Title AS title,
  HireDate AS hire_date,
  -- Calculate the age by subtracting the birth date from the current date
  DATEDIFF(YEAR, BirthDate, GETDATE()) AS age, 
  -- Salaried as a binary variable (1 if yes, 0 if no)
  SalariedFlag AS salaried,
  PayFrequency AS pay_frequency,
  BaseRate AS base_rate,
  -- Sales person as a binary variable (1 if yes, 0 if no)
  SalesPersonFlag AS sales_person,
  DepartmentName AS department,
  StartDate AS start_date,
  EndDate AS end_date,
  /*
   Replace the null values in the status column with 'Exited' 
   to indicate that the employee has left the company
  */
  ISNULL(Status, 'Exited') AS status
FROM
  dbo.DimEmployee;
