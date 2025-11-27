CREATE DATABASE holy_grounds;

--Refresh the Database in the Object explorer tab
--Create New Connection for holy_grounds database
--Select the newly created connection "holy_grounds"

CREATE TYPE type_of_roast AS ENUM('Dark','Medium','Light');
CREATE TABLE coffee_inventory(
	sku varchar(50),
	coffee_name varchar(50),
	type_of_roast type_of_roast,
	pounds_on_hand decimal(10,2),
	organic boolean,
	low_acid boolean,
	price_per_lb money
);
CREATE TYPE sale_type AS ENUM('Online','In-Store');
CREATE TABLE sales_transaction(
	receipt_id bigserial,
	sale_amount money,
	sale_type sale_type,
	transaction_date timestamp  --can use timestamptz but allowed data types has not listed this data type..so using timestamp
);

CREATE TABLE store(
	store_id serial, --assuming number of stores to be less than 2147483647
					 --bigserial can be used too if number of stores exceeds 2147483647
	manager_name varchar(100),
	phone_number char(14),
	address varchar(100),
	city varchar(25),
	zip char(5),
	state char(2)
);