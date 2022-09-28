
-- Logistique

/* Le stock des 5 produits les plus commandés */

SELECT productName, quantityOrdered
From products
Join orderdetails On orderdetails.productCode=products.productCode
Group by productName Order by quantityOrdered Desc limit 5;



