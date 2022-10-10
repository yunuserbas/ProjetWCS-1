
-- VENTES

/* Q1 : "Le nombre de produits vendus par catégorie et par mois */

----------------------------- Première Solution ----------------------------------------

SELECT products.productLine as "catégories", month(orders.orderDate) as `mois`, 
year(orders.orderDate) as `année`, sum(orderdetails.quantityOrdered) as `nombre de produits vendus`
From  orderdetails
Join products ON orderdetails.productCode=products.productCode
Join orders ON orders.orderNumber=orderdetails.orderNumber
Group By products.productLine, month(orders.orderDate), year(orders.orderDate) 
Order By year(orders.orderDate), month(orders.orderDate);

----------------------------- Avec "nom de produits" ------------------------------------

SELECT products.productLine as "catégories", products.productName as "nom de produits", month(orders.orderDate) as `mois`, 
year(orders.orderDate) as `année`, sum(orderdetails.quantityOrdered) as `nombre de produits vendus`
From  orderdetails
Join products ON orderdetails.productCode=products.productCode
Join orders ON orders.orderNumber=orderdetails.orderNumber
Group By products.productName, year(orders.orderDate) 
Order By products.productLine, year(orders.orderDate), month(orders.orderDate);


----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------



/* Q2 : "Avec comparaison et taux de variation par rapport au même mois de l'année précédente" */


------------------------------------------- Première Solution -----------------------------------------------------

WITH a2020 AS (SELECT productLine, productName, sum(orderdetails.quantityOrdered) as `nombre de produits vendus`, month(orderdate) as `mois`, year(orderdate) as année
From orderdetails
Join products ON orderdetails.productCode=products.productCode
Join orders ON orders.orderNumber=orderdetails.orderNumber
Where year(orderdate) = "2020"
Group By month(orderdate), productName
Order By month(orderdate)),

a2021 AS (SELECT productLine, productName, sum(orderdetails.quantityOrdered) as `nombre de produits vendus`, month(orderdate) as `mois`, year(orderdate) as année
From orderdetails
Join products ON orderdetails.productCode=products.productCode
Join orders ON orders.orderNumber=orderdetails.orderNumber
Where year(orderdate) = "2021"
Group By month(orderdate), productName
Order By month(orderdate)),

a2022 AS (SELECT productLine, productName, sum(orderdetails.quantityOrdered) as `nombre de produits vendus`, month(orderdate) as `mois`, year(orderdate) as année
From orderdetails
Join products ON orderdetails.productCode=products.productCode
Join orders ON orders.orderNumber=orderdetails.orderNumber
Where year(orderdate) = "2022"
Group By month(orderdate), productName
Order By month(orderdate)),

comparaison AS (SELECT * FROM a2020
UNION
SELECT * FROM a2021
UNION
SELECT * FROM a2022)

SELECT productLine as catégories, productName as "nom de produits", `nombre de produits vendus`, `mois`, année FROM comparaison
Group By productName, `mois`, année;

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

----------------------------------------------------- ESSAIES ------------------------------------------------------              

SELECT productLine, productName, sum(orderdetails.quantityOrdered) as `nombre de produits vendus`, month(orderdate) as `mois`, year(orderdate) as année
From orderdetails
Join products ON orderdetails.productCode=products.productCode
Join orders ON orders.orderNumber=orderdetails.orderNumber
Where year(orderdate) = "2020"
Group By month(orderdate), productName
Order By month(orderdate);

SELECT productLine, productName, sum(orderdetails.quantityOrdered) as `nombre de produits vendus`, month(orderdate) as `mois`, year(orderdate) as année
From orderdetails
Join products ON orderdetails.productCode=products.productCode
Join orders ON orders.orderNumber=orderdetails.orderNumber
Where year(orderdate) = "2021"
Group By month(orderdate), productName
Order By month(orderdate);

SELECT productLine, productName, sum(orderdetails.quantityOrdered) as `nombre de produits vendus`, month(orderdate) as `mois`, year(orderdate) as année
From orderdetails
Join products ON orderdetails.productCode=products.productCode
Join orders ON orders.orderNumber=orderdetails.orderNumber
Where year(orderdate) = "2022"
Group By month(orderdate), productName
Order By month(orderdate);

SELECT productLine, productName, sum(orderdetails.quantityOrdered), month(orderdate), year(orderdate) as année_2022
From orderdetails
Join products ON orderdetails.productCode=products.productCode
Join orders ON orders.orderNumber=orderdetails.orderNumber
Where year(orderdate) = "2022"
Group By month(orderdate), productName
Order By month(orderdate);

SELECT productLine, productName, sum(orderdetails.quantityOrdered), month(orderdate), year(orderdate) as année_2021
From orderdetails
Join products ON orderdetails.productCode=products.productCode
Join orders ON orders.orderNumber=orderdetails.orderNumber
Where year(orderdate) = "2021"
Group By month(orderdate), productName
Order By month(orderdate);

SELECT productLine, productName, sum(orderdetails.quantityOrdered), month(orderdate), year(orderdate) as année_2020
From orderdetails
Join products ON orderdetails.productCode=products.productCode
Join orders ON orders.orderNumber=orderdetails.orderNumber
Where year(orderdate) = "2020"
Group By month(orderdate), productName
Order By month(orderdate);

SELECT productLine, productName, sum(orderdetails.quantityOrdered), month(orderdate), year(orderdate)
From orderdetails
Join products ON orderdetails.productCode=products.productCode
Join orders ON orders.orderNumber=orderdetails.orderNumber
Group By year(orderdate), productName
Order By month(orderdate), year(orderdate);

SELECT productLine, productName, sum(orderdetails.quantityOrdered), month(orderdate), year(orderdate)
From orderdetails
Join products ON orderdetails.productCode=products.productCode
Join orders ON orders.orderNumber=orderdetails.orderNumber
Group By productName, month(orderdate), year(orderdate)
Order By month(orderdate), year(orderdate);

---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------

SELECT products.productline as `nom de produit`, monthname(orders.orderDate) as mois,
    sum(CASE
	WHEN year(orders.orderDate)="2020" then orderdetails.quantityOrdered else 'NA'
	END) as qte_2020,
	sum(CASE
	WHEN year(orders.orderDate)="2021" then orderdetails.quantityOrdered else 'NA'
	END) as qte_2021,
    sum(CASE WHEN year(orders.orderDate)="2022"  then orderdetails.quantityOrdered else 'NA'
	END) AS qte_2022,
	((sum(CASE
	WHEN year(orders.orderDate)="2021" then orderdetails.quantityOrdered else 'NA'
	END) /sum(CASE WHEN year(orders.orderDate)="2020" then orderdetails.quantityOrdered else 'NA'
	END)-1)*100) as "taux de 20/21",
    ((sum(CASE
	WHEN year(orders.orderDate)="2022" then orderdetails.quantityOrdered else 'NA'
	END) /sum(CASE WHEN year(orders.orderDate)="2021" then orderdetails.quantityOrdered else 'NA'
	END)-1)*100) as "Y/Y evolution 21/22"
FROM orders
JOIN orderdetails USING(orderNumber)
JOIN products USING(productCode)
GROUP BY products.productline,month(orders.orderDate);