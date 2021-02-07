SELECT warname, SUM(quantity) as quantity FROM(select warname, quantity, country FROM (SELECT war.name AS warname, quantity, brandID FROM (SELECT pr.id, brandID, COALESCE(quantity, 0) AS quantity, warehouseID FROM product pr LEFT JOIN goods gd ON pr.id = gd.productID) ret JOIN warehouse war ON war.id=ret.warehouseID) res JOIN brand br ON res.brandID=br.id WHERE country='DE') GROUP BY warname;

select prodname, name FROM (select prodname, name, SUM(quantity) as quantity FROM (SELECT pr.id, brandID, COALESCE(quantity, 0) AS quantity, name AS prodname FROM product pr LEFT JOIN goods gd ON pr.id = gd.productID) res JOIN brand br ON res.brandID=br.id group by prodname HAVING quantity=0);


SELECT prodname, quantity, war.name AS warname FROM (SELECT pr.name AS prodname, SUM(quantity) as quantity, MAX(quantity) as maxquant, gd.warehouseid AS wrid FROM product pr JOIN goods gd ON pr.id = gd.productID GROUP BY prodname) res JOIN warehouse war ON war.id=res.wrid where quantity>100;