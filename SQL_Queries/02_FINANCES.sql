
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


WITH payeur as
(
select customers.customerNumber, customerName, round(sum(amount)) as paye
from toys_and_models.payments
inner join customers on customers.customerNumber = payments.customerNumber
group by customerNumber)
SELECT*, CA-Paye as RestantDue
from ( select customerNumber, round(sum(quantityOrdered*priceEach)) as ca, paye
from orders
join orderdetails as od using(orderNumber)
join payeur using(customerNumber)
WHERE orders.status != 'cancelled'
group by customerNumber) as result
ORDER BY RestantDue DESC;
