


-- Resources Humaines

/* Chaque mois, les 2 vendeurs avec le chiffre d'affaire le plus élevé */

----- Star -----
SELECT firstName, lastName, month(paymentDate), year(paymentDate), sum(amount)
From customers
Left Join employees On employees.employeeNumber=customers.salesRepEmployeeNumber
Right Join payments Using (customerNumber) -- On payments.customerNumber=customers.customerNumber
Group By firstname, lastname, year(paymentDate), month(paymentDate)
Order By year(paymentDate), month(paymentDate), sum(amount) desc;

----- Try (Solution) -----
WITH a7 as(SELECT * From
(SELECT firstName, lastName, month(paymentDate) as mt, year(paymentDate) as yr, sum(amount) as CA
From customers
Left Join employees On employees.employeeNumber=customers.salesRepEmployeeNumber
Right Join payments On payments.customerNumber=customers.customerNumber
Group By firstname, lastname, yr, mt
Order By yr, mt, CA desc) as tab1
Where mt = 7 and yr = 2020
Order By mt, yr, CA desc limit 2),


a8 as (SELECT * From
(SELECT firstName, lastName, month(paymentDate) as mt, year(paymentDate) as yr, sum(amount) as CA
From customers
Left Join employees On employees.employeeNumber=customers.salesRepEmployeeNumber
Right Join payments On payments.customerNumber=customers.customerNumber
Group By firstname, lastname, yr, mt
Order By yr, mt, CA desc) as tab1
Where mt = 8 and yr = 2020
Order By mt, yr, CA desc limit 2),

a9 as (SELECT * From
(SELECT firstName, lastName, month(paymentDate) as mt, year(paymentDate) as yr, sum(amount) as CA
From customers
Left Join employees On employees.employeeNumber=customers.salesRepEmployeeNumber
Right Join payments On payments.customerNumber=customers.customerNumber
Group By firstname, lastname, yr, mt
Order By yr, mt, CA desc) as tab1
Where mt = 9 and yr = 2020
Order By mt, yr, CA desc limit 2),

a10 as (SELECT * From
(SELECT firstName, lastName, month(paymentDate) as mt, year(paymentDate) as yr, sum(amount) as CA
From customers
Left Join employees On employees.employeeNumber=customers.salesRepEmployeeNumber
Right Join payments On payments.customerNumber=customers.customerNumber
Group By firstname, lastname, yr, mt
Order By yr, mt, CA desc) as tab1
Where mt = 10 and yr = 2020
Order By mt, yr, CA desc limit 2),

a11 as (SELECT * From
(SELECT firstName, lastName, month(paymentDate) as mt, year(paymentDate) as yr, sum(amount) as CA
From customers
Left Join employees On employees.employeeNumber=customers.salesRepEmployeeNumber
Right Join payments On payments.customerNumber=customers.customerNumber
Group By firstname, lastname, yr, mt
Order By yr, mt, CA desc) as tab1
Where mt = 11 and yr = 2020
Order By mt, yr, CA desc limit 2),

a12 as (SELECT * From
(SELECT firstName, lastName, month(paymentDate) as mt, year(paymentDate) as yr, sum(amount) as CA
From customers
Left Join employees On employees.employeeNumber=customers.salesRepEmployeeNumber
Right Join payments On payments.customerNumber=customers.customerNumber
Group By firstname, lastname, yr, mt
Order By yr, mt, CA desc) as tab1
Where mt = 12 and yr = 2020
Order By mt, yr, CA desc limit 2),

b1 as (SELECT * From
(SELECT firstName, lastName, month(paymentDate) as mt, year(paymentDate) as yr, sum(amount) as CA
From customers
Left Join employees On employees.employeeNumber=customers.salesRepEmployeeNumber
Right Join payments On payments.customerNumber=customers.customerNumber
Group By firstname, lastname, yr, mt
Order By yr, mt, CA desc) as tab1
Where mt = 1 and yr = 2021
Order By mt, yr, CA desc limit 2),

b2 as (SELECT * From
(SELECT firstName, lastName, month(paymentDate) as mt, year(paymentDate) as yr, sum(amount) as CA
From customers
Left Join employees On employees.employeeNumber=customers.salesRepEmployeeNumber
Right Join payments On payments.customerNumber=customers.customerNumber
Group By firstname, lastname, yr, mt
Order By yr, mt, CA desc) as tab1
Where mt = 2 and yr = 2021
Order By mt, yr, CA desc limit 2),

b3 as (SELECT * From
(SELECT firstName, lastName, month(paymentDate) as mt, year(paymentDate) as yr, sum(amount) as CA
From customers
Left Join employees On employees.employeeNumber=customers.salesRepEmployeeNumber
Right Join payments On payments.customerNumber=customers.customerNumber
Group By firstname, lastname, yr, mt
Order By yr, mt, CA desc) as tab1
Where mt = 3 and yr = 2021
Order By mt, yr, CA desc limit 2),

b4 as (SELECT * From
(SELECT firstName, lastName, month(paymentDate) as mt, year(paymentDate) as yr, sum(amount) as CA
From customers
Left Join employees On employees.employeeNumber=customers.salesRepEmployeeNumber
Right Join payments On payments.customerNumber=customers.customerNumber
Group By firstname, lastname, yr, mt
Order By yr, mt, CA desc) as tab1
Where mt = 4 and yr = 2021
Order By mt, yr, CA desc limit 2),

b5 as (SELECT * From
(SELECT firstName, lastName, month(paymentDate) as mt, year(paymentDate) as yr, sum(amount) as CA
From customers
Left Join employees On employees.employeeNumber=customers.salesRepEmployeeNumber
Right Join payments On payments.customerNumber=customers.customerNumber
Group By firstname, lastname, yr, mt
Order By yr, mt, CA desc) as tab1
Where mt = 5 and yr = 2021
Order By mt, yr, CA desc limit 2),

b6 as (SELECT * From
(SELECT firstName, lastName, month(paymentDate) as mt, year(paymentDate) as yr, sum(amount) as CA
From customers
Left Join employees On employees.employeeNumber=customers.salesRepEmployeeNumber
Right Join payments On payments.customerNumber=customers.customerNumber
Group By firstname, lastname, yr, mt
Order By yr, mt, CA desc) as tab1
Where mt = 6 and yr = 2021
Order By mt, yr, CA desc limit 2),

b7 as (SELECT * From
(SELECT firstName, lastName, month(paymentDate) as mt, year(paymentDate) as yr, sum(amount) as CA
From customers
Left Join employees On employees.employeeNumber=customers.salesRepEmployeeNumber
Right Join payments On payments.customerNumber=customers.customerNumber
Group By firstname, lastname, yr, mt
Order By yr, mt, CA desc) as tab1
Where mt = 7 and yr = 2021
Order By mt, yr, CA desc limit 2),

b8 as (SELECT * From
(SELECT firstName, lastName, month(paymentDate) as mt, year(paymentDate) as yr, sum(amount) as CA
From customers
Left Join employees On employees.employeeNumber=customers.salesRepEmployeeNumber
Right Join payments On payments.customerNumber=customers.customerNumber
Group By firstname, lastname, yr, mt
Order By yr, mt, CA desc) as tab1
Where mt = 8 and yr = 2021
Order By mt, yr, CA desc limit 2),

b9 as (SELECT * From
(SELECT firstName, lastName, month(paymentDate) as mt, year(paymentDate) as yr, sum(amount) as CA
From customers
Left Join employees On employees.employeeNumber=customers.salesRepEmployeeNumber
Right Join payments On payments.customerNumber=customers.customerNumber
Group By firstname, lastname, yr, mt
Order By yr, mt, CA desc) as tab1
Where mt = 9 and yr = 2021
Order By mt, yr, CA desc limit 2),

b10 as (SELECT * From
(SELECT firstName, lastName, month(paymentDate) as mt, year(paymentDate) as yr, sum(amount) as CA
From customers
Left Join employees On employees.employeeNumber=customers.salesRepEmployeeNumber
Right Join payments On payments.customerNumber=customers.customerNumber
Group By firstname, lastname, yr, mt
Order By yr, mt, CA desc) as tab1
Where mt = 10 and yr = 2021
Order By mt, yr, CA desc limit 2),

b11 as (SELECT * From
(SELECT firstName, lastName, month(paymentDate) as mt, year(paymentDate) as yr, sum(amount) as CA
From customers
Left Join employees On employees.employeeNumber=customers.salesRepEmployeeNumber
Right Join payments On payments.customerNumber=customers.customerNumber
Group By firstname, lastname, yr, mt
Order By yr, mt, CA desc) as tab1
Where mt = 11 and yr = 2021
Order By mt, yr, CA desc limit 2),

b12 as (SELECT * From
(SELECT firstName, lastName, month(paymentDate) as mt, year(paymentDate) as yr, sum(amount) as CA
From customers
Left Join employees On employees.employeeNumber=customers.salesRepEmployeeNumber
Right Join payments On payments.customerNumber=customers.customerNumber
Group By firstname, lastname, yr, mt
Order By yr, mt, CA desc) as tab1
Where mt = 12 and yr = 2021
Order By mt, yr, CA desc limit 2),

c1 as (SELECT * From
(SELECT firstName, lastName, month(paymentDate) as mt, year(paymentDate) as yr, sum(amount) as CA
From customers
Left Join employees On employees.employeeNumber=customers.salesRepEmployeeNumber
Right Join payments On payments.customerNumber=customers.customerNumber
Group By firstname, lastname, yr, mt
Order By yr, mt, CA desc) as tab1
Where mt = 1 and yr = 2022
Order By mt, yr, CA desc limit 2),

c2 as (SELECT * From
(SELECT firstName, lastName, month(paymentDate) as mt, year(paymentDate) as yr, sum(amount) as CA
From customers
Left Join employees On employees.employeeNumber=customers.salesRepEmployeeNumber
Right Join payments On payments.customerNumber=customers.customerNumber
Group By firstname, lastname, yr, mt
Order By yr, mt, CA desc) as tab1
Where mt = 2 and yr = 2022
Order By mt, yr, CA desc limit 2),

c3 as (SELECT * From
(SELECT firstName, lastName, month(paymentDate) as mt, year(paymentDate) as yr, sum(amount) as CA
From customers
Left Join employees On employees.employeeNumber=customers.salesRepEmployeeNumber
Right Join payments On payments.customerNumber=customers.customerNumber
Group By firstname, lastname, yr, mt
Order By yr, mt, CA desc) as tab1
Where mt = 3 and yr = 2022
Order By mt, yr, CA desc limit 2),

c4 as (SELECT * From
(SELECT firstName, lastName, month(paymentDate) as mt, year(paymentDate) as yr, sum(amount) as CA
From customers
Left Join employees On employees.employeeNumber=customers.salesRepEmployeeNumber
Right Join payments On payments.customerNumber=customers.customerNumber
Group By firstname, lastname, yr, mt
Order By yr, mt, CA desc) as tab1
Where mt = 4 and yr = 2022
Order By mt, yr, CA desc limit 2),

c5 as (SELECT * From
(SELECT firstName, lastName, month(paymentDate) as mt, year(paymentDate) as yr, sum(amount) as CA
From customers
Left Join employees On employees.employeeNumber=customers.salesRepEmployeeNumber
Right Join payments On payments.customerNumber=customers.customerNumber
Group By firstname, lastname, yr, mt
Order By yr, mt, CA desc) as tab1
Where mt = 5 and yr = 2022
Order By mt, yr, CA desc limit 2),

c6 as (SELECT * From
(SELECT firstName, lastName, month(paymentDate) as mt, year(paymentDate) as yr, sum(amount) as CA
From customers
Left Join employees On employees.employeeNumber=customers.salesRepEmployeeNumber
Right Join payments On payments.customerNumber=customers.customerNumber
Group By firstname, lastname, yr, mt
Order By yr, mt, CA desc) as tab1
Where mt = 6 and yr = 2022
Order By mt, yr, CA desc limit 2),

c7 as (SELECT * From
(SELECT firstName, lastName, month(paymentDate) as mt, year(paymentDate) as yr, sum(amount) as CA
From customers
Left Join employees On employees.employeeNumber=customers.salesRepEmployeeNumber
Right Join payments On payments.customerNumber=customers.customerNumber
Group By firstname, lastname, yr, mt
Order By yr, mt, CA desc) as tab1
Where mt = 7 and yr = 2022
Order By mt, yr, CA desc limit 2),

c8 as (SELECT * From
(SELECT firstName, lastName, month(paymentDate) as mt, year(paymentDate) as yr, sum(amount) as CA
From customers
Left Join employees On employees.employeeNumber=customers.salesRepEmployeeNumber
Right Join payments On payments.customerNumber=customers.customerNumber
Group By firstname, lastname, yr, mt
Order By yr, mt, CA desc) as tab1
Where mt = 8 and yr = 2022
Order By mt, yr, CA desc limit 2)

Select * From a7
Union
Select * From a8
Union
Select * From a9
Union
Select * From a10
Union
Select * From a11
Union
Select * From a12
Union
Select * From b1
Union
Select * From b2
Union
Select * From b3
Union
Select * From b4
Union
Select * From b5
Union
Select * From b6
Union
Select * From b7
Union
Select * From b8
Union
Select * From b9
Union
Select * From b10
Union
Select * From b11
Union
Select * From b12
Union
Select * From c1
Union
Select * From c2
Union
Select * From c3
Union
Select * From c4
Union
Select * From c5
Union
Select * From c6
Union
Select * From c7
Union
Select * From c8





 
