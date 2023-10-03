

SELECT *
FROM owners
FULL JOIN vehicles
ON (owners.id = vehicles.owner_id);


SELECT first_name, COUNT(vehicles.owner_id) -- can use * in COUNT()
FROM owners
JOIN vehicles ON (owners.id = vehicles.owner_id) -- no parens needed
GROUP BY owners.id
ORDER BY first_name;


SELECT first_name, ROUND(AVG(vehicles.price)), COUNT(vehicles.owner_id)
FROM owners
JOIN vehicles ON (owners.id = vehicles.owner_id)
GROUP BY owners.id
HAVING ROUND(AVG(vehicles.price)) > 10000 AND COUNT(vehicles.owner_id) > 1
ORDER BY first_name DESC;