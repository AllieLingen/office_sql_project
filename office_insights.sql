-- Return sum of total sales for each sales person
select sum(total_sales), emp_id from works_with group by emp_id;

-- Return AVG Salary Grouped by Gender
SELECT AVG(salary),sex FROM employee GROUP BY sex LIMIT 100;

-- Return the Count of Unique Supply Types from Branch Suppliers
SELECT COUNT(supply_type), supply_type FROM branch_supplier group by supply_type;
