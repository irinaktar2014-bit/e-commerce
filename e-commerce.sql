SELECT * FROM olist_customers_dataset LIMIT 5;
SELECT * FROM olist_order_dataset LIMIT 5;
SELECT * FROM olist_order_items_dataset LIMIT 5;
SELECT * FROM olist_products_dataset LIMIT 5;

SELECT c.cuastomer_unique_id,
	   COUNT(o.order_id) AS total_orders
FROM olist_customers_dataset c
JOIN olist_orders_dataset o
   ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
ORDER BY total_orders DESC
LIMIT 10;
SELECT COUNT(*) FROM olist_orders_dataset;
SELECT
     c.customer_unique_id,
     COUNT(o.order_id) AS total_orders
FROM olist_customers_dataset c
JOIN olist_orders_dataset o 
	ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
ORDER BY total_orders DESC
LIMIT 10; 
SELECT 
     c.customer_state,
     COUNT(o.order_id) AS total_orders
FROM olist_customers_dataset c 
JOIN olist_orders_dataset o 
    ON c.customer_id = o.customer_id
GROUP BY c.customer_state
ORDER BY total_orders DESC;
SELECT 
      p.product_category_name,
      ROUND(SUM(oi.price), 2) AS total_revenue
FROM olist_order_items_dataset oi
JOIN olist_products_dataset p 
    ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC;    
      
        