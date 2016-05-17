-- 1. Get all customers and their addresses.
SELECT * FROM customers
  JOIN addresses ON  customers.id = addresses.customer_id

-- 2. Get all orders and their line items.
SELECT * FROM orders
  JOIN line_items ON orders.id = line_items.order_id
-- 3. Which warehouses have cheetos?
SELECT warehouse FROM products
  JOIN warehouse_product on products.id = warehouse_product.product_id
  JOIN warehouse ON warehouse_product.warehouse_id = warehouse.id
    WHERE products.id = 5
-- 4. Which warehouses have diet pepsi?
SELECT warehouse FROM products
  JOIN warehouse_product on products.id = warehouse_product.product_id
  JOIN warehouse ON warehouse_product.warehouse_id = warehouse.id
    WHERE products.id = 6
-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT customers.first_name, customers.last_name, COUNT(orders.id) FROM customers
  JOIN addresses ON customers.id = addresses.customer_id
  JOIN orders ON addresses.id = orders.address_id
  GROUP BY (customers.first_name, customers.last_name)
-- 6. How many customers do we have?
SELECT COUNT(customers.id) FROM customers
-- 7. How many products do we carry?
SELECT COUNT(products.id) FROM products
-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM(on_hand) AS Total FROM warehouse_product
JOIN products ON products.id = warehouse_product.product_id
WHERE products.id = '6';
