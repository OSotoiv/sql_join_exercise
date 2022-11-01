-- write your queries here

    -- Join the two tables so that every column and record appears, regardless of if there is not an owner_id
SELECT * FROM owners FULL JOIN vehicles ON vehicles.owner_id = owners.id;
    -- Count the number of cars for each owner. Display the owners first_name, last_name and count of vehicles.
SELECT first_name, last_name, COUNT(vehicles.id) FROM owners JOIN vehicles ON vehicles.owner_id=owners.id GROUP BY owners.id;
    -- Count the number of cars for each owner and display the average price for each of the cars as integers.
SELECT first_name, last_name, ROUND(SUM(price)/COUNT(vehicles.id)) as average_price, COUNT(vehicles.id)
FROM owners JOIN vehicles ON vehicles.owner_id=owners.id 
GROUP BY owners.id 
HAVING COUNT(vehicles.id) > 1 
AND ROUND(SUM(price)/COUNT(vehicles.id)) > 10000 ORDER BY first_name DESC;