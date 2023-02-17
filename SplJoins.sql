/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
select P.name as products, c.name as categoties from products as p
inner join categories as c on c.CategoryID = p.CategoryID
where c.name = 'Computers';
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 select p.name, p.price, r.rating from products as p
 inner join reviews as r on r.ProductID = p.ProductID
 where r.Rating =  5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select e.firstname, e.lastname, sum(s.quantity) as total from sales s
inner join employees as e on e.EmployeeID = s.EmployeeID
group by e.EmployeeID
order by total desc
limit 10;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
select d.name as 'Department Name', c.name as 'Category Name' from departments as d
inner join categories as c on c.DepartmentID = d.DepartmentID
where c.name = 'Appliances' or c.name='Games';
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
select p.name as 'Product Name', sum(s.quantity) as 'Total Sold', sum(s.quantity * s.PricePerUnit) as 'Total Price'
from products as p
inner join sales as s on s.ProductID = p.ProductID
where p.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select p.name, r.reviewer, r.rating, r.comment from products as p
inner join reviews as r on r.ProductID = p.ProductID
where p.ProductID = 857 and r.Rating = 1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
select e.employeeId, e.FirstName, e.LastName, p.name, sum(s.quantity) as totalSold from sales as s
inner join employees as e on e.EmployeeID = s.EmployeeID
inner join products as p on p.ProductID = s.ProductID
group by e.EmployeeID, p.ProductID
order by e.FirstName;