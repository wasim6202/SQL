CREATE TABLE Sales (
    SaleID INT,
    EmployeeID INT,
    Amount DECIMAL(10,2),
    SaleDate DATE
);
CREATE TABLE Employees (
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50)
);
-- Employees
INSERT INTO Employees VALUES
(1, 'Alice', 'Electronics'),
(2, 'Bob', 'Electronics'),
(3, 'Charlie', 'Home'),
(4, 'David', 'Clothing');

-- Sales
INSERT INTO Sales VALUES
(101, 1, 5000.00, '2024-01-15'),
(102, 2, 7000.00, '2024-01-20'),
(103, 1, 4500.00, '2024-02-10'),
(104, 3, 3000.00, '2024-01-25'),
(105, 4, 2500.00, '2024-03-05'),
(106, 2, 5000.00, '2024-03-10');

-- Window Function
SELECT 
  EmployeeID,
  DATE_TRUNC('month', SaleDate) AS Month,
  SUM(Amount) AS MonthlySales,
  RANK() OVER (PARTITION BY DATE_TRUNC('month', SaleDate) ORDER BY SUM(Amount) DESC) AS SalesRank
FROM Sales
GROUP BY EmployeeID, DATE_TRUNC('month', SaleDate);
SELECT e.EmployeeName, SUM(s.Amount) AS TotalSales
FROM Employees e
JOIN Sales s ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID, e.EmployeeName
HAVING SUM(s.Amount) > (
    SELECT AVG(Total)
    FROM (
        SELECT SUM(Amount) AS Total
        FROM Sales
        GROUP BY EmployeeID
    ) AS SubSales
);
WITH MonthlyDeptSales AS (
    SELECT 
      e.Department,
      DATE_TRUNC('month', s.SaleDate) AS Month,
      SUM(s.Amount) AS TotalSales
    FROM Sales s
    JOIN Employees e ON s.EmployeeID = e.EmployeeID
    GROUP BY e.Department, DATE_TRUNC('month', s.SaleDate)
)
SELECT * FROM MonthlyDeptSales
ORDER BY Month, TotalSales DESC;
