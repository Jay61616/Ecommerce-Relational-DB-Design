CREATE TABLE person (
  person_id NUMBER NOT NULL,
  first_name VARCHAR2(30) NOT NULL,
  last_name VARCHAR2(30) NOT NULL,
  phone VARCHAR2(20) NOT NULL,
  mail VARCHAR2(50),
  address VARCHAR2(250),
  PRIMARY KEY (person_id)
);

CREATE TABLE seller (
  person_id NUMBER NOT NULL,
  brand_name VARCHAR2(50),
  rating NUMBER,
  PRIMARY KEY (person_id),
  FOREIGN KEY (person_id) REFERENCES person
);

CREATE TABLE product_category(
  category VARCHAR2(20) NOT NULL,
  category_description VARCHAR2(300),
  PRIMARY KEY (category)
);

CREATE TABLE product(
  product_id NUMBER NOT NULL,
  category VARCHAR2(20) NOT NULL,
  product_name VARCHAR2(30) NOT NULL,
  product_description VARCHAR2(300),
  product_price NUMBER(10,2),
  PRIMARY KEY (product_id),
  FOREIGN KEY (category) REFERENCES product_category
);

CREATE TABLE inventory (
  person_id NUMBER NOT NULL,
  product_id NUMBER NOT NULL,
  product_count NUMBER,
  FOREIGN KEY (person_id) REFERENCES seller,
  FOREIGN KEY (product_id) REFERENCES product
);

CREATE TABLE buyer(
  person_id NUMBER NOT NULL,
  subscription VARCHAR2(30) NOT NULL,
  PRIMARY KEY (person_id),
  FOREIGN KEY (person_id) REFERENCES person
);

CREATE TABLE shipping(
  shipping_id NUMBER NOT NULL,
  shipping_status VARCHAR2(30) NOT NULL,
  service_provider VARCHAR2(60),
  PRIMARY KEY (shipping_id)
);

CREATE TABLE order_list(
  order_id NUMBER NOT NULL,
  person_id NUMBER NOT NULL,
  shipping_id NUMBER NOT NULL,
  order_status VARCHAR2(30),
  PRIMARY KEY (order_id),
  FOREIGN KEY (person_id) REFERENCES buyer,
  FOREIGN KEY (shipping_id) REFERENCES shipping
);

CREATE TABLE customer_order(
  order_id NUMBER NOT NULL,
  product_id NUMBER NOT NULL,
  quantity NUMBER,
  FOREIGN KEY (order_id) REFERENCES order_list,
  FOREIGN KEY (product_id) REFERENCES product
);

CREATE TABLE customer_return(
  return_id NUMBER NOT NULL,
  person_id NUMBER NOT NULL,
  product_id NUMBER NOT NULL,
  reason VARCHAR2(300),
  return_status VARCHAR2(30),
  PRIMARY KEY (return_id),
  FOREIGN KEY (person_id) REFERENCES buyer,
  FOREIGN KEY (product_id) REFERENCES product
);

CREATE TABLE customer_service(
  service_id NUMBER NOT NULL,
  person_id NUMBER NOT NULL,
  type VARCHAR2(30) NOT NULL,
  service_description VARCHAR2(300) NOT NULL,
  service_status VARCHAR2(30),
  PRIMARY KEY (service_id),
  FOREIGN KEY (person_id) REFERENCES buyer
);
