-- Consider the Country table and Persons table that you created earlier and perform the following: 
-- 1. Find the number of persons in each country. 
select Country_name,count(*)as persons_count from (select Country_name from country union all 
select Country_name from persons)as combined_data group by Country_name;

-- 2. Find the number of persons in each country sorted from high to low. 

select Country_name,count(*)as persons_count from (select Country_name from country union all 
select Country_name from persons)as combined_data group by Country_name order by persons_count desc;

-- 3. Find out an average rating for Persons in respective countries if the average is greater than 3.0 

select Country_name,avg (Rating)as Average_rating from persons where Rating>3 group by Country_name;

-- 4. Find the countries with the same rating as the USA. (Use Subqueries) 
select Country_name,Rating from persons where Rating in (select Rating from persons where Country_name='USA') ;

-- 5. Select all countries whose population is greater than the average population of all nations. 

SELECT country_name, population FROM country WHERE population > (SELECT AVG(population) FROM country);


-- Create a database named Product and create a table called Customer with the following fields in the Product database: 
-- Customer_Id - Make PRIMARY KEY First_name Last_name Email Phone_no Address City State Zip_code Country 
#CREATE A DATABASE Product;
CREATE DATABASE Product;
USE Product;

CREATE TABLE Customer  (Customer_id int primary key,first_name varchar(30) not null ,
Last_name varchar(30) not null,Email varchar(30) not null, Phone_no varchar(10) not null unique,Address varchar(50) ,City varchar(30) not null,
State varchar(30) not null ,Zip_code int not null ,Country varchar(30) not null);

desc Customer;

INSERT INTO customer(Customer_id,first_name,Last_name,Email,Phone_no,Address,City,State,Zip_code,Country)values
(1,'Ajay','cr','ajaycraju98@gmail.com',8129267101,'Abc road','calicut','kerala',676507,'india'),
(2,'john','kin','john123@gmail.com',4512789845,'voys villa','texas','california',452145,'USA'),
(3,'keira','kom','keira12@gmail.com',1201453254,'moad road','capetown','south africa',142541,'south africa'),
(4,'Franco','harsh','harsh245@gmail.com',2132457895,'harsh house','vibrong','randers',124532,'Denmark'),
(5,'marco','ben','marcoben@gmail.com',7895476312,'marco villa','melbourne','albury',001214,'Australia'),
(6,'arun','raj','arun78@gmail.com',4125657841,'heaven house','senthupuram','vijayawada',124578,'India'),
(7,'jacky','jim','jim1245@gmail.com',1245785495,'jacky villa','tinwan','kinwan',789874,'Taipei'),
(8,'geroge','joseph','joseph1245@gmail.com',0033226688,'joseph house','kochi','kerala',624512,'India'),
(9,'muhammed','abhaan','muhammed1234@gmail.com',2451657845,'muhammed manzil','sharjah','Al deira',120245,'UAE'),
(10,'akai','chang','akai124@gmail.com',8978451425,'d kong road','shanghai','chanchu',789814,'China');

select * from Customer;
-- 1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address.
-- Then perform the SELECT operation for the customer_info view. 
CREATE VIEW customer_info AS SELECT first_name,Last_name,Email from customer;
select * from customer_info;

-- 2. Create a view named US_Customers that displays customers located in the US. 
CREATE VIEW US_Customers AS SELECT Customer_id,first_name,Last_name,Phone_no,Country FROM customer where country='USA' ;
select * from US_Customers;

-- 3. Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state. 
CREATE VIEW Customer_details AS SELECT CONCAT(first_name, ' ', last_name) AS full_name, email,phone_no,state FROM customer;
select * from Customer_details;

 
-- 4. Update phone numbers of customers who live in California for Customer_details view. 
UPDATE Customer_details SET Phone_no='3333333333'WHERE State='California';
select * from Customer_details;


-- 5. Count the number of customers in each state and show only states with more than 5 customers. 0
select state,count(Customer_id)as number_of_customers from customer group by State having count(Customer_id)>5;

-- 6. Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view. 
SELECT state, COUNT(*)AS NO_OF_CUSTOMERS FROM Customer_details GROUP BY state;

-- 7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
SELECT * FROM customer_details ORDER BY State ASC;
