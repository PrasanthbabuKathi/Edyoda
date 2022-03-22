-- Creating database with name of edyodadb
create database edyodadb;
use edyodadb;

-- Creating SalesPeople tabel
create table SalesPeople(
Snum int not null,
Sname varchar(50) not null,
City varchar(25) not null,
Comm int not null,
primary key(Snum),
unique (Sname)
);

desc SalesPeople;

-- Insering values in SalesPeople table
insert into SalesPeople values
(1001,'Peel','London',12),
(1002,'Serres','Sanjose',13),
(1004,'Motika','London',11),
(1007,'Rifkin','Barcelona',15),
(1003,'Axelrod','Newyork',10);

select * from SalesPeople;

-- Creating Customers table
create table Customers (
Cnum int not null,
Cname varchar(50) not null,
City varchar(25) not null,
Snum int not null,
primary key (Cnum),
foreign key (Snum) REFERENCES SalesPeople(Snum)
);

desc Customers;

-- Inserting values in to Customers table
insert into Customers values 
(2001,'Hoffman','London',1001),
(2002,'Giovanni','Rome',1003),
(2003,'Liu','anjose',1002),
(2004,'Grass','Berlin',1002),
(2006,'Clemens','London',1001),
(2008,'Cisneros','Sanjose',1007),
(2007,'Pereira','Rome',1004);

select * from Customers;

-- Creating Orders table
create table Orders (
Onum int not null,
Amt int not null,
Odate date not null,
Cnum int not null,
Snum int not null,
primary key (Onum),
foreign key (Cnum) REFERENCES Customers(Cnum),
foreign key (Snum) REFERENCES SalesPeople(Snum)
);

desc Orders;

-- Insering values in to Orders table
insert into Orders values 
(3001,18.69,STR_TO_DATE('3-10-1990', '%m-%d-%Y'),2008,1007),
(3003,767.19,STR_TO_DATE('3-10-1990', '%m-%d-%Y'),2001,1001),
(3002,1900.10,STR_TO_DATE('3-10-1990', '%m-%d-%Y'),2007,1004),
(3005,5160.45,STR_TO_DATE('3-10-1990', '%m-%d-%Y'),2003,1002),
(3006,1098.16,STR_TO_DATE('3-10-1990', '%m-%d-%Y'),2008,1007),
(3009,1713.23,STR_TO_DATE('4-10-1990', '%m-%d-%Y'),2002,1003),
(3007,75.75,STR_TO_DATE('4-10-1990', '%m-%d-%Y'),2004,1002),
(3008,4273.00,STR_TO_DATE('5-10-1990', '%m-%d-%Y'),2006,1001),
(3010,1309.95,STR_TO_DATE('6-10-1990', '%m-%d-%Y'),2004,1002),
(3011,9891.88,STR_TO_DATE('6-10-1990', '%m-%d-%Y'),2006,1001);

select * from SalesPeople;

-- Display the SalesPeople names who staring with Letter A or a
select * from Customers;
select Count(Sname) from SalesPeople where Sname like 'a%' and Sname like 'A%';

select * from Orders;

-- Display the Snum, Sname, Total orders of Pariticular sales peresong and total amount made by SalesPeople
select SalesPeople.Snum, SalesPeople.Sname, count(Orders.Amt) as TotalOrders, sum(Orders.Amt) as TotalAmount from Orders
inner join SalesPeople on SalesPeople.Snum = Orders.Snum
group by Snum;

-- Displaying the Salesperson who is from Newyork city
select count(Snum) from SalesPeople
where City = 'Newyork';

-- Displaying the SalesPeople who is form London or Pairs City
select * from SalesPeople 
where City = 'London' or City = 'Paris';

-- Displaying the Number orders done by each SalesPeople
select  SalesPeople.Snum, SalesPeople.Sname, count(Orders.Onum) as TotalOrders from SalesPeople
inner join Orders on Orders.Snum = SalesPeople.Snum
group by Snum;

-- Displaying OrderNumber, SalesPerson Number, SalesPerson Name, Order date, and amount of the Amount
select Orders.Onum, SalesPeople.Snum, SalesPeople.Sname, Orders.Odate, Orders.Amt from Orders
inner join SalesPeople on Orders.Snum = SalesPeople.Snum
order by Orders.Onum;


-- ***********   END     *********** --

