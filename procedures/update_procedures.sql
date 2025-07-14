CREATE OR REPLACE PROCEDURE update_inventory(
  person_id_arg IN NUMBER,
  product_id_arg IN NUMBER,
  product_inc_arg IN NUMBER
) IS
BEGIN
  UPDATE inventory
  SET product_count = product_count + product_inc_arg
  WHERE person_id = person_id_arg AND product_id = product_id_arg;
END;
/

CREATE OR REPLACE PROCEDURE update_orders(
  order_id_arg IN NUMBER,
  order_status_arg IN VARCHAR2
) IS
BEGIN
  UPDATE order_list
  SET order_status = order_status_arg
  WHERE order_id = order_id_arg;
END;
/

CREATE OR REPLACE PROCEDURE update_returns(
  return_id_arg IN NUMBER,
  status_arg IN VARCHAR2
) IS
BEGIN
  UPDATE customer_return
  SET return_status = status_arg
  WHERE return_id = return_id_arg;
END;
/

CREATE OR REPLACE PROCEDURE update_customer_service(
  service_id_arg IN NUMBER,
  status_arg IN VARCHAR2
) IS
BEGIN
  UPDATE customer_service
  SET service_status = status_arg
  WHERE service_id = service_id_arg;
END;
/

CREATE OR REPLACE PROCEDURE update_shipping(
  shipping_id_arg IN NUMBER,
  status_arg IN VARCHAR2
) IS
BEGIN
  UPDATE shipping
  SET shipping_status = status_arg
  WHERE shipping_id = shipping_id_arg;
END;
/
