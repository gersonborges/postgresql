SELECT
  first_name,
  last_name
FROM customer
	     
SELECT * FROM film

SELECT
  first_name as primeiro_nome,
  last_name as segundo_nome
FROM customer

SELECT
  payment_id,
  customer_id,
  amount,
  amount + 10.0 as NovoValor
FROM payment

SELECT
  customer_id,
  first_name || last_name
FROM customer

SELECT
  customer_id,
  first_name || ' ' || last_name as nome_completo
FROM customer

SELECT * FROM film_actor

SELECT distinct actor_id FROM film_actor

SELECT * FROM film_category

SELECT distinct category_id FROM film_category

SELECT * FROM film LIMIT 100

SELECT * FROM film limit 100 offset 3

SELECT * FROM customer where active = 1

SELECT * FROM customer where active = 0

SELECT * FROM customer where last_name = �Smith�

SELECT * FROM customer where �Smith�  = last_name

SELECT * FROM customer where create_date = �2006-02-14�

SELECT * FROM film where length >= 120

SELECT * FROM film where rating <> 'NC-17'

SELECT * FROM film
WHERE rental_duration BETWEEN 2 AND 4

SELECT * FROM film
WHERE rental_rate IN (0.99,2.99)

SELECT * FROM CUSTOMER WHERE LAST_NAME LIKE 'King'

SELECT * FROM CUSTOMER WHERE LAST_NAME LIKE '_a%'

SELECT * FROM CUSTOMER WHERE LAST_NAME LIKE '%a'

SELECT * FROM CUSTOMER WHERE LAST_NAME LIKE '%a%a%'

SELECT * FROM CUSTOMER WHERE LAST_NAME LIKE '%a' AND STORE_ID = 1

SELECT * FROM CUSTOMER WHERE LAST_NAME LIKE '%a'
OR STORE_ID = 1

SELECT * FROM CUSTOMER WHERE  LAST_NAME NOT LIKE '%a'

SELECT * FROM CUSTOMER ORDER BY LAST_NAME

SELECT * FROM CUSTOMER ORDER BY LAST_NAME DESC

SELECT * FROM CUSTOMER ORDER BY STORE_ID DESC

SELECT * FROM CUSTOMER ORDER BY STORE_ID, LAST_NAME

SELECT * FROM CUSTOMER
SELECT * FROM RENTAL

SELECT A.FIRST_NAME FROM CUSTOMER A

SELECT c.customer_id, c.first_name, c.last_name, p.amount, p.payment_date
FROM customer C INNER JOIN payment P
ON p.customer_id = c.customer_id

SELECT c.customer_id, c.first_name, c.last_name, c.email,
       p.amount, p.payment_date
FROM customer C, payment P
WHERE p.customer_id = c.customer_id

SELECT c.customer_id, c.first_name, p.amount, p.payment_date, s.first_name, s.last_name
FROM customer C INNER JOIN payment P
ON p.customer_id = c.customer_id
INNER JOIN staff s
ON p.staff_id = s.staff_id

SELECT c.customer_id, c.first_name
       ,p.amount, p.payment_date
       ,s.first_name, s.last_name
FROM customer C, payment P, staff S
WHERE p.customer_id = c.customer_id
and   p.staff_id = s.staff_id

SELECT F.film_id, F.title, I.inventory_id
FROM film F LEFT JOIN inventory I
ON F.film_id = I.film_id;

SELECT F.film_id, F.title, I.inventory_id
FROM film  F LEFT JOIN inventory I
ON F.film_id = I.film_id
WHERE I. inventory_id IS NULL


SELECT F.film_id, F.title, I.inventory_id
FROM inventory I RIGHT JOIN film  F
ON F.film_id = I.film_id;


SELECT F.film_id, F.title, I.inventory_id
FROM inventory I RIGHT JOIN film  F
ON F.film_id = I.film_id
WHERE I. inventory_id IS NULL

SELECT F.film_id, F.title, I.inventory_id
FROM inventory I FULL JOIN film  F
ON F.film_id = I.film_id;

SELECT * FROM INFORMATION_SCHEMA.TABLES
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
SELECT * FROM INFORMATION_SCHEMA.ROUTINES

SELECT * FROM pg_tables
SELECT * FROM pg_index
SELECT * FROM pg_proc
SELECT * FROM pg_class
SELECT * FROM pg_attribute

SELECT pg_database.datname,
       pg_size_pretty(pg_database_size(pg_database.datname)) AS size   FROM pg_database;
SELECT pg_size_pretty(pg_database_size('dvdrental'));
SELECT pg_size_pretty(pg_relation_size('customer'));
SELECT pg_size_pretty(pg_relation_size('rental'));

SELECT DISTINCT TGNAME AS TRIGGER_NAME
FROM PG_TRIGGER
WHERE TGNAME !~ '^PG_';

SELECT DISTINCT TRIGGER_NAME
FROM INFORMATION_SCHEMA.TRIGGERS
WHERE TRIGGER_SCHEMA NOT IN
('PG_CATALOG', 'INFORMATION_SCHEMA');

SELECT p.proname AS procedure_name, p.pronargs AS num_args
     , t1.typname AS return_type, a.rolname AS procedure_owner
     , l.lanname AS language_type, p.proargtypes AS argument_types_oids, prosrc AS body
FROM pg_proc p LEFT JOIN pg_type t1
	ON p.prorettype=t1.oid
LEFT JOIN pg_authid a
	ON p.proowner=a.oid
LEFT JOIN pg_language l
ON p.prolang=l.oid
WHERE l.lanname in ('sql','plpgsql')

SELECT AVG(AMOUNT) AS MEDIA FROM PAYMENT

SELECT AVG(AMOUNT) AS MEDIA, MAX(AMOUNT) AS MAIOR, 	MIN(AMOUNT) AS MENOR, SUM(AMOUNT) AS SOMATORIO
	FROM PAYMENT

SELECT COUNT(*) FROM RENTAL

SELECT COUNT(INVENTORY_ID) FROM RENTAL

SELECT COUNT(DISTINCT INVENTORY_ID) FROM RENTAL

SELECT CUSTOMER_ID, COUNT(*)  FROM RENTAL

SELECT CUSTOMER_ID, COUNT(*)
FROM RENTAL
GROUP BY CUSTOMER_ID
ORDER BY CUSTOMER_ID

SELECT CUSTOMER_ID, STAFF_ID, COUNT(*)
FROM RENTAL
GROUP BY CUSTOMER_ID, STAFF_ID
ORDER BY CUSTOMER_ID, STAFF_ID

SELECT CUSTOMER_ID,STAFF_ID, COUNT(*)
FROM RENTAL WHERE CUSTOMER_ID <> 10
GROUP BY CUSTOMER_ID, STAFF_ID
ORDER BY CUSTOMER_ID, STAFF_ID

SELECT CUSTOMER_ID, STAFF_ID, COUNT(*)
FROM RENTAL
GROUP BY CUSTOMER_ID, STAFF_ID
HAVING COUNT(*) > 20
ORDER BY CUSTOMER_ID, STAFF_ID

SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE table_name = 'country'

INSERT INTO COUNTRY VALUES(110,'XX')

SELECT * FROM COUNTRY;


INSERT INTO ACTOR(ACTOR_ID, FIRST_NAME, LAST_NAME)
VALUES(300,'Roberto','Silva')

SELECT * FROM ACTOR

INSERT INTO CUSTOMER VALUES(600, 1, 'MARGARIDA', 'SILVA', NULL, 5, true, now(), now(), 1)

SELECT * FROM CUSTOMER WHERE CUSTOMER_ID = 600

SELECT * FROM CUSTOMER WHERE CUSTOMER_ID = 600

UPDATE CUSTOMER  SET EMAIL = 'MARGARIDA.SILVA@GMAIL.COM'
WHERE CUSTOMER_ID = 600

UPDATE PAYMENT SET AMOUNT = AMOUNT*1.1
WHERE PAYMENT_ID = 17507;

UPDATE FILM SET RENTAL_DURATION = DEFAULT
WHERE FILM_ID = 133


UPDATE CITY SET COUNTRY_ID = 9999 WHERE CITY_ID = 600

SELECT * FROM COUNTRY;

SELECT * FROM COUNTRY;

DELETE FROM COUNTRY WHERE COUNTRY_ID = 110

DELETE FROM COUNTRY WHERE COUNTRY_ID = 1

CREATE TABLE CUSTOMERS (
          ID INT NOT NULL, NAME VARCHAR(50) NULL
)

INSERT INTO CUSTOMERS VALUES(1, 'A')
INSERT INTO CUSTOMERS VALUES(NULL, 'A')
INSERT INTO CUSTOMERS VALUES(2, NULL)

SELECT * FROM CUSTOMERS
DROP TABLE CUSTOMERS

CREATE TABLE CUSTOMERS (
          ID INT,  NAME VARCHAR(50)
          CONSTRAINT CUST_NULL NULL
)

CREATE TABLE CUSTOMERS (
          ID INT UNIQUE, NAME VARCHAR(50)
)

INSERT INTO CUSTOMERS VALUES(1, 'A')
INSERT INTO CUSTOMERS VALUES(NULL, 'A')
INSERT INTO CUSTOMERS VALUES(1, 'B')

SELECT * FROM CUSTOMERS
SELECT * FROM INFORMATION_SCHEMA.constraint_column_usage
WHERE table_name = 'customers'

SELECT * FROM INFORMATION_SCHEMA.constraint_table_usage
WHERE table_name = 'customers'
DROP TABLE CUSTOMERS;

CREATE TABLE CUSTOMERS
(
          ID INT NOT NULL PRIMARY KEY,
          NAME VARCHAR(50)
);

INSERT INTO CUSTOMERS VALUES(1, 'A');
INSERT INTO CUSTOMERS VALUES(1, 'B');
INSERT INTO CUSTOMERS VALUES(NULL, 'C');

DROP TABLE CUSTOMERS;

CREATE TABLE CUSTOMERS
(
          ID INT NOT NULL ,
          NAME VARCHAR(50),
          CONSTRAINT PK_CUSTOMERS PRIMARY KEY(ID)
);

DROP TABLE CUSTOMERS;

CREATE TABLE CUSTOMERS
(
          ID INT NOT NULL ,  CPF INT NOT NULL,
          NAME VARCHAR(50),
          CONSTRAINT PK_CUSTOMERS2 PRIMARY KEY(ID,CPF)
);

CREATE TABLE CUSTOMERS
(
          ID INT NOT NULL PRIMARY KEY,
          NAME VARCHAR(50),
          LOCATION_ID INT,
          CONSTRAINT FK_CUST FOREIGN KEY (LOCATION_ID)
          REFERENCES CITY(CITY_ID)
);

INSERT INTO CUSTOMERS VALUES(1, 'A', 453);
INSERT INTO CUSTOMERS VALUES(2, 'B', 471);

SELECT * FROM CITY;
SELECT * FROM CUSTOMERS;

CREATE TABLE CUSTOMERS
(
       	ID INT NOT NULL CHECK(ID > 0),
     		NAME VARCHAR(50)
);

INSERT INTO CUSTOMERS VALUES(1, 'A');
INSERT INTO CUSTOMERS VALUES(-1, 'A');

ALTER TABLE CUSTOMERS ADD CONSTRAINT
  CK_POSITIVO CHECK (ID > 0)

ALTER TABLE CUSTOMERS DROP CONSTRAINT CK_POSITIVO


