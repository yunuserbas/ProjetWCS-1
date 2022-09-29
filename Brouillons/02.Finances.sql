
-- FINANCES

/* Question 1 : "Le chiffre d'affaires des commandes des deux derniers mois par pays" */

------------ Prèmiere Solution Pour priceEach*quantityOrdered Comme CA -------------------

SELECT country, month(orders.orderDate) as `month`, 
year(orders.orderDate) as `year`,sum(orderdetails.priceEach*quantityOrdered) as `Chiffre d'Affaire`
FROM customers
Join orders Using (customerNumber)
Join orderdetails Using (orderNumber)
Where orders.orderDate >= Date(now() - interval 3 month)
Group By country, `month`, `year`
Order By `year`, `month`, country;

-------------------------------------------------------------------------------------------
------------ Deuxième Solution Pour priceEach*quantityOrdered Comme CA --------------------

WITH mois7 AS (SELECT country, month(orders.orderDate) as `month`, 
year(orders.orderDate) as `year`,sum(orderdetails.priceEach*quantityOrdered) as `Chiffre d'Affaire`
FROM customers
Join orders Using (customerNumber)
Join orderdetails Using (orderNumber)
Where year(orders.orderDate) = 2022 and month(orders.orderDate) = 7
Group By country, `month`, `year`
Order By `year`, `month`, country),

mois8 AS (SELECT country, month(orders.orderDate) as `month`, 
year(orders.orderDate) as `year`,sum(orderdetails.priceEach*quantityOrdered) as `Chiffre d'Affaire`
FROM customers
Join orders Using (customerNumber)
Join orderdetails Using (orderNumber)
Where year(orders.orderDate) = 2022 and month(orders.orderDate) = 8
Group By country, `month`, `year`
Order By `year`, `month`, country)

SELECT * FROM mois7
UNION
SELECT * FROM mois8;

-------------------------------------------------------------------------------------------------
----------------------------- Solution Pour amount Comme CA -----------------------------------

SELECT country, amount, paymentDate
FROM customers
JOIN payments ON payments.customerNumber=customers.customerNumber
JOIN orders ON orders.customerNumber=customers.customerNumber
Where paymentDate >= Date(now() - interval 2 month)
Group By country;





/* Question 2 : "Commandes qui n'ont pas encore été payées" */
          

SELECT orderNumber, amount
FROM customers
JOIN payments ON payments.customerNumber=customers.customerNumber
LEFT JOIN orders ON orders.customerNumber=customers.customerNumber
Where shippedDate IS NULL
Group By orderNUmber;






