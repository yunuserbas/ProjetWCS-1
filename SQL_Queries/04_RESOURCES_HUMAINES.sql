

SELECT employeeNumber, firstName, lastName, month(orderDate) as mt, year(orderDate) as yr, sum(priceEach*quantityOrdered), 
row_number() over (partition by mt, yr) as row_num
From customers
Inner Join orderdetails ON orderNumber.orderdetails=orderNumber.orders
Inner Join orders ON customerNumber.orders=customerNumber.customers
Inner Join employees On employeeNumber.employees=salesRepEmployeeNumber.customers
Group By firstname, lastname
Order By yr, mt, sum(priceEach*quantityOrdered);

-- STAR --

WITH turnover as (SELECT employees.employeeNumber,  employees.firstName,  employees.lastName, month(orders.orderDate) as mois, 
year(orders.orderDate) as année, sum(orderdetails.priceEach*quantityOrdered) as `Chiffre d'Affaire`, row_number() over (partition by année, mois ORDER BY `Chiffre d'Affaire` ) as row_num
From customers
Join employees On employees.employeeNumber=customers.salesRepEmployeeNumber
Join orders Using (customerNumber)
Join orderdetails Using (orderNumber)
Group By employees.firstName,  employees.lastName, année, mois
Order By année, mois, `Chiffre d'Affaire`)

SELECT firstName,  lastName, année, mois, `Chiffre d'Affaire`, row_num FROM turnover
Where row_num < 3;





With turnover as(SELECT firstName, lastname, orderdate, month(orders.orderDate)as mois, year(orders.orderDate)as année,
sum(orderdetails.quantityordered*priceeach)as ca, row_number() over (partition by mois, année) as row_num
From customers
Join employees On employees.employeeNumber=customers.salesRepEmployeeNumber
Join orders Using (customerNumber)
join orderdetails using(ordernumber)
Group by firstname, lastname, année, mois
Order by année, mois, ca desc)

select firstName, lastname, année, mois, ca, row_num 
from turnover;
