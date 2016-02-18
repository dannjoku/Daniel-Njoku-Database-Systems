--Show	the cities of agents booking an order for a customer whose id is 'c002'. Use joins; no subqueries.--	

SELECT city
FROM Agents AS A
INNER JOIN Orders AS O
ON O.aid = A.aid
WHERE cid = 'c002' ;




--Show the ids	of products ordered through any agent	who makes at least one order for a customer in	Dallas,	
--sorted by pid	from highest to	lowest.	Use joins; no subqueries.--

SELECT DISTINCT pid
FROM Orders AS O
INNER JOIN Customers AS C
ON O.cid = C.cid
WHERE city = 'Dallas' 
ORDER BY pid desc; 




--Show	the names of customers	who have never	placed	an order. Use a subquery-- 

SELECT name
FROM Customers
WHERE cid NOT IN
	(SELECT cid
	FROM Orders ) ;


--Show	the names of customers	who have never	placed	an order. Use	an outer join--

SELECT name
FROM Customers AS C
FULL OUTER JOIN Orders AS O
ON C.cid = O.cid 
WHERE ordnum IS NULL ; 




--Show the names of customers	who placed at least one order through an agent	in their own city, along with those agents names.--

SELECT DISTINCT C.name, A.city
FROM Customers as C
Full outer join Orders as O
ON C.cid = O.cid
full outer join Agents as A
ON A.aid = O.aid
WHERE A.city = C.city ;




--Show	the names of customers	and agents living in the same city, along with	the name of the	shared	city, --
--regardless of whether or not the customer has ever placed an order with that agent.--

SELECT c.name, a.name, c.city
FROM Customers as c
INNER JOIN Agents as a
ON c.city = a.city ;




--Show	the name and city of customers ||| who live in the city ||| that makes the fewest different kinds of products.--
--(Hint: Use count and group by on the Products table.)--

SELECT c.name, c.city
FROM Customers as c
INNER JOIN Products as P
ON C.city = P.city 
GROUP BY C.name, c.city
order by COUNT(*);

