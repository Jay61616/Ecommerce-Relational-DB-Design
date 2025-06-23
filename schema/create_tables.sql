-- Create product categories first because others depend on it
CREATE TABLE prod_category (
    category_name VARCHAR(30) NOT NULL,
    categ_descript VARCHAR(30),
    PRIMARY KEY (category_name)
);

CREATE TABLE products (
    product_id DECIMAL(10) NOT NULL,
    category_name VARCHAR(30) NOT NULL,
    prod_name VARCHAR(30) NOT NULL,
    prod_descript VARCHAR(30),
    price DECIMAL(10) NOT NULL,
    quantity DECIMAL(10) NOT NULL,
    PRIMARY KEY (product_id),
    FOREIGN KEY (category_name) REFERENCES prod_category
);

CREATE TABLE person (
    person_id DECIMAL(10) NOT NULL,
    username VARCHAR(30) NOT NULL,
    phone VARCHAR(30) NOT NULL,
    email VARCHAR(30),
    address VARCHAR(30),
    PRIMARY KEY (person_id)
);

CREATE TABLE seller (
    person_id DECIMAL(10) NOT NULL,
    brand_name VARCHAR(30),
    rating DECIMAL(10),
    PRIMARY KEY (person_id),
    FOREIGN KEY (person_id) REFERENCES person
);

CREATE TABLE buyer (
    person_id DECIMAL(10) NOT NULL,
    subscription VARCHAR(30),
    PRIMARY KEY (person_id),
    FOREIGN KEY (person_id) REFERENCES person
);

CREATE TABLE inventory (
    person_id DECIMAL(10) NOT NULL,
    product_id DECIMAL(10) NOT NULL,
    product_count DECIMAL(10),
    FOREIGN KEY (product_id) REFERENCES products
);

CREATE TABLE shipping (
    shipping_id DECIMAL(10) NOT NULL,
    status VARCHAR(30) NOT NULL,
    service_provider VARCHAR(30),
    PRIMARY KEY (shipping_id)
);

CREATE TABLE orders (
    order_id DECIMAL(10) NOT NULL,
    person_id DECIMAL(10) NOT NULL,
    shipping_id DECIMAL(10) NOT NULL,
    order_status VARCHAR(30),
    PRIMARY KEY (order_id),
    FOREIGN KEY (person_id) REFERENCES buyer,
    FOREIGN KEY (shipping_id) REFERENCES shipping
);

CREATE TABLE orders_list (
    order_id DECIMAL(10) NOT NULL,
    product_id DECIMAL(10) NOT NULL,
    quantity DECIMAL(10),
    FOREIGN KEY (order_id) REFERENCES orders,
    FOREIGN KEY (product_id) REFERENCES products
);

CREATE TABLE returns (
    return_id DECIMAL(10) NOT NULL,
    person_id DECIMAL(10) NOT NULL,
    product_id DECIMAL(10) NOT NULL,
    reason VARCHAR(30),
    status VARCHAR(30),
    PRIMARY KEY (return_id),
    FOREIGN KEY (person_id) REFERENCES buyer,
    FOREIGN KEY (product_id) REFERENCES products
);

CREATE TABLE customer_service (
    service_id DECIMAL(10) NOT NULL,
    person_id DECIMAL(10) NOT NULL,
    serv_type VARCHAR(30),
    discript VARCHAR(200) NOT NULL,
    status VARCHAR(30),
    PRIMARY KEY (service_id),
    FOREIGN KEY (person_id) REFERENCES buyer
);
