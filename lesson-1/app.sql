
CREATE TABLE IF NOT EXISTS products (
    product_id INTEGER PRIMARY KEY AUTOINCREMENT,
    product_name TEXT NOT NULL,
    product_price REAL NOT NULL
);


INSERT INTO products (product_name, product_price) VALUES
('Laptop', 1500),
('Mouse', 25),
('Keyboard', 75),
('Monitor', 300);

SELECT * FROM products();

INSERT INTO products (product_name, product_price) VALUES
('Laptop Lenovo Legion 5', 3000);


SELECT SUM(product_price) AS total_spent
FROM products;