--Daniel Njoku--
--Lab 4 Queries--
--Database Systems--




--1. Cities of agents who have booked orders for a customer whos cid is 'c002'--

SELECT city
FROM Agents
WHERE aid IN
	(SELECT aid 
	FROM Orders 
	WHERE cid = 'c002') ;



--2. Get the ids of products ordered through any agent who takes	at least one order from a customer in Dallas, sorted by pid from highest to lowest.-- 
--(This is not the same as asking for ids of products ordered by customers in Dallas.)--

SELECT DISTINCT pid
FROM Orders
WHERE aid in 
	(SELECT aid 
	FROM Orders 
	Where cid IN 
		(SELECT cid
		FROM Customers
		WHERE city = 'Dallas' 
		) ) ORDER BY pid DESC ;
        
        
		
--3. Get the ids and names of customers /// who did not ||| place an order through agent a01.--

SELECT cid, name
FROM Customers
WHERE cid NOT IN
	(SELECT cid
	FROM Orders
	WHERE aid = 'a01') ;
    
    

--4. Get the ids of customers who	||| ordered both ||| product p01 and p07.--	

SELECT DISTINCT cid
FROM Orders
WHERE pid = 'p01' AND cid IN (SELECT cid
				FROM orders
				WHERE pid = 'p07') ;
                
                
                

--5. Get the ids of products not ordered /// by any customers ||| who placed any order through agent a07 in pid order from highest to lowest.--

SELECT pid
FROM Products
WHERE pid NOT IN (SELECT pid
                 FROM Orders
                 WHERE cid IN (SELECT cid
		          FROM Orders
		          WHERE aid <> 'a07')) 
				ORDER BY pid DESC ; 
                
                
                

--6. Get the name,	discounts, and city ||| for all customers who place orders through agents ||| in London or New York.--

SELECT name, discount, city
FROM Customers
Where cid IN
	(SELECT cid
	FROM Orders 
	Where aid IN
		(SELECT aid
		FROM Agents 
		WHERE city = 'Lomdon'
		Or city = 'New York')) ; 



--7. Get all customers who have the same discount	as that	of any customers in Dallas or London--

SELECT *
FROM Customers
WHERE discount IN
	(SELECT discount 
	FROM Customers
	WHERE city = 'London' 
	OR city = 'Dallas') ;
    
    
    
    
--Daniel Njoku 
Lab 4 Short Essay 

Check constraints are used in order to check the value that is entered into a database, in order to enforce domain integrity. Check constraints use Booleans to return values that can with be true or false, based on the parameters set by the logical operators. Allowing check constraints in records can prove to be beneficial primarily because they can sets limits to their appropriate fields. For example, some friends and I want to start decide to start our own social media website, and we intend implementing a minimum age requirement of thirteen for users who would like to register. Adding a check constraint in the database where the users sign up information will live is one way to do so. When creating the table, the age row will look something like:
 AGE 	INT		NOT NULL 	CHECK (AGE >= 13), 
Now, since there is a check restraint on the age row, and the field cannot be null, if the user does not meet the minimum age requirement their login information will not post. The user will then be alerted with a prompt that will notify them that they’re not of age. Another example of a check constraint can be if I needed to implement a new minimum wage requirement for an existing database. New Yorks Department of Labor decides to increase the minimum wage to ten dollars. To update the existing database and add a constraint I can do so by altering the table, as seen below.
ALTER 	TABLE	 EMPLOYEES 
MODIFY 	SALARY	 NOT NULL CHECK (WAGE >= 10.00);
An example of a bad check constraint would be if I decided to a constraint to a field that is allowed to be null. This essentially will defeat the value of the constraint because its purpose can be easily averted. --
  
	