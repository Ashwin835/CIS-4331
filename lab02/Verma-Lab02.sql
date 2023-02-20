--Ashwin Verma
--Lab 02

--Question 1
SELECT PRODUCT_ID, PRODUCT_NAME,DISCOUNT_PERCENT
FROM PRODUCTS_MGS
ORDER BY DISCOUNT_PERCENT, PRODUCT_ID;

--Question 2
SELECT LAST_NAME || ', ' || FIRST_NAME
AS "Customer Name"
FROM CUSTOMERS_MGS
WHERE LAST_NAME BETWEEN'B'AND 'T'
ORDER BY LAST_NAME DESC;

--Question 3
SELECT PRODUCT_CODE, DISCOUNT_PERCENT, DATE_ADDED
FROM PRODUCTS_MGS
WHERE DISCOUNT_PERCENT>=20 AND DISCOUNT_PERCENT<=30
ORDER BY DATE_ADDED DESC;

--Question 4
SELECT product_name || ' was ' || list_price
|| ', now is ' || (list_price*((100 - discount_percent)/100))
AS "Product Price Info"
FROM products_mgs 
WHERE rownum<=3
ORDER BY  (list_price*((100 - discount_percent)/100)) DESC;


--Question 5
SELECT item_id, item_price, 
discount_amount, item_price*quantity TOTAL_PRICE_BEFORE_DISCOUNT,
discount_amount * quantity TOTAL_DISCOUNT_AMOUNT
FROM order_items_mgs 
WHERE discount_amount * quantity >600;

--Question 6
SELECT order_id, customer_id, order_date, ship_amount
FROM orders_mgs
WHERE ship_date IS null;

--Question 7
SELECT 'Hello! Today is '
|| TO_CHAR(SYSDATE,'Mon-dd-yyyy') AS GREETING
FROM dual;

--Question 8
SELECT 799.99 AS PRICE_BEFORE_TAX,
(8/100) AS TAX_RATE, 799.99 * (8/100) AS TAX_AMOUNT,
799.99+(799.99 * (8/100)) AS PRICE_AFTER_TAX
FROM dual;

--Question 9
SELECT DISTINCT product_id, item_price, 
discount_amount FROM order_items_mgs
ORDER BY item_price DESC;