-- Create the employee table
CREATE TABLE
    employee (
        emp_id INT PRIMARY KEY,
        first_name VARCHAR(40),
        last_name VARCHAR(40),
        birth_day DATE,
        sex VARCHAR(1),
        salary INT,
        super_id INT,
        branch_id INT
    );

-- Create the branch table
CREATE TABLE
    branch (
        branch_id INT PRIMARY KEY,
        branch_name VARCHAR(40),
        mgr_id INT,
        mgr_start_date DATE,
        FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE
        SET
            NULL
    );

-- ensure super_id & branch_id are FKs in employee table
ALTER TABLE
    employee
ADD
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE
SET
    NULL;

ALTER TABLE
    employee
ADD
    FOREIGN KEY(super_id) REFERENCES employee(emp_id) ON DELETE
SET
    NULL;

-- Create the client table
CREATE TABLE
    client (
        client_id INT PRIMARY KEY,
        client_name VARCHAR(40),
        branch_id INT,
        FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE
        SET
            NULL
    );

-- Create the works_with table
CREATE TABLE
    works_with (
        emp_id INT,
        client_id INT,
        total_sales INT,
        PRIMARY KEY(emp_id, client_id),
        FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
        FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
    );

-- Create the branch_supplier table
CREATE TABLE
    branch_supplier (
        branch_id INT,
        supplier_name VARCHAR(40),
        supply_type VARCHAR(40),
        PRIMARY KEY(branch_id, supplier_name),
        FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
    );

-- Return the list of 10 highest paid employees
SELECT
    first_name,
    last_name,
    salary
FROM
    employee
ORDER BY
    salary DESC
LIMIT
    10;

-- Return the number of female employees born after 1970
SELECT
    COUNT(emp_id)
FROM
    employee
WHERE
    sex = 'F'
    AND birth_day > '1971-01-01';

-- Return the average salary for each gender
SELECT
    AVG(salary),
    sex
FROM
    employee
GROUP BY
    sex;

-- Return total sales for each sales person
SELECT
    SUM(total_sales),
    emp_id
FROM
    works_with
GROUP BY
    emp_id;

-- Return any clients who are an LLC
SELECT
    *
FROM
    client
WHERE
    client_name LIKE '%LLC';

-- Return any suppliers who are in the 'label' business
SELECT
    *
FROM
    branch_supplier
WHERE
    supplier_name LIKE '% Label%';

-- Return any employees born in October
SELECT
    first_name,
    last_name,
    birth_day
FROM
    employee
WHERE
    birth_day LIKE '____-10%';

-- Return the sum of money spent and sum of money earned
SELECT
    SUM(salary) as money_spent_and_earned
FROM
    employee
UNION
SELECT
    SUM(total_sales)
FROM
    works_with;

-- Return all branches and the names of their managers
SELECT
    employee.emp_id,
    employee.first_name,
    branch.branch_name
FROM
    employee
    JOIN branch ON employee.emp_id = branch.mgr_id;

-- Return all employees who have sold over 30k to a single client
SELECT
    employee.first_name,
    employee.last_name
FROM
    employee
WHERE
    employee.emp_id IN (
        SELECT
            works_with.emp_id
        FROM
            works_with
        WHERE
            works_with.total_sales > 30000
    );

-- Return list of clients managed by the branch employee 102 oversees
SELECT
    client.client_name
FROM
    client
WHERE
    client.branch_id = (
        SELECT
            branch.branch_id
        FROM
            branch
        WHERE
            branch.mgr_id = 102
        LIMIT
            1
    );
