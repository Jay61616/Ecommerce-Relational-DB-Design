-- Aspect Query 1:
-- Question: Retrieve all products under $30 in either the 'Computers' or 'Electronics' category.
SELECT * FROM products
WHERE price < 30 AND (category_name = 'Computers' OR category_name = 'Electronics');

-- Aspect Query 2:
-- Question: List the names of products whose inventory count is 11 or less.
SELECT prod_name FROM products
JOIN inventory ON products.product_id = inventory.product_id
WHERE inventory.product_count <= 11;

-- Aspect Query 3:
-- Question: Find all last names that appear more than 3 times in the person table.
SELECT lastname, COUNT(*) FROM person
GROUP BY lastname
HAVING COUNT(*) > 3;

-- Aspect Query 4:
-- Question: Retrieve buyer information for orders that include products purchased three or more times.
SELECT orders.person_id, person.firstname, person.lastname, person.address
FROM orders
INNER JOIN person ON orders.person_id = person.person_id
WHERE order_id IN (
    SELECT order_id FROM orders_list
    WHERE product_id IN (
        SELECT product_id FROM orders_list
        GROUP BY product_id
        HAVING COUNT(*) >= 3
    )
);

-- Aspect Query 5:
-- Question: Get shipping details for orders placed by customers with a Prime subscription.
SELECT shipping_id, status, service_provider FROM shipping
WHERE shipping_id IN (
    SELECT shipping_id FROM orders
    WHERE person_id IN (
        SELECT person_id FROM buyer
        WHERE subscription = 'prime'
    )
);
