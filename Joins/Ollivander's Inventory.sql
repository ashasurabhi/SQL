WITH Inventory AS
(
    SELECT
        w.id,
        wp.age,
        w.coins_needed,
        w.power,
        ROW_NUMBER() OVER (PARTITION BY wp.age, w.power ORDER BY w.coins_needed) AS rownum
    FROM
        wands w
    JOIN
        wands_property wp ON w.code = wp.code AND wp.is_evil = 0
)

SELECT
    Inventory.id,
    Inventory.age,
    Inventory.coins_needed,
    Inventory.power
FROM
    Inventory
WHERE
    rownum = 1
ORDER BY
    Inventory.power DESC,
    Inventory.age DESC;