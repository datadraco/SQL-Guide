# SQL Glossary

Building out a file of notes covering beginner to advanced SQL techniques for future reference in preparation for data engineering projects + positions

---

## Query Clauses

`SELECT`: Leading line in a SQL query that identifies the columns that will end up in the result. Additional formatting can be performed at this stage such as aliasing, arithmetic, or aggregation. Unique results can be found through the use of DISTINCT.

`FROM`: Component of a query that identifies the source table(s) of the query. This is the stage that joining can be performed if there are multiple source tables, and formatting can be performed to shorten the syntax for the table names.

`WHERE`: The section of the query to apply wide ranging logical operations on the query to filter results and isolate the conditional data of interest.

`LIMIT`: Used to restrict the output to a set amount of rows.

`GROUP_BY`: Isolate particular groups for precise aggregation (can be multiple columns).

`ORDER_BY`: Organize the output by one or more columns. Can specify ordering logic (i.e. DESC).

## Logical Operators

`IS_NULL`: NULL values cannot be identified through arithmetic (i.e. == NULL) but rather this built in function to identify cells with this particular data type. This can vary depending on the format (i.e. mysql uses ISNULL() or "is null").

`AND`: Require two logical operations to be true.

`OR`: Allow for either of two logical operations to be true.

`LIKE`: Used for matching similar values typically with the '%___' syntax.

`NOT`: Usually used with the LIKE operation rather than comparisons (i.e. >, <, !=, etc.).

`IN`: Check if contained within a list of values.

`BETWEEN`: Checks within a range of values (numerical or alphabetical).

## Aggregate Functions

`COUNT`: Tallies the rows in a particular column.

`SUM`: Adds together the values within a column.

`MIN` / `MAX`: Returns the lowest / highest value within a given column.

`AVG`: Calculates the average of the values within a given column.

## Useful Functions

`LENGTH(string)`: Finds the number of characters in a given string including spaces.

`DATEDIFF(datepart, date1, date2)`: Performs date1 - date2 and gives the result in the form of the selected datepart (in mysql, there is no datepart argument and it calculates in days).

## Join Operations & Logic

SQL will default to `INNER JOIN` if the type of join is not specified in the query, meaning it will only produce the rows that live in the intersection of the new set created by the merged tables. 

## Quirks

**Non-Numeric Operations**: When using arithmetic to compare to a non-numeric value (such as a string), the value must be wrapped by single quotes. Particularly when evaluating greater / less, SQL will evaluate alphabetically and does not automatically identify the factor of something like a date value.

**Arithmetic in SELECT**: Basic arithmetic can be applied in the SELECT clause to apply operations across column values.