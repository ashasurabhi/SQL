/*
In MSSQL
*/
SELECT 
    CAST(CEILING(AVG(CAST(salary AS FLOAT)) - AVG(CAST(REPLACE(Salary, '0', '') AS FLOAT))) AS INT) AS RoundedDifference
FROM
    Employees;