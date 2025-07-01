create table Table_1 ( 
Category_ID int Primary key, 
Category_Name varchar(20), 
Department Varchar (30) 
);

Insert into Table_1 values (1,'Electronics','Tech');
Insert into Table_1 values (2,'Furniture','Home');

use data;
Create table Table_2 (
Prod_ID int primary key,
Prod_Name varchar(30),
Price numeric,
Category_ID int,
foreign key (Category_ID) references Table_1(Category_ID)
);

Insert into Table_2 values (101,'laptop',50000,1);
Insert into Table_2 values (102,'samartphone',40000,1);
Insert into Table_2 values (103,'Desk',10000,2);
Insert into Table_2 values (104,'chair',1000,2);
Insert into Table_2 values (105,'Tablet',5000,1);

select * from Table_1;
select * from Table_2;

-- Subquery (Select)
SELECT Prod_Name,
       (SELECT Category_Name
        FROM Table_1
        WHERE Table_1.Category_ID = Table_2.Category_ID) AS Category
FROM table_2;

-- Subquery (Where)
SELECT Prod_Name,Price
FROM Table_2
WHERE Price > (SELECT AVG(Price) FROM Table_2);

-- Subquery (FROM)
SELECT Category_Name, MAX(Price) AS Max_Price
FROM (
    SELECT e.Prod_Name, e.Price, d.Category_Name
    FROM Table_2 e
    JOIN Table_1 d ON e.Category_ID = d.Category_ID
) AS Temp
GROUP BY Category_Name;

-- Subquery using IN
SELECT Prod_Name
FROM Table_2
WHERE Category_ID IN (SELECT Category_ID FROM Table_1 WHERE Department IN ('tech'));

-- Subquery using EXISTS
SELECT Prod_Name 
FROM Table_2 e
WHERE EXISTS (
    SELECT 1 FROM Table_1 d 
    WHERE d.Category_ID = e.Category_ID
);

-- Scalar Subquery
SELECT prod_name, (SELECT AVG(price) FROM Table_2) AS avg_price 
FROM table_2;




