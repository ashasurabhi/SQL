--In MSSQL

SELECT cast(AVG(lat_n * 1.0)as decimal(18,4)) AS Median
FROM (
    SELECT lat_n, 
           ROW_NUMBER() OVER (ORDER BY lat_n) AS RowAsc,
           ROW_NUMBER() OVER (ORDER BY lat_n DESC) AS RowDesc
    FROM Station
) AS OrderedData
WHERE RowAsc = RowDesc
or abs(RowAsc-RowDesc)=1;  --Assume this will work for even set
