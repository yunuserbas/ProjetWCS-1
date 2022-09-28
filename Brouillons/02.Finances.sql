
-- FINANCES

/* Le chiffre d'affaires des commandes des deux derniers mois par pays */

SELECT country, amount, paymentDate
FROM customers
JOIN payments ON payments.customerNumber=customers.customerNumber
JOIN orders ON orders.customerNumber=customers.customerNumber
Where paymentDate >= Date(now() - interval 2 month)
Group By country;

/* Commandes qui n'ont pas encore été payées */

SELECT orderNumber, amount
FROM customers
JOIN payments ON payments.customerNumber=customers.customerNumber
LEFT JOIN orders ON orders.customerNumber=customers.customerNumber
Where shippedDate IS NULL
Group By orderNUmber;






