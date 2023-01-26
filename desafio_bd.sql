use fantasy_products;

-- Montos totales por condition customer
SELECT ROUND(SUM(s.quantity * p.price), 2) AS total
FROM sales s INNER JOIN invoices i ON s.invoice_id = i.id
INNER JOIN products p ON s.product_id = p.id
INNER JOIN customers c ON i.customer_id = c.id
WHERE c.condition = 'False'
ORDER BY total;

-- Top 5 de los products más vendidos y sus cantidades vendidas
SELECT products.id, products.description, SUM(sales.quantity) as sales_total
FROM products
INNER JOIN sales ON products.id = sales.product_id
GROUP BY products.id, products.description
ORDER BY sales_total DESC LIMIT 5;

-- El Top 5 de los customers activos que gastaron la mayor cantidad de dinero
SELECT concat(c.first_name, ' ', c.last_name) as clientName, s.product_id, s.invoice_id, s.quantity, i.customer_id, ROUND(SUM(s.quantity * p.price), 2) AS total
FROM sales s INNER JOIN invoices i ON s.invoice_id = i.id
INNER JOIN products p ON s.product_id = p.id
INNER JOIN customers c ON i.customer_id = c.id
WHERE c.condition = 'True'
GROUP BY s.product_id, s.invoice_id, s.quantity, i.customer_id, clientName ORDER BY total DESC limit 5;