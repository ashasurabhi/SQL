-- Calcualte the EuclideanDistance between two points
--In MSSQL

SELECT
    CAST(
        SQRT(
            POWER(MAX(lat_n) - MIN(lat_n), 2) + POWER(MAX(long_w) - MIN(long_w), 2)
        ) AS DECIMAL(18, 4)
    ) AS EuclideanDistance
FROM
    station;
