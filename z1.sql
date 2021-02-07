SELECT
    name,
    SUM(quantity) AS quantity
FROM
         (
        SELECT
            pr.id,
            brandid,
            coalesce(quantity, 0) AS quantity
        FROM
            product  pr
            LEFT JOIN goods    gd ON pr.id = gd.productid
    ) res
    JOIN brand br ON res.brandid = br.id
GROUP BY
    name
ORDER BY
    quantity DESC;