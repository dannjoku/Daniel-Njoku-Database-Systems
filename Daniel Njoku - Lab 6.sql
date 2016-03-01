-- Display the name and city of customers who live in any city that makes the most different kinds of products.--
-- There are two cities that make the	most different products. Return the name and city of customers from either one of those	--

SELECT C.name, C.city
FROM Customers as C
INNER JOIN Products as P
ON C.city = P.city
Group by C.name, c.city
Order by COUNT(*) ; 

-- Display the names of products \\\ whose priceUSD is strictly above the average priceUSD\\\ , in reverse-alphabetical order.

SELECT name
FROM Products
WHERE priceUSD > (SELECT AVG(priceUSD) From Products) ;
	
-- Display the customer name, pid ordered, and the total for all orders, \\\ sorted by total from high to low.	

SELECT c.name, o.pid, o.totalUSD
FROM Customers as c
INNER JOIN Orders as o
ON c.cid = o.cid 
ORDER BY o.totalUSD desc;

-- Display all customer names (in alphabetical order) and their total ordered, and nothing more. Use coalesce to avoid showing NULLs.

SELECT name, coalesce(sum(qty),0) as total_ordered
FROM Customers c 
LEFT OUTER JOIN orders o on c.cid = o.cid
GROUP BY name, city
ORDER BY name ;

-- Display the names of all customers who bought products from agents based in Tokyo 
-- along with the names of the products they ordered, and the names of the agents who sold it to them.	

SELECT C.name, P.name, A.name
FROM Customers as C, Products as P, Agents as A
WHERE (cid, pid, aid) in 
	(SELECT cid, pid, aid
        FROM orders
        WHERE aid in 
		(SELECT aid
		 FROM agents
                 WHERE city = 'Tokyo')) ;

-- Write	a query to check the accuracy of the dollars column in the Orders table. 
-- This means calculating Orders.totalUSD from data in other tables and comparing those	
-- values to the values in Orders.totalUSD. Display all rows in Orders where Orders.totalUSD is incorrect, if any.	

SELECT O.totalUSD, O.qty, P.priceUSD, C.discount, (O.qty * P.priceUSD * (1 - (C.discount/100))) AS accurate_dollars
FROM Orders AS O 
INNER JOIN Customers AS C on O.cid = C.cid
INNER JOIN Products AS P on O.pid = P.pid 
AND O.totalUSD <> (O.qty * P.priceUSD * (1 - (C.discount/100))) ;



      
-- Left out join and right outer join both play very similar roles when creating 
-- queries while navagating through a database. Right outer join returns all rows -
-- from the right of the table matched with rows on the left. This same situation is 
-- true when left outer join table is used, but the results would be the reverse of the right outer join. 
-- A right outer join query can be made while using the CAP3 Database as shown below: 

SELECT A.aid, O.ordnum
FROM Agents AS A 
LEFT OUTER JOIN Orders as O
ON O.aid = a.aid ; 

-- A left outer join query can be made while using the CAP3 Database as shown below:

SELECT A.aid, O.ordnum
FROM Agents AS A 
RIGHT OUTER JOIN Orders as O
ON O.aid = a.aid ; 