CREATE DATABASE auto_parts_limited;

--Refresh the Database in the Object explorer tab
--Create New Connection for auto_parts_limited database
--Select the newly created connection "auto_parts_limited"

CREATE TABLE Customers(
	customer_id bigserial,
	first_name varchar(25),
	last_name varchar(25),
	phone_number char(14),
	email varchar(50),
	street_address varchar(100),
	city varchar(40),
	zip char(5),
	state char(2)
);

CREATE TABLE Employees(
	employee_id bigserial,
	first_name varchar(25),
	last_name varchar(25),
	phone_number char(14),
	email varchar(50),
	street_address varchar(100),
	city varchar(40),
	zip char(5),
	state char(2),
	hire_date date,
	salary_amount money,
	probationary_status boolean
);

CREATE TABLE Parts_Inventory(
	part_number varchar(50), --"part_number varchar(50) UNIQUE" will ensure a unique 
							 --alphanumeric value..but asignment instruction says not 
							 --to use any constriant for uniqueness so using the varhcar(50) data type
							 --Also could have used "part_number UUID" but it has alphabets only from
							 --'A to F'..so not using UUID data type 
	manufacturer_name varchar(75),
	quantity_instock integer,
	price money,
	backordered_status boolean
);