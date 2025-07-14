BEGIN ADD_CATEGORY('Electronics', 'related to electronics'); END; /
BEGIN ADD_CATEGORY('Computers', 'gadgets related to computers'); END; /
BEGIN ADD_CATEGORY('Furniture', 'related to comfort'); END; /

BEGIN ADD_PRODUCTS(1,'Computers', 'acer','nitro 5',600); END; /
BEGIN ADD_PRODUCTS(2,'Electronics', 'mouse','gaming mouse',20); END; /
BEGIN ADD_PRODUCTS(3,'Electronics', 'cable','ethernet cable',15); END; /
BEGIN ADD_PRODUCTS(4,'Electronics', 'cpu','with high end processor',500); END; /
BEGIN ADD_PRODUCTS(5,'Computers', 'hp','2gb ram',20); END; /

BEGIN ADD_person(1,'Jay','Kadiveti','7749945628','jkadiveti@clarku.edu','600 main st'); END; /
BEGIN ADD_person(2,'Peter','Wyner','7749945426','PWyner@clarku.edu','600 main st'); END; /

BEGIN ADD_seller(1,'Jay',5); END; /
BEGIN ADD_seller(2,'PW',5); END; /

BEGIN ADD_inventory(1,1,10); END; /
BEGIN ADD_inventory(2,2,5); END; /

BEGIN ADD_buyer(1, 'prime'); END; /
BEGIN ADD_buyer(2, ''); END; /

BEGIN ADD_shipping(1, 'shipping confirmed', 'DHL'); END; /
BEGIN ADD_orders(1, 1, 1, 'confirmed'); END; /
BEGIN ADD_orders_list(1, 1, 2); END; /

BEGIN ADD_returns(1, 1, 1, 'defective', 'approved'); END; /
BEGIN ADD_customer_service(1, 1, 'complaint', 'keyboard missing', 'open'); END; /

BEGIN ADD_CATEGORY('Electronics', 'related to electronics'); END; /
BEGIN ADD_CATEGORY('Computers', 'gadgets related to computers'); END; /
BEGIN ADD_CATEGORY('Furniture', 'related to comfort'); END; /

BEGIN ADD_PRODUCTS(1,'Computers', 'acer','nitro 5',600); END; /
BEGIN ADD_PRODUCTS(2,'Electronics', 'mouse','gaming mouse',20); END; /
BEGIN ADD_PRODUCTS(3,'Electronics', 'cable','ethernet cable',15); END; /
BEGIN ADD_PRODUCTS(4,'Electronics', 'cpu','with high end processor',500); END; /
BEGIN ADD_PRODUCTS(5,'Computers', 'hp','2gb ram',20); END; /
BEGIN ADD_PRODUCTS(6,'Furniture', 'table','glossy finish',25); END; /
BEGIN ADD_PRODUCTS(7,'Furniture', 'closet','mobile closet',30); END; /
BEGIN ADD_PRODUCTS(8,'Electronics', 'self driving video camera','follows a subject',180); END; /
BEGIN ADD_PRODUCTS(9,'Computers', 'holographic keyboard','tracks virtual key presses',30); END; /

BEGIN ADD_person(1,'Jay','Kadiveti','7749945628','jkadiveti@clarku.edu','600 main st'); END; /
BEGIN ADD_person(2,'Peter','Wyner','7749945426','PWyner@clarku.edu','600 main st'); END; /
BEGIN ADD_person(3,'Julia','Roberts','7749945326','RJulia@clarku.edu','600 main st'); END; /
BEGIN ADD_person(4,'Alex','Roberts','7749946326','RAlex@clarku.edu','340 main st'); END; /
BEGIN ADD_person(5,'Katie','Roberts','7749946316','RKatie@clarku.edu','345 main st'); END; /
BEGIN ADD_person(6,'John','Roberts','7749946315','Rjhon@clarku.edu','15 main st'); END; /
BEGIN ADD_person(7,'Maverick','J','7749946338','jmaverick@clarku.edu','10 main st'); END; /
BEGIN ADD_person(8,'Tom','Cruise','7749946356','ctom@clarku.edu','36 main st'); END; /
BEGIN ADD_person(9,'Tobey','Maguire','7749946389','mtobey@clarku.edu','79 gem st'); END; /
BEGIN ADD_person(10,'Dwayne','Johnson','7749946320','jdwayne@clarku.edu','10 gem st'); END; /

BEGIN ADD_seller(1,'Jay',5); END; /
BEGIN ADD_seller(2,'PW',5); END; /
BEGIN ADD_seller(3,'RJ',4); END; /

BEGIN ADD_inventory(1,9,7); END; /
BEGIN ADD_inventory(2,5,6); END; /
BEGIN ADD_inventory(1,8,5); END; /

BEGIN ADD_buyer(1, 'prime'); END; /
BEGIN ADD_buyer(2, 'prime'); END; /
BEGIN ADD_buyer(3, 'prime'); END; /
BEGIN ADD_buyer(4, ''); END; /
BEGIN ADD_buyer(5, ''); END; /
BEGIN ADD_buyer(6, ''); END; /
BEGIN ADD_buyer(7, 'prime'); END; /
BEGIN ADD_buyer(8, 'prime'); END; /
BEGIN ADD_buyer(9, ''); END; /
BEGIN ADD_buyer(10, 'prime'); END; /

BEGIN ADD_customer_service(1,2,'missing items','mouse pad missing in package delivered','waiting for approval'); END; /
BEGIN ADD_returns(1,1,5,'poor performance','approved'); END; /

BEGIN ADD_shipping(0,'not shipped',''); END; /
BEGIN ADD_shipping(1,'shipping confirmed','DHL'); END; /
BEGIN ADD_shipping(2,'shipping confirmed','UPS'); END; /
BEGIN ADD_shipping(3,'in process','DHL'); END; /

BEGIN ADD_orders(1,1,0,'order confirmed'); END; /
BEGIN ADD_orders(2,4,2,'shipped'); END; /
BEGIN ADD_orders(3,2,0,'order confirmed'); END; /
BEGIN ADD_orders(4,6,3,'shipping'); END; /
BEGIN ADD_orders(5,3,2,'shipping'); END; /
BEGIN ADD_orders(6,5,3,'shipping'); END; /
BEGIN ADD_orders(7,10,0,'order confirmed'); END; /
BEGIN ADD_orders(8,7,0,'order confirmed'); END; /
BEGIN ADD_orders(9,9,1,'shipping'); END; /
BEGIN ADD_orders(10,8,2,'shipping'); END; /

BEGIN ADD_orders_list(1,8,1); END; /
BEGIN ADD_orders_list(2,2,1); END; /
BEGIN ADD_orders_list(2,5,2); END; /
BEGIN ADD_orders_list(2,1,5); END; /
BEGIN ADD_orders_list(3,9,3); END; /
BEGIN ADD_orders_list(4,9,1); END; /
BEGIN ADD_orders_list(5,2,1); END; /
BEGIN ADD_orders_list(5,9,2); END; /
BEGIN ADD_orders_list(6,2,1); END; /
BEGIN ADD_orders_list(6,8,2); END; /
BEGIN ADD_orders_list(7,3,1); END; /
BEGIN ADD_orders_list(8,4,3); END; /
BEGIN ADD_orders_list(8,6,1); END; /
BEGIN ADD_orders_list(9,5,7); END; /
BEGIN ADD_orders_list(10,7,1); END; /
