CREATE OR REPLACE PROCEDURE ADD_CATEGORY(
  CATEGORY_NAME_arg IN VARCHAR2,
  categ_descript_arg IN VARCHAR2
) IS
BEGIN
  INSERT INTO product_category(category, category_description)
  VALUES(CATEGORY_NAME_arg, categ_descript_arg);
END;
/

CREATE OR REPLACE PROCEDURE ADD_PRODUCTS(
  product_id_ARG IN NUMBER,
  category_name_arg IN VARCHAR2,
  prod_name_arg IN VARCHAR2,
  prod_descript_ARG IN VARCHAR2,
  price_ARG IN NUMBER
) IS
BEGIN
  INSERT INTO product(product_id, category, product_name, product_description, product_price)
  VALUES(product_id_ARG, category_name_arg, prod_name_arg, prod_descript_ARG, price_ARG);
END;
/

CREATE OR REPLACE PROCEDURE ADD_person(
  person_id_arg IN NUMBER,
  firstname_arg IN VARCHAR2,
  lastname_arg IN VARCHAR2,
  phone_arg IN VARCHAR2,
  email_arg IN VARCHAR2,
  address_arg IN VARCHAR2
) IS
BEGIN
  INSERT INTO person(person_id, first_name, last_name, phone, mail, address)
  VALUES(person_id_arg, firstname_arg, lastname_arg, phone_arg, email_arg, address_arg);
END;
/

CREATE OR REPLACE PROCEDURE ADD_seller(
  person_id_arg IN NUMBER,
  brand_name_arg IN VARCHAR2,
  rating_arg IN NUMBER
) IS
BEGIN
  INSERT INTO seller(person_id, brand_name, rating)
  VALUES(person_id_arg, brand_name_arg, rating_arg);
END;
/

CREATE OR REPLACE PROCEDURE ADD_inventory(
  person_id_ARG IN NUMBER,
  product_id_arg IN NUMBER,
  product_count_arg IN NUMBER
) IS
BEGIN
  INSERT INTO inventory(person_id, product_id, product_count)
  VALUES(person_id_ARG, product_id_arg, product_count_arg);
END;
/

CREATE OR REPLACE PROCEDURE ADD_buyer(
  person_id_arg IN NUMBER,
  subscription_arg IN VARCHAR2
) IS
BEGIN
  INSERT INTO buyer(person_id, subscription)
  VALUES(person_id_arg, subscription_arg);
END;
/

CREATE OR REPLACE PROCEDURE ADD_shipping(
  shipping_id_arg IN NUMBER,
  status_arg IN VARCHAR2,
  service_provider_arg IN VARCHAR2
) IS
BEGIN
  INSERT INTO shipping(shipping_id, shipping_status, service_provider)
  VALUES(shipping_id_arg, status_arg, service_provider_arg);
END;
/

CREATE OR REPLACE PROCEDURE ADD_orders(
  order_id_arg IN NUMBER,
  person_id_arg IN NUMBER,
  shipping_id_arg IN NUMBER,
  order_status_arg IN VARCHAR2
) IS
BEGIN
  INSERT INTO order_list(order_id, person_id, shipping_id, order_status)
  VALUES(order_id_arg, person_id_arg, shipping_id_arg, order_status_arg);
END;
/

CREATE OR REPLACE PROCEDURE ADD_orders_list(
  order_id_arg IN NUMBER,
  product_id_arg IN NUMBER,
  quantity_arg IN NUMBER
) IS
BEGIN
  INSERT INTO customer_order(order_id, product_id, quantity)
  VALUES(order_id_arg, product_id_arg, quantity_arg);
END;
/

CREATE OR REPLACE PROCEDURE ADD_returns(
  return_id_arg IN NUMBER,
  person_id_arg IN NUMBER,
  product_id_arg IN NUMBER,
  reason_arg IN VARCHAR2,
  status_arg IN VARCHAR2
) IS
BEGIN
  INSERT INTO customer_return(return_id, person_id, product_id, reason, return_status)
  VALUES(return_id_arg, person_id_arg, product_id_arg, reason_arg, status_arg);
END;
/

CREATE OR REPLACE PROCEDURE ADD_customer_service(
  service_id_arg IN NUMBER,
  person_id_arg IN NUMBER,
  serv_type_arg IN VARCHAR2,
  discript_arg IN VARCHAR2,
  status_arg IN VARCHAR2
) IS
BEGIN
  INSERT INTO customer_service(service_id, person_id, type, service_description, service_status)
  VALUES(service_id_arg, person_id_arg, serv_type_arg, discript_arg, status_arg);
END;
/