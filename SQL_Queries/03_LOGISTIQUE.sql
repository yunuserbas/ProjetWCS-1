

-- Logistique

/* Le stock des 5 produits les plus commandés */

SELECT productName, sum(quantityOrdered), quantityInStock
From products
Join orderdetails On orderdetails.productCode=products.productCode
Group by productName Order by sum(quantityOrdered) Desc limit 5;













