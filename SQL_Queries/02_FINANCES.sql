
-- FINANCES

/* Le chiffre d'affaires des commandes des deux derniers mois par pays */

------ priceEach*quantityOrdered --------------------------------------------------------

WITH mois7 AS (SELECT country, month(orders.orderDate) as `month`, 
year(orders.orderDate) as `year`,sum(orderdetails.priceEach*quantityOrdered) as `Chiffre d'Affaire`
FROM customers
Join orders Using (customerNumber)
Join orderdetails Using (orderNumber)
Where year(orders.orderDate) = 2022 and month(orders.orderDate) = 8
Group By country, `month`, `year`
Order By `year`, `month`, country),

mois8 AS (SELECT country, month(orders.orderDate) as `month`, 
year(orders.orderDate) as `year`,sum(orderdetails.priceEach*quantityOrdered) as `Chiffre d'Affaire`
FROM customers
Join orders Using (customerNumber)
Join orderdetails Using (orderNumber)
Where year(orders.orderDate) = 2022 and month(orders.orderDate) = 9
Group By country, `month`, `year`
Order By `year`, `month`, country)

SELECT * FROM mois7
UNION
SELECT * FROM mois8;

-----------------------------------------------------------------------------------------------

SELECT country, month(orders.orderDate) as `month`, 
year(orders.orderDate) as `year`,sum(orderdetails.priceEach*quantityOrdered) as `Chiffre d'Affaire`
FROM customers
Join orders Using (customerNumber)
Join orderdetails Using (orderNumber)
Where orders.orderDate >= Date(now() - interval 2 month)
Group By country, `month`, `year`
Order By `year`, `month`, country;

SELECT country, sum(orderdetails.priceEach*quantityOrdered) as `Chiffre d'Affaire`
FROM customers
Join orders Using (customerNumber)
Join orderdetails Using (orderNumber)
Group By country
Order By `Chiffre d'Affaire` desc;

------------------------------------------------------------------------------------------------

--- amount et paymentDate ---------------------------------------------------------------------

SELECT country, amount, paymentDate
FROM customers
JOIN payments ON payments.customerNumber=customers.customerNumber
JOIN orders ON orders.customerNumber=customers.customerNumber
Where paymentDate >= Date(now() - interval 2 month)
Group By country;

/* Commandes qui n'ont pas encore été payées */

SELECT country, sum(priceEach*quantityOrdered), sum(amount), sum(priceEach*quantityOrdered) - sum(amount) as remain
FROM customers
JOIN payments ON payments.customerNumber=customers.customerNumber
LEFT JOIN orders ON orders.customerNumber=customers.customerNumber
LEFT JOIN orderdetails USING (orderNumber)
GROUP BY country, payments.customerNumber;