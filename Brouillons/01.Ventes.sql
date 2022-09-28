
-- Ventes

/* Le nombre de produits vendus par catégorie et par mois */

SELECT products.productLine, products.productName, month(orders.orderDate), year(orders.orderDate), sum(orderdetails.quantityOrdered) from  orderdetails
Join products ON orderdetails.productCode=products.productCode
Join orders ON orders.orderNumber=orderdetails.orderNumber
Group By products.productName, year(orders.orderDate) Order By products.productLine, month(orders.orderDate), year(orders.orderDate);

/* Avec comparaison et taux de variation par rapport au même mois de l'année précédente */

SELECT productLine, productName, sum(orderdetails.quantityOrdered), month(orderdate), year(orderdate) as année_2020, year(orderdate) as année_2021, 
year(orderdate) as année_2022 
From orderdetails
Join products ON orderdetails.productCode=products.productCode
Join orders ON orders.orderNumber=orderdetails.orderNumber
Group By year(orderdate), productName
Order By month(orderdate);
