📘 Table Reference

You already have:

+-----+-------------+------------------+------------+--------+
| sid | sname       | email            | phone      | salary |
+-----+-------------+------------------+------------+--------+
|   1 | Rohan Yadav | rohan@gmail.com  | 1122233344 | 412000 |
|   2 | Manish      | manish@gmail.com | 222132432  |  42000 |
|   3 | Paritosh    | pari@gmail.com   | 322233344  |  12000 |
|   4 | Neeraj      | neeraj@gmail.com | 142132432  |  32000 |
|   5 | Maynak      | mayank@gmail.com | 2378736589 |  42000 |
+-----+-------------+------------------+------------+--------+

🔍 1. LIKE Operator (pattern matching)

Used to search for a pattern in a string.

Wildcard	Meaning
%	Represents zero or more characters
_	Represents a single character
-- Names starting with 'M'
SELECT * FROM aspirants WHERE sname LIKE 'M%';

-- Names ending with 'h'
SELECT * FROM aspirants WHERE sname LIKE '%h';

-- Names containing 'ya'
SELECT * FROM aspirants WHERE sname LIKE '%ya%';

🧮 2. BETWEEN Operator

Used to filter results within a range (inclusive).

-- Salary between 30000 and 100000
SELECT * FROM aspirants WHERE salary BETWEEN 30000 AND 100000;

-- Salary not between 30000 and 100000
SELECT * FROM aspirants WHERE salary NOT BETWEEN 30000 AND 100000;

-- sid between 2 and 4
SELECT * FROM aspirants WHERE sid BETWEEN 2 AND 4;

🧾 3. IN Operator

Used when you want to match multiple possible values.

-- Select aspirants with sid 1, 3, or 5
SELECT * FROM aspirants WHERE sid IN (1, 3, 5);

-- Exclude sid 1, 3, and 5
SELECT * FROM aspirants WHERE sid NOT IN (1, 3, 5);

-- Match specific names
SELECT * FROM aspirants WHERE sname IN ('Rohan Yadav', 'Manish');

📑 4. ORDER BY (Sorting)

Used to sort the result set — ascending (ASC) by default, or descending (DESC).

-- Order by salary ascending
SELECT * FROM aspirants ORDER BY salary ASC;

-- Order by salary descending
SELECT * FROM aspirants ORDER BY salary DESC;

-- Order by name alphabetically
SELECT * FROM aspirants ORDER BY sname;

-- Order by salary descending, then by name ascending
SELECT * FROM aspirants ORDER BY salary DESC, sname ASC;

🛠 5. UPDATE Statement (Modify existing records)
-- Update salary for a single aspirant
UPDATE aspirants SET salary = 55000 WHERE sid = 2;

-- Update multiple columns
UPDATE aspirants SET sname='Manish Kumar', salary=60000 WHERE sid=2;

-- Increase all salaries by 10%
UPDATE aspirants SET salary = salary * 1.10;

🔢 6. Comparison Operators
Operator	Description	Example
=	Equal to	salary = 42000
<> or !=	Not equal to	salary <> 42000
>	Greater than	salary > 42000
<	Less than	salary < 42000
>=	Greater than or equal to	salary >= 42000
<=	Less than or equal to	salary <= 42000

Examples:

SELECT * FROM aspirants WHERE salary = 42000;
SELECT * FROM aspirants WHERE salary <> 42000;
SELECT * FROM aspirants WHERE salary > 40000;
SELECT * FROM aspirants WHERE salary < 50000;
SELECT * FROM aspirants WHERE salary >= 42000;
SELECT * FROM aspirants WHERE salary <= 32000;

🧩 BONUS: Combining Conditions

You can combine conditions using AND, OR, and NOT.

-- Salary > 30000 and name starts with 'M'
SELECT * FROM aspirants WHERE salary > 30000 AND sname LIKE 'M%';

-- Salary < 40000 or name contains 'ya'
SELECT * FROM aspirants WHERE salary < 40000 OR sname LIKE '%ya%';

-- NOT condition
SELECT * FROM aspirants WHERE NOT sname = 'Neeraj';




⚡ LIMIT Clause — Definition

The LIMIT keyword is used to restrict the number of rows returned by a SELECT query.
It’s especially useful when:

You only want to preview a few records.

You’re implementing pagination (e.g., showing 10 results per page).

🧾 Syntax
SELECT column_list
FROM table_name
LIMIT [offset,] row_count;


OR equivalently:

SELECT column_list
FROM table_name
LIMIT row_count OFFSET offset;

🧩 Examples (Using your table: aspirants)
1️⃣ Get first 3 aspirants
SELECT * FROM aspirants LIMIT 3;


✅ Returns the first 3 rows from the table.

2️⃣ Skip first 2 rows, then fetch next 3 rows
SELECT * FROM aspirants LIMIT 2, 3;


➡️ Here:

2 → offset (skip first 2 records)

3 → fetch next 3 records

Equivalent version:

SELECT * FROM aspirants LIMIT 3 OFFSET 2;

3️⃣ Get top 2 aspirants with highest salary
SELECT * FROM aspirants ORDER BY salary DESC LIMIT 2;


✅ Returns only top 2 highest-paid aspirants.

4️⃣ Get bottom 2 aspirants with lowest salary
SELECT * FROM aspirants ORDER BY salary ASC LIMIT 2;


✅ Returns lowest-paid 2 aspirants.


Combine LIMIT with WHERE and ORDER BY
-- Top 3 aspirants with salary greater than 30000
SELECT * FROM aspirants
WHERE salary > 30000
ORDER BY salary DESC
LIMIT 3;


✅ Quick Recap:

Use	Example	Result
Show first N rows	LIMIT N	Top N records
Skip M and take N	LIMIT M, N	Pagination style
Sort + Limit	ORDER BY salary DESC LIMIT 3	Top salaries
With WHERE	WHERE salary > 40000 LIMIT 2	Filter + limit





👉 Aggregate Functions

These are built-in MySQL functions used to perform calculations on multiple rows and return a single summarized value (like total, average, min, max, etc.).

Let’s learn all of them with your table aspirants 👇

🧾 Your Table Reference
+-----+-------------+------------------+------------+--------+
| sid | sname       | email            | phone      | salary |
+-----+-------------+------------------+------------+--------+
|   1 | Rohan Yadav | rohan@gmail.com  | 1122233344 | 412000 |
|   2 | Manish      | manish@gmail.com | 222132432  |  42000 |
|   3 | Paritosh    | pari@gmail.com   | 322233344  |  12000 |
|   4 | Neeraj      | neeraj@gmail.com | 142132432  |  32000 |
|   5 | Maynak      | mayank@gmail.com | 2378736589 |  42000 |
+-----+-------------+------------------+------------+--------+

📊 1. COUNT() — Count number of records

Counts how many rows (or non-NULL values) exist.

SELECT COUNT(*) FROM aspirants;
-- Output: 5


🔹 Count only names (non-NULL)

SELECT COUNT(sname) FROM aspirants;


🔹 Count how many have salary greater than 40000

SELECT COUNT(*) FROM aspirants WHERE salary > 40000;

💰 2. SUM() — Total of numeric column

Adds all values of a numeric field.

SELECT SUM(salary) FROM aspirants;
-- Output: 540000


🔹 Total salary of aspirants earning above 30000:

SELECT SUM(salary) FROM aspirants WHERE salary > 30000;

📈 3. AVG() — Average value

Returns the average (mean) value.

SELECT AVG(salary) FROM aspirants;
-- Output: 108000


🔹 Average salary of aspirants whose salary < 50000:

SELECT AVG(salary) FROM aspirants WHERE salary < 50000;

🏆 4. MAX() — Highest value

Returns the largest value in a column.

SELECT MAX(salary) FROM aspirants;
-- Output: 412000


🔹 Highest salary below 1 lakh:

SELECT MAX(salary) FROM aspirants WHERE salary < 100000;

📉 5. MIN() — Lowest value

Returns the smallest value in a column.

SELECT MIN(salary) FROM aspirants;
-- Output: 12000


🔹 Lowest salary above 20000:

SELECT MIN(salary) FROM aspirants WHERE salary > 20000;





🧾 Your Table (for reference)
+-----+-------------+------------------+------------+--------+
| sid | sname       | email            | phone      | salary |
+-----+-------------+------------------+------------+--------+
|   1 | Rohan Yadav | rohan@gmail.com  | 1122233344 | 412000 |
|   2 | Manish      | manish@gmail.com | 222132432  |  42000 |
|   3 | Paritosh    | pari@gmail.com   | 322233344  |  12000 |
|   4 | Neeraj      | neeraj@gmail.com | 142132432  |  32000 |
|   5 | Maynak      | mayank@gmail.com | 2378736589 |  42000 |
+-----+-------------+------------------+------------+--------+

🥇 1️⃣ Highest Salary (1st max)

Get the maximum salary directly using MAX():

SELECT MAX(salary) AS first_highest_salary
FROM aspirants;


✅ Output: 412000

To get the aspirant details:

SELECT * FROM aspirants
WHERE salary = (SELECT MAX(salary) FROM aspirants);


✅ Output: Rohan Yadav

🥈 2️⃣ Second Highest Salary

We find the maximum salary less than the first maximum — using a subquery:

SELECT MAX(salary) AS second_highest_salary
FROM aspirants
WHERE salary < (SELECT MAX(salary) FROM aspirants);


✅ Output: 42000

Get full aspirant details:

SELECT * FROM aspirants
WHERE salary = (
    SELECT MAX(salary)
    FROM aspirants
    WHERE salary < (SELECT MAX(salary) FROM aspirants)
);


✅ Output: Manish and Maynak (both have ₹42000)

🥉 3️⃣ Third Highest Salary

Now we go one level deeper — find max less than the 2nd highest:

SELECT MAX(salary) AS third_highest_salary
FROM aspirants
WHERE salary < (
    SELECT MAX(salary)
    FROM aspirants
    WHERE salary < (
        SELECT MAX(salary)
        FROM aspirants
    )
);


✅ Output: 32000

Get full aspirant details:

SELECT * FROM aspirants
WHERE salary = (
    SELECT MAX(salary)
    FROM aspirants
    WHERE salary < (
        SELECT MAX(salary)
        FROM aspirants
        WHERE salary < (
            SELECT MAX(salary)
            FROM aspirants
        )
    )
);


✅ Output: Neeraj (₹32000)

🪙 Similarly for Minimum Salaries
🔻 1️⃣ Lowest Salary
SELECT MIN(salary) AS first_lowest_salary
FROM aspirants;


✅ 12000 (Paritosh)

Get full details:

SELECT * FROM aspirants
WHERE salary = (SELECT MIN(salary) FROM aspirants);

🔻 2️⃣ Second Lowest Salary
SELECT MIN(salary) AS second_lowest_salary
FROM aspirants
WHERE salary > (SELECT MIN(salary) FROM aspirants);


✅ 32000 (Neeraj)

Full details:

SELECT * FROM aspirants
WHERE salary = (
    SELECT MIN(salary)
    FROM aspirants
    WHERE salary > (SELECT MIN(salary) FROM aspirants)
);

🔻 3️⃣ Third Lowest Salary
SELECT MIN(salary) AS third_lowest_salary
FROM aspirants
WHERE salary > (
    SELECT MIN(salary)
    FROM aspirants
    WHERE salary > (
        SELECT MIN(salary)
        FROM aspirants
    )
);


✅ 42000 (Manish and Maynak)

Full details:

SELECT * FROM aspirants
WHERE salary = (
    SELECT MIN(salary)
    FROM aspirants
    WHERE salary > (
        SELECT MIN(salary)
        FROM aspirants
        WHERE salary > (
            SELECT MIN(salary)
            FROM aspirants
        )
    )
);


🧩 Definition:

The WHERE clause is used to filter records based on specific conditions before performing operations like SELECT, UPDATE, DELETE, or COUNT.

👉 Think of it as:

“Return only those rows where the condition is TRUE.”

🧾 Basic Syntax
SELECT column_list 
FROM table_name 
WHERE condition;

🧱 Example with your aspirants table
+-----+-------------+------------------+------------+--------+
| sid | sname       | email            | phone      | salary |
+-----+-------------+------------------+------------+--------+
|   1 | Rohan Yadav | rohan@gmail.com  | 1122233344 | 412000 |
|   2 | Manish      | manish@gmail.com | 222132432  |  42000 |
|   3 | Paritosh    | pari@gmail.com   | 322233344  |  12000 |
|   4 | Neeraj      | neeraj@gmail.com | 142132432  |  32000 |
|   5 | Maynak      | mayank@gmail.com | 2378736589 |  42000 |
+-----+-------------+------------------+------------+--------+

🧠 Common WHERE Conditions
1️⃣ Equality (=)
SELECT * FROM aspirants WHERE sname = 'Rohan Yadav';

2️⃣ Not Equal (<> or !=)
SELECT * FROM aspirants WHERE sname <> 'Neeraj';

3️⃣ Greater Than (>)
SELECT * FROM aspirants WHERE salary > 40000;

4️⃣ Less Than (<)
SELECT * FROM aspirants WHERE salary < 40000;

5️⃣ Greater Than or Equal (>=)
SELECT * FROM aspirants WHERE salary >= 42000;

6️⃣ Less Than or Equal (<=)
SELECT * FROM aspirants WHERE salary <= 32000;

7️⃣ Multiple Conditions using AND
SELECT * FROM aspirants 
WHERE salary > 30000 AND sname LIKE 'M%';


✅ Both conditions must be true.

8️⃣ Multiple Conditions using OR
SELECT * FROM aspirants 
WHERE salary = 42000 OR salary = 32000;


✅ Any one condition must be true.

9️⃣ Combine AND + OR with Parentheses
SELECT * FROM aspirants
WHERE (salary > 30000 AND sname LIKE 'M%') OR salary < 20000;


✅ Parentheses decide condition priority.

🔟 Using NOT
SELECT * FROM aspirants 
WHERE NOT salary = 42000;


✅ Excludes salary = 42000.

🧮 WHERE with Aggregate and Subquery
➤ Example 1: Using WHERE with Subquery
SELECT * FROM aspirants
WHERE salary = (SELECT MAX(salary) FROM aspirants);


✅ Returns the aspirant with highest salary.



Example 2: With Aggregate Function in Subquery
SELECT * FROM aspirants
WHERE salary > (SELECT AVG(salary) FROM aspirants);


✅ Returns aspirants earning above average.

🧾 WHERE in Other Statements
➤ UPDATE with WHERE
UPDATE aspirants 
SET salary = 45000 
WHERE sid = 3;

➤ DELETE with WHERE
DELETE FROM aspirants 
WHERE salary < 15000;

💡 Key Notes
Symbol	Meaning	Example
=	Equal	salary = 42000
<> or !=	Not equal	salary <> 42000
>	Greater than	salary > 30000
<	Less than	salary < 30000
>=	Greater or equal	salary >= 30000
<=	Less or equal	salary <= 30000
AND	Both true	salary > 20000 AND sname='Manish'
OR	Any true	salary < 20000 OR salary=42000
NOT	Negate	NOT salary=42000
⚙️ Bonus — WHERE + ORDER + LIMIT
SELECT * FROM aspirants
WHERE salary >= 30000
ORDER BY salary DESC
LIMIT 3;


✅ Shows top 3 aspirants with salary ≥ 30000.

Would you like me to create a "WHERE Clause Master Sheet (PDF + Examples + Syntax + Outputs)" 
that you can print or keep as a quick SQL reference? It’ll 
include comparisons, logical operators, subquery examples,
 and practical outputs from your table.






 🧩 Definition — What is an Alias?

An alias is a temporary name you assign to a table or a column for readability or convenience.
It exists only for the duration of that query — not permanently in the database.

🔹 Syntax:
SELECT column_name AS alias_name
FROM table_name AS alias_name;


You can also omit the keyword AS (it’s optional):

SELECT column_name alias_name FROM table_name alias_name;

🧾 Your Table Reference
+-----+-------------+------------------+------------+--------+
| sid | sname       | email            | phone      | salary |
+-----+-------------+------------------+------------+--------+
|   1 | Rohan Yadav | rohan@gmail.com  | 1122233344 | 412000 |
|   2 | Manish      | manish@gmail.com | 222132432  |  42000 |
|   3 | Paritosh    | pari@gmail.com   | 322233344  |  12000 |
|   4 | Neeraj      | neeraj@gmail.com | 142132432  |  32000 |
|   5 | Maynak      | mayank@gmail.com | 2378736589 |  42000 |
+-----+-------------+------------------+------------+--------+

🎯 1️⃣ Column Alias (Renaming output columns)

Rename columns in the output to make them more readable.

SELECT sname AS 'Aspirant Name', salary AS 'Monthly Salary'
FROM aspirants;


✅ Output:

Aspirant Name	Monthly Salary
Rohan Yadav	412000
Manish	42000
Paritosh	12000
Neeraj	32000
Maynak	42000
🧩 Example with Expression
SELECT sname AS Name, salary*12 AS 'Annual Salary'
FROM aspirants;


✅ Calculates annual salary and labels the column clearly.

💡 Without using AS
SELECT sname 'Name', salary 'Monthly Salary' FROM aspirants;


👉 Same result — AS is optional.

🏷 2️⃣ Table Alias

Gives a short name to the table (very useful when writing long queries or joins).

Example:
SELECT a.sname, a.salary
FROM aspirants AS a;


Or simply:

SELECT a.sname, a.salary FROM aspirants a;


✅ Here a is a temporary alias for aspirants.

🧮 3️⃣ Table Alias in Subqueries
Example — Find aspirants who earn more than the average salary:
SELECT sname, salary
FROM aspirants AS a
WHERE a.salary > (SELECT AVG(b.salary) FROM aspirants AS b);


✅ We used a and b as aliases for the same table to make the subquery readable.

🔗 4️⃣ Table Alias in JOINs (Most Common Use)

Let’s say you have another table:

CREATE TABLE departments (
  dept_id INT,
  dept_name VARCHAR(20)
);


And you join them:

SELECT a.sname, d.dept_name
FROM aspirants AS a
JOIN departments AS d
ON a.sid = d.dept_id;


✅ Now a and d act as short names for aspirants and departments.

📊 5️⃣ Alias with Aggregate Functions
SELECT MAX(salary) AS 'Highest Salary',
       MIN(salary) AS 'Lowest Salary',
       AVG(salary) AS 'Average Salary'
FROM aspirants;


✅ Gives neat, readable column headings.




✅ Quick Summary
Type	Syntax	Example	Purpose
Column Alias	SELECT column AS alias	salary AS "Monthly Salary"	Rename column in output
Table Alias	FROM table AS alias	FROM aspirants AS a	Short name for table
Without AS	SELECT column alias	SELECT sname name	Optional syntax
In Subquery	FROM aspirants a WHERE salary > (SELECT AVG(b.salary) FROM aspirants b)	Clarifies subquery scope	
In Join	FROM aspirants a JOIN departments d ON a.sid=d.dept_id	Readable joins	
💡 Bonus Trick: Combine Alias + Expression + ORDER BY
SELECT sname AS Name, salary*12 AS Annual
FROM aspirants
ORDER BY Annual DESC;


✅ Calculates annual salary, gives alias, and sorts by it.