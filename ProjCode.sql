# Please run this code as it is according to headings to get successfull output.
# Creation code:

CREATE TABLE products (
product_id DECIMAL(10) NOT NULL,
category_name VARCHAR(30) NOT NULL,
prod_name VARCHAR(30) NOT NULL,
prod_descript VARCHAR(30),
price DECIMAL(10) NOT NULL,
quantity DECIMAL(10) NOT NULL,
PRIMARY KEY (product_id),
FOREIGN KEY (category_name) REFERENCES PROD_CATEGORY);

CREATE TABLE person (
person_id DECIMAL(10) NOT NULL,
username VARCHAR(30) NOT NULL,
phone VARCHAR(30)NOT NULL,
email VARCHAR(30),
address VARCHAR(30),
PRIMARY KEY (person_id));

CREATE TABLE seller (
person_id DECIMAL(10) NOT NULL,
brand_name VARCHAR(30),
rating DECIMAL(10),
PRIMARY KEY (person_id),
FOREIGN KEY (person_id) REFERENCES person);


CREATE TABLE buyer (
person_id DECIMAL(10) NOT NULL,
subscription VARCHAR(30),
PRIMARY KEY (person_id),
FOREIGN KEY (person_id) REFERENCES person);

CREATE TABLE inventory (
person_id DECIMAL(10) NOT NULL,
product_id DECIMAL(10) NOT NULL,
product_count DECIMAL(10),
FOREIGN KEY (product_id) REFERENCES products);
ALTER TABLE BUYER
ADD FOREIGN KEY (person_id) REFERENCES seller(person_id);




CREATE TABLE prod_category (
category_name VARCHAR(30)NOT NULL,
categ_descript VARCHAR(30),
PRIMARY KEY (category_name));

CREATE TABLE orders (
order_id DECIMAL(10) NOT NULL,
person_id DECIMAL(10) NOT NULL,
shipping_id DECIMAL(10) NOT NULL,
order_status VARCHAR(30),
PRIMARY KEY (order_id),
FOREIGN KEY (shipping_id) REFERENCES shipping(SHIPPING_ID));
ALTER TABLE orders
ADD FOREIGN KEY (person_id) REFERENCES buyer(person_id);


CREATE TABLE returns (
return_id DECIMAL(10) NOT NULL,
person_id DECIMAL(10) NOT NULL,
product_id DECIMAL(10) NOT NULL,
reason VARCHAR(30),
status VARCHAR(30),
PRIMARY KEY (return_id),
FOREIGN KEY (product_id) REFERENCES products);
ALTER TABLE returns
ADD FOREIGN KEY (person_id) REFERENCES buyer(person_id);

CREATE TABLE customer_service (
service_id DECIMAL(10) NOT NULL,
person_id DECIMAL(10) NOT NULL,
serv_type VARCHAR(30),
discript VARCHAR(200)NOT NULL,
status VARCHAR(30),
PRIMARY KEY (service_id),
FOREIGN KEY (person_id) REFERENCES buyer);

CREATE TABLE SHIPPING (
shipping_id DECIMAL(10) NOT NULL,
status VARCHAR(30)NOT NULL,
service_provider VARCHAR(30),
PRIMARY KEY (shipping_id));

CREATE TABLE orders_list (
order_id DECIMAL(10) NOT NULL,
product_id DECIMAL(10) NOT NULL,
quantity DECIMAL(10),
FOREIGN KEY (order_id) REFERENCES orders(order_id));
ALTER TABLE orders_list
ADD FOREIGN KEY (order_id) REFERENCES products(product_id);

# Stored procedures creation:

create or replace PROCEDURE ADD_CATEGORY(
CATEGORY_NAME_arg IN VARCHAR,
categ_descript_arg IN VARCHAR)
IS
BEGIN
INSERT INTO prod_category
(category_name,categ_descript)
VALUES(CATEGORY_NAME_arg,categ_descript_arg);
END;


create or replace PROCEDURE ADD_PRODUCTS(
product_id_ARG IN DECIMAL,
category_name_arg IN VARCHAR,
prod_name_arg IN VARCHAR,
prod_descript_ARG IN VARCHAR,
price_ARG IN DECIMAL)
IS
BEGIN
INSERT INTO products
(product_id,category_name,prod_name,prod_descript,price)
VALUES(product_id_ARG,category_name_arg,prod_name_arg,prod_descript_ARG, price_ARG);
END;


create or replace PROCEDURE ADD_person(
person_id_arg IN decimal,
firstname_arg IN VARCHAR,
lastname_arg IN VARCHAR,
phone_arg in varchar,
email_arg in varchar,
address_arg in varchar)
IS
BEGIN
INSERT INTO person
(person_id,firstname,lastname,phone,email,address)
VALUES(person_id_arg,firstname_arg,lastname_arg,phone_arg,email_arg,address_arg);
END;

create or replace PROCEDURE ADD_seller(
person_id_arg IN decimal,
brand_name_arg IN VARCHAR,
rating_arg in decimal)
IS
BEGIN
INSERT INTO seller
(person_id,brand_name,rating)
VALUES(person_id_arg,brand_name_arg,rating_arg);
END;

create or replace PROCEDURE ADD_inventory(
person_id_ARG IN DECIMAL,
product_id_arg IN decimal,
product_count_arg IN decimal)
IS
BEGIN
INSERT INTO inventory
(person_id ,product_id ,product_count)
VALUES(person_id_ARG,product_id_arg,product_count_arg);
END;




create or replace PROCEDURE update_inventory(
person_id_arg IN decimal,
product_id_arg IN decimal,
product_inc_arg IN decimal)
IS
BEGIN
update inventory
set product_count = product_count+product_inc_arg where (person_id = person_id_arg and product_id = product_id_arg);
END;

create or replace PROCEDURE ADD_buyer(
person_id_arg DECIMAL,
subscription_arg VARCHAR)
IS
BEGIN
INSERT INTO buyer
(person_id,subscription)
VALUES(person_id_arg,subscription_arg);
END;

create or replace PROCEDURE ADD_orders(
order_id_arg DECIMAL,
person_id_arg DECIMAL,
shipping_id_arg DECIMAL,
order_status_arg VARCHAR)
IS
BEGIN
INSERT INTO orders
(order_id,person_id,shipping_id,order_status)
VALUES(order_id_arg ,person_id_arg ,shipping_id_arg ,order_status_arg);
END;

create or replace PROCEDURE ADD_returns(
return_id_arg DECIMAL,
person_id_arg DECIMAL,
product_id_arg DECIMAL,
reason_arg VARCHAR,
status_arg VARCHAR)
IS
BEGIN
INSERT INTO returns
(return_id,person_id,product_id,reason,status)
VALUES(return_id_arg ,person_id_arg ,product_id_arg ,reason_arg ,status_arg );
END;

create or replace PROCEDURE ADD_customer_service(
service_id_arg DECIMAL,
person_id_arg DECIMAL,
serv_type_arg VARCHAR,
discript_arg VARCHAR,
status_arg VARCHAR)
IS
BEGIN
INSERT INTO customer_service
(service_id,person_id ,serv_type ,discript ,status )
VALUES(service_id_arg,person_id_arg,serv_type_arg,discript_arg,status_arg);
END;

create or replace PROCEDURE ADD_SHIPPING(
shipping_id_arg DECIMAL,
status_arg VARCHAR,
service_provider_arg VARCHAR)
IS
BEGIN
INSERT INTO shipping
(shipping_id,status,service_provider)
VALUES(shipping_id_arg,status_arg,service_provider_arg);
END;

create or replace PROCEDURE ADD_orders_list(
order_id_arg DECIMAL,
product_id_arg DECIMAL,
quantity_arg decimal)
IS
BEGIN
INSERT INTO orders_list
(order_id,product_id,quantity)
VALUES(order_id_arg,product_id_arg,quantity_arg);
END;

create or replace PROCEDURE update_orders(
order_id_arg decimal,
order_status_arg VARCHAR)
IS
BEGIN
update orders
set order_status = order_status_arg where (order_id = order_id_arg);
END;


create or replace PROCEDURE update_returns(
return_id_arg decimal,
status_arg VARCHAR)
IS
BEGIN
update returns
set status = status_arg where (return_id = return_id_arg);
END;


create or replace PROCEDURE update_customer_service(
service_id_arg decimal,
status_arg VARCHAR)
IS
BEGIN
update customer_service
set status = status_arg where (service_id = service_id_arg);
END;


create or replace PROCEDURE update_shipping(
shipping_id_arg decimal,
status_arg VARCHAR)
IS
BEGIN
update shipping
set status = status_arg where (shipping_id = shipping_id_arg);
END;



# Insert:

BEGIN
ADD_CATEGORY('Electronics', 'related to electronics');
END;
/
BEGIN
ADD_CATEGORY('Computers', 'gadgets related to computers');
END;
/
BEGIN
ADD_CATEGORY('Furniture', 'related to comfort');
END;
/
BEGIN
ADD_PRODUCTS(1,'Computers', 'acer','nitro 5',600);
END;
/
BEGIN
ADD_PRODUCTS(2,'Electronics', 'mouse','gaming mouse',20);
END;
/
BEGIN
ADD_PRODUCTS(3,'Electronics', 'cable','ethernet cable',15);
END;
/
BEGIN
ADD_PRODUCTS(4,'Electronics', 'cpu','with high end processor',500);
END;
/
BEGIN
ADD_PRODUCTS(5,'Computers', 'hp','2gb ram',20);
END;
/
BEGIN
ADD_PRODUCTS(6,'Furniture', 'table','glossy finish',25);
END;
/
BEGIN
ADD_PRODUCTS(7,'Furniture', 'closet','mobile closet',30);
END;
/
BEGIN
ADD_PRODUCTS(9,'Computers', 'holographic keyboard','tracks virtual key presses',30);
END;
/
BEGIN
ADD_PRODUCTS(8,'Electronics', 'self driving video camera','follows a subject',180);
END;
/
BEGIN
ADD_inventory(1,9,7);
END;
/
BEGIN
ADD_inventory(2,5,6);
END;
/
BEGIN
ADD_inventory(1,8,5);
END;
/
BEGIN
ADD_seller(1,jay,5);
END;
/
BEGIN
ADD_seller(2,PW,5);
END;
/
BEGIN
ADD_seller(3,RJ,4);
END;
/
BEGIN
ADD_person(1,'7749945628','jkadiveti@clarku.edu','600 main st','Jay','Kadiveti');
END;
/
BEGIN
ADD_person(2,'7749945426','PWyner@clarku.edu','600 main st','Peter','Wyner');
END;
/
BEGIN
ADD_person(3,'7749945326','RJulia@clarku.edu','600 main st','Julia','Roberts');
END;
/
BEGIN
ADD_person(4,'7749946326','RAlex@clarku.edu','340 main st','Alex','Roberts');
END;
/
BEGIN
ADD_person(5,'7749946316','RKatie@clarku.edu','345 main st','Katie','Roberts');
END;
/
BEGIN
ADD_person(6,'7749946315','Rjhon@clarku.edu','15 main st','jhon','Roberts');
END;
/
BEGIN
ADD_person(7,'7749946338','jmaverick@clarku.edu','10 main st','maverick','j');
END;
/
BEGIN
ADD_person(8,'7749946356','ctom@clarku.edu','36 main st','tom','cruise');
END;
/
BEGIN
ADD_person(9,'7749946389','mtobey@clarku.edu','79 gem st','tobey','maguire');
END;
/
BEGIN
ADD_person(10,'7749946320','jdwayne@clarku.edu','10 gem st','dwayne','johnson');
END;
/
BEGIN
ADD_buyer(1, 'prime');
END;
/
BEGIN
ADD_buyer(2, 'prime');
END;
/
BEGIN
ADD_buyer(3, 'prime');
END;
/
BEGIN
ADD_buyer(4,'');
END;
/
BEGIN
ADD_buyer(5,'');
END;
/
BEGIN
ADD_buyer(6,'');
END;
/
BEGIN
ADD_buyer(7, 'prime');
END;
/
BEGIN
ADD_buyer(8, 'prime');
END;
/
BEGIN
ADD_buyer(9, '');
END;
/
BEGIN
ADD_buyer(10, 'prime');
END;
/
BEGIN
ADD_customer_service(1,2,'missing items','mouse pad missing in package delivered','waiting for approval');
END;
/
BEGIN
ADD_returns(1,1,5,'poor performance','approved');
END;
/
begin
add_shipping(0,'not shipped','');
end;
/
begin
add_shipping(1,'shipping confirmed','DHL');
end;
/
begin
add_shipping(2,'shipping confirmed','UPS');
end;
/
begin
add_shipping(3,'in process','DHL');
end;
/
begin
add_orders(1,1,0,'order confirmed');
end;
/
begin
add_orders(2,4,2,'shipped');
end;
/
begin
add_orders(3,2,0,'order confirmed');
end;
/
begin
add_orders(4,6,3,'shipping');
end;
/
begin
add_orders(5,3,2,'shipping');
end;
/
begin
add_orders(6,5,3,'shipping');
end;
/
begin
add_orders(7,10,0,'order confirmed');
end;
/
begin
add_orders(8,7,0,'order confirmed');
end;
/
begin
add_orders(9,9,1,'shipping');
end;
/
begin
add_orders(10,8,2,'shipping');
end;
/
begin
add_orders_list(1,8,1);
end;
/
begin
add_orders_list(2,2,1);
end;
/
begin
add_orders_list(2,5,2);
end;
/
begin
add_orders_list(2,1,5);
end;
/
begin
add_orders_list(3,9,3);
end;
/
begin
add_orders_list(4,9,1);
end;
/
begin
add_orders_list(5,2,1);
end;
/
begin
add_orders_list(5,9,2);
end;
/
begin
add_orders_list(6,2,1);
end;
/
begin
add_orders_list(6,8,2);
end;
/
begin
add_orders_list(7,3,1);
end;
/
begin
add_orders_list(8,4,3);
end;
/
begin
add_orders_list(8,6,1);
end;
/
begin
add_orders_list(9,5,7);
end;
/
begin
add_orders_list(10,7,1);
end;
/

# Aspects:
# 1.
SELECT * FROM PRODUCTS
WHERE PRICE < 30 AND (CATEGORY_NAME='Computers' or
CATEGORY_NAME='Electronics');
# 2.
SELECT prod_name FROM products
join inventory on products.product_id = inventory.product_id and inventory.product_count <= 11;
# 3.
SELECT LASTNAME, COUNT(*) FROM PERSON
GROUP BY LASTNAME
HAVING COUNT(*) >3
# 4.
select orders.person_id,person.firstname, person.lastname, person.address
from orders
INNER JOIN person ON orders.person_id = person.person_id
where order_id in (select order_id from orders_list
where product_id IN (SELECT product_id FROM orders_list
GROUP BY product_id
HAVING COUNT(*) >= 3));

# 5.To manage shipping speed, Amazon requests all shipping information of orders placed by prime membership users.
select shipping_id,status, service_provider from shipping
where shipping_id in (
select shipping_id from orders
where person_id in (
select person_id from buyer
where subscription = 'prime'));






