-- Aspect Query 1: Products under $30 in Computers or Electronics category
SELECT *
FROM product
WHERE product_price < 30
  AND category IN ('Computers', 'Electronics');

-- Aspect Query 2: Products with inventory count <= 11
SELECT p.product_name
FROM product p
JOIN inventory i ON p.product_id = i.product_id
WHERE i.product_count <= 11;

-- Aspect Query 3: Last names appearing more than 3 times
SELECT last_name, COUNT(*) AS name_count
FROM person
GROUP BY last_name
HAVING COUNT(*) > 3;

-- Aspect Query 4: Buyer info for orders that include products purchased 3+ times
SELECT DISTINCT o.person_id, p.first_name, p.last_name, p.address
FROM order_list o
JOIN person p ON o.person_id = p.person_id
WHERE o.order_id IN (
  SELECT co.order_id
  FROM customer_order co
  WHERE co.product_id IN (
    SELECT product_id
    FROM customer_order
    GROUP BY product_id
    HAVING COUNT(*) >= 3
  )
);

-- Aspect Query 5: Shipping details for Prime subscribers
SELECT s.shipping_id, s.shipping_status, s.service_provider
FROM shipping s
WHERE s.shipping_id IN (
  SELECT o.shipping_id
  FROM order_list o
  WHERE o.person_id IN (
    SELECT b.person_id
    FROM buyer b
    WHERE LOWER(b.subscription) = 'prime'
  )
);
