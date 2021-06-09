-- Drop the tables if they exist

drop table creditcard cascade;
drop table Branch cascade;
drop table BankCustomer cascade;
drop table transaction cascade;
drop table Loan cascade;
drop table Account cascade;
drop table Bank_Employee cascade;
drop table Branch_employee cascade;
drop table Customer_accounts cascade;
drop table account_type cascade;
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Create the tables


Create Table Branch(
branch_id int,
branch_name varchar(20) not null unique,
branch_address varchar(50),
branch_phoneNumber varchar(30) not null unique,
primary key(branch_id));


Create Table BankCustomer(
cust_id int,
cust_fname varchar(10) Not null,
cust_lname varchar(10) not null,
cust_address varchar(50) not null,
cust_email varchar(50) not null unique,
cust_gender varchar(10),
cust_phoneNumber varchar(30) Unique not null,
cust_password varchar(30) Unique not null,
Primary Key(cust_id));

create table transaction(
transaction_id int,
transaction_type varchar(50) not null,
description varchar(50),
amount double precision not null,
transactiondate date not null,
cust_id int not null,
Primary key (transaction_id),
constraint Transactioncstr foreign key(cust_id) references BankCustomer(cust_id) on update cascade on delete set null);


create table Loan(
loan_id int,
duration varchar(20),
loan_amount double precision not null,
interest_rate double precision not null,
cust_id int not null,
primary key(loan_id),
constraint Loancstr foreign key(cust_id) references BankCustomer(cust_id) on update cascade on delete set null);


create table Account_type(
type varchar(20) not null,
min_balance double precision not null,
primary key(type));


create table Account(
account_id int,
type varchar(20) not null,
opening_date date not null,
balance double precision not null,
branch_id int not null,
primary key(account_id),
constraint Accountstr foreign key(branch_id) references branch(branch_id) on update cascade on delete set null,
constraint Account_type_str foreign key(type) references account_type(type) on update cascade on delete set null);


create table Bank_Employee(
Employee_id int,
employee_fname varchar(10) not null,
employee_lname varchar(10) not null,
employee_adress varchar(50) unique,
employee_email varchar(50) unique not null,
employee_gender varchar(3),
employee_password varchar(30) unique not null,
Manager_id int,
Primary key(Employee_id),
Constraint ManagerConst foreign key(Manager_id) references Bank_Employee(Employee_id) on update cascade on delete set null);

create table Branch_employee(
branch_id int,
Employee_id int,
start_date date not null,
end_date date,
Primary key(branch_id, Employee_id),
Constraint BranchEmployeeConst foreign key(Employee_id) references Bank_Employee(Employee_id) on update cascade on delete set null,
Constraint BranchConst foreign key(branch_id) references Branch(branch_id) on update cascade on delete set null);


Create Table CreditCard(
CreditCard_Number int,
expiration_date date not null,
cust_id int not null,
primary key(CreditCard_Number),
constraint CustCreditCardCons foreign key(cust_id) references BankCustomer(cust_id) on update cascade on delete set null);


create table Customer_accounts(
cust_id int,
acc_id int,
primary key(cust_id,acc_id),
constraint CustomerAccountsCstr foreign key(cust_id) references BankCustomer(cust_id) on update cascade on delete cascade,
constraint AccIdCustomerCstr foreign key(acc_id) references Account(account_id) on update cascade on delete cascade);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Populate tables

-- Cleaning tables
delete from creditcard;
delete from Branch;
delete from BankCustomer;
delete from transaction;
delete from Loan;
delete from Account;
delete from Bank_Employee;
delete from Branch_employee;
delete from Customer_accounts;
delete from account_type;

--Bank customers
INSERT INTO BankCustomer (cust_id,cust_fname,cust_lname,cust_address,cust_email, cust_gender, cust_phoneNumber, cust_password) VALUES 
(599,'Blaine','Hernandez','P.O. Box 315, 4458 Luctus Rd.','pede@ametnullaDonec.co.uk','M','326-831770','AAAAA'),
(761,'Paloma','Hunter','270-1832 Vehicula St.','malesuada@Aeneanegestas.edu','F','346-639517','BBBBB'),
(837,'Marny','Campbell','Ap #543-1476 Parturient Rd.','Mauris@cursusluctusipsum.ca','M','959-934841','CCCCC'),
(645,'Charity','Willis','Ap #731-201 Aliquam, Street','tellus.Phasellus@anteMaecenasmi.co.uk','M','109-315390','DDDD'),
(140,'Zahir','Mcpherson','P.O. Box 431, 5539 Ac Av.','imperdiet.erat.nonummy@eliterat.ca','M','722-144874','EEEEEE'),
(804,'Dane','Ellis','P.O. Box 590, 9139 Lacus. Av.','risus.Morbi.metus@fermentumconvallis.edu','M','180-374087','ZZZZZ'),
(288,'Patrick','Miranda','743-4961 Leo. Avenue','amet.massa@afelisullamcorper.edu','M','176-938814','KKKKKK'),
(915,'Drake','William','P.O. Box 230, 8408 Nascetur Rd.','massa@feugiatplacerat.com','M','214-227914','RRRRRR'),
(700,'Keelie','George','P.O. Box 722, 3715 Consequat Street','arcu.eu@Vivamuseuismodurna.net','M','473-389291','QQQQQQQQ'),
(338,'Oscar','Spears','P.O. Box 159, 3026 Eget, Avenue','diam@massa.net','M','481-346356','WWWWWW'),
(731,'Bertha','Gallagher','8574 A Ave','volutpat.ornare@Proin.com','F','590-943631','HHHHHHHH'),
(736,'Louis','Orr','Ap #918-7334 Augue. St.','ante@consequatlectus.ca','M','710-131411','MMMMMMMMM'),
(364,'Deborah','Dean','P.O. Box 581, 4215 Pellentesque Av.','non.enim@nequeNullamnisl.co.uk','F','946-605468','XXXXXXXX'),
(244,'Lynn','Rollins','P.O. Box 310, 3302 Nisl Rd.','eu.eros.Nam@Phaselluslibero.co.uk','F','174-968643','NNNNNNN'),
(666,'Kaden','Atkins','Ap #998-760 Et Rd.','dictum@nunc.co.uk','M','215-406754','YYYYYYYY'),
(730,'Bradley','Carlson','3827 Et, St.','magna.Ut.tincidunt@tinciduntaliquamarcu.ca','M','906-469906','OOOOOOOO'),
(19,'Oren','Roach','4703 Massa. Street','egestas.a.dui@lacusAliquam.net','M','675-438985','PPPPPPPP'),
(405,'Kareem','Copeland','P.O. Box 644, 2943 Tincidunt Av.','augue.id@idenimCurabitur.com','M','983-732855','JJJJJJJJ'),
(941,'Gannon','Wilson','872-5027 Turpis. Av.','id@sit.co.uk','M','938-181616','FFFFFFFFFF'),
(289,'Idola','Clarke','P.O. Box 493, 2089 Arcu. St.','auctor.non.feugiat@quisarcuvel.ca','F','726-379003','GGGGGGGGGGG');

--Account_type
INSERT INTO Account_type (type, min_balance) VALUES 
('current account', 100),
('savings account', 500),
('salary account', 100),
('checking account', 200);

--Branch
INSERT INTO Branch (branch_id,branch_name,branch_address,branch_phoneNumber) VALUES 
(100,'Sit','1403 Egestas Avenue','839515-7053'),
(101,'Dictum','864-5704 Dictum Street','884981-4275'),
(102,'Rutrum','209-5381 Laoreet Rd.','525408-8569'),
(103,'Magna','991 Lorem Rd.','832536-1411'),
(104,'Nulla','1842 A, St.','564272-1905'),
(105,'Adip','9250 Posuere, Avenue','678031-7100'),
(106,'Sed','828-140 Neque. Ave','763839-5553'),
(107,'Duis Mi Enim','4517 Semper, Road','846916-0736'),
(108,'Ut Nulla','1045 At St.','777766-7556'),
(109,'Ligula','631 Vivamus Road','143279-4988'),
(110,'Neque','7442 Lacus. Av.','965504-7588'),
(111,'Donec','5946 Vitae Rd.','964671-4932'),
(112,'Odio','4448 A, Av.','108950-4151'),
(113,'Ac PC','6487 Faucibus Av.','732607-7307'),
(114,'Pellentesque Ltd','677-8273 Mauris Road','117926-9798'),
(115,'Laoreet','610-6675 Lorem Av.','148213-7484'),
(116,'Nullam','3178 Nam Rd.','337690-6552'),
(117,'scing','9962 Dolor. St.','024996-4974'),
(118,'Tulip','4464 A St.','079455-1994'),
(119,'Turpis','Placerat, St.','023758-3273');

--Account
INSERT INTO Account (account_id, type, opening_date, balance, branch_id) VALUES
(777,'savings account','2013-01-13',1700, 103),
(788,'savings account','2013-03-13',1100, 105),
(645,'current account','2012-12-20',100, 110),
(555,'checking account','2013-07-03',0, 115),
(444,'salary account','2014-01-01',10000, 113),
(333,'salary account','2013-08-17',1500, 105),
(222,'current account','2013-09-10',1000, 107),
(111,'savings account','2013-11-23',50, 108),
(123,'checking account','2013-02-14',90, 108),
(245,'savings account','2014-05-12',1630, 116),
(465,'savings account','2013-06-06',1500, 103),
(789,'savings account','2013-03-13',1100, 105),
(646,'current account','2012-12-20',100, 110),
(559,'checking account','2013-07-03',0, 115),
(443,'salary account','2014-01-01',10, 113),
(337,'salary account','2013-08-17',1570, 105),
(220,'current account','2013-09-10',1900, 107),
(119,'savings account','2013-11-23',500, 108),
(126,'checking account','2013-02-14',85, 108),
(247,'savings account','2014-05-12',10, 116);

--CreditCard
INSERT INTO CreditCard (CreditCard_number, expiration_date, cust_id) VALUES
(654123, '2019-05-03',599),
(789123, '2019-08-23',700),
(223311, '2022-09-03',730),
(111111, '2018-07-03',338),
(653214, '2020-05-03',666),
(786319, '2020-05-03',19),
(913782, '2019-05-03',736),
(856234, '2021-05-30',244);

--customer_accounts
INSERT INTO customer_accounts (cust_id, acc_id) VALUES
(599,777),
(761,788),
(837,645),
(645,555),
(140,444),
(804,333),
(288,222),
(915,111),
(700,123),
(338,245),
(731,465),
(736,789),
(364,646),
(244,559),
(666,443),
(730,337),
(19,220),
(405,119),
(941,126),
(289,247);

--bank_employee
INSERT INTO bank_employee (employee_id, employee_fname, employee_lname, employee_adress, employee_gender, employee_email, manager_id, employee_password) VALUES 
(300,'Xander','Ruiz','418-8548 Tempor, Road','M','enim.sit@elitelit.net',NULL,'XXXX123'),
(302,'Kevin','Dodson','Ap #274-163 Egestas St.','M','sodales.elit.erat@nisisemsemper.net',300,'KKKK777'),
(304,'Summer','Hull','779-4427 Vulputate, St.','F','egestas.Fusce.aliquet@euismod.com',300,'ss4651'),
(306,'Hector','Lancaster','2777 Ridiculus St.','M','orci.Donec.nibh@bibendum.com',304,'Hl41233'),
(308,'Marsden','Valenz','Ap #121-7435 Quisque Road','M','ac.turpis.egestas@Morbiquisurna.org',NULL,'Mv4444'),
(310,'Calvin','Leon','Ap #897-9073 Adipiscing St.','M','ac.turpis.egestas@fringillacursuspurus.net',304,'CL48888'),
(312,'Wayne','Schneider','400-4579 Suspendisse Ave','M','tempor.erat@Praesent.co.uk',300,'WSh789'),
(314,'Regan','Slater','Ap #512-8810 Curabitur Avenue','M','iaculis.odio@risusDonec.com',308,'rsssss447s'),
(316,'Chris','Hopkins','Ap #897-7672 Sagittis Av.','M','risus@feugiatLoremipsum.edu',308,'Chopkins66'),
(318,'Cara','Poole','2193 Ac Avenue','F','ante.ipsum.primis@lacusvestibulumlorem.net',304,'CaraP1111'),
(320,'Amethyst','Lynch','P.O. Box 863, 9007 Eget, Ave','F','Aliquam.ornare.libero@luctuslobortis.org',300,'AL0003');

--branch_employee

INSERT INTO branch_employee (branch_id, employee_id, start_date, end_date) VALUES
(100, 300, '2010-01-05',NULL),
(106, 302, '2013-01-07','2015-07-07'),
(110, 302, '2015-07-08',NULL),
(109, 304, '2012-01-05',NULL),
(110, 306, '2010-01-05','2012-03-03'),
(110, 308, '2010-01-05',NULL),
(110, 310, '2010-01-05','2018-10-10'),
(117, 312, '2010-01-05',NULL),
(106, 314, '2010-01-05',NULL),
(106, 316, '2011-09-05','2017-09-05'),
(108, 318, '2010-08-08',NULL),
(101, 320, '2010-07-07',NULL),
(100, 306, '2012-03-04',NULL);

--loan
INSERT INTO loan (loan_id, duration, loan_amount, interest_rate, cust_id) VALUES
(456731,'2013-01 2013-08',50000, 0.15, 804),
(791364,'2014-01 2014-06',120000, 0.05, 731),
(123987,'2016-07 2016-12',75000, 0.08, 244),
(648721,'2013-10 2014-10',200000, 0.20, 19),
(964381,'2015-01 2015-03',65000, 0.03, 941),
(829371,'2017-03 2018-08',98750, 0.25, 244),
(499999,'2015-01 2016-08',80000, 0.10, 804);

--transactions
INSERT INTO transaction (transaction_id, transaction_type, description, amount, transactiondate, cust_id) VALUES
(4253, 'transfert','transfert for family',10000, '2015-03-03',288),
(7586, 'transfert','online payment',500, '2018-07-13',666),
(1624, 'deposit','filling account',1000, '2014-07-02',244),
(9137, 'transfert',NULL,10250, '2016-07-09',19),
(6428, 'deposit',NULL,10000, '2019-07-30',288);
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Create indexes

CREATE INDEX acc_type ON Account(type);
CREATE INDEX cust_iden ON BankCustomer(cust_id);
CREATE INDEX branch_iden ON Branch(branch_id);

-- Create views

--VIEW 1: creating a view for all the customers that have an expired credit card

CREATE VIEW customer_expired_CCvw AS
SELECT cust_id, cust_fname, cust_lname, expiration_date FROM
BankCustomer NATURAL JOIN CreditCard
WHERE expiration_date < current_date;

--VIEW 2: creating a view for number of customers in each branch

CREATE VIEW cust_in_branchvw AS
SELECT B.branch_id, B.branch_name, COUNT(DISTINCT bc.cust_id) AS NoOfCustomers
FROM BankCustomer AS bc NATURAL JOIN customer_accounts AS ca NATURAL JOIN account AS acc NATURAL JOIN branch AS B
WHERE bc.cust_id = ca.cust_id AND ca.acc_id = acc.account_id AND acc.branch_id = B.branch_id
GROUP BY B.branch_id;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Triggers

--Trigger 1: Trigger to check if a transaction is either a transfer or a deposit:

DROP TRIGGER IF EXISTS trTransactionIns ON Transaction;

CREATE OR REPLACE FUNCTION transactionTypeError() RETURNS TRIGGER
AS $$
BEGIN
  If NEW.transaction_type NOT IN ('transfer', 'deposit')
  THEN
	RAISE EXCEPTION 'A transaction can only be a "transfer" or a "deposit"';
	RETURN NEW;
  END IF;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER trTransactionIns BEFORE INSERT ON Transaction
FOR EACH ROW
EXECUTE FUNCTION transactionTypeError();

--Example use:

INSERT INTO transaction (transaction_id, transaction_type, description, amount, transactiondate, cust_id) VALUES
(4203, 'money','transfer for family',1000, '2015-03-13',244);

--Trigger 2: Trigger to check if account type is a 'current account', 'savings account', 'salary account', or 'checking account':

DROP TRIGGER IF EXISTS trAccountTypeIns ON Account_type;

CREATE OR REPLACE FUNCTION accountTypeError() RETURNS TRIGGER
AS $$ 
BEGIN
  If NEW.type NOT IN ('current account', 'savings account', 'salary account', 'checking account')
  THEN
	RAISE EXCEPTION 'An account is either a "current account", a "savings account", a "salary account", or a "checking account"';
  END IF;
  RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER trAccountTypeIns BEFORE INSERT ON Account_type
FOR EACH ROW
EXECUTE FUNCTION accountTypeError();

--Example use:
INSERT INTO Account_type (type, min_balance) VALUES 
('regular account', 400);

--Trigger 3: Trigger to update customer's account balance upon Transaction:

DROP TRIGGER IF EXISTS trTransaction ON Transaction;
DROP FUNCTION IF EXISTS accountTransactionUpdate();

CREATE FUNCTION accountTransactionUpdate() RETURNS TRIGGER
AS $$
BEGIN
  If NEW.transaction_type = 'transfer'
  THEN
	--Withdraw from one account only
	UPDATE Account
	SET balance = balance - NEW.amount
	WHERE account_id = (SELECT acc_id
  		 	   FROM   customer_accounts
			   WHERE  cust_id = NEW.cust_id
   			   LIMIT  1);
  ELSE
	--Deposit into one account only
	UPDATE Account
	SET balance = balance + NEW.amount
	WHERE account_id = (SELECT acc_id
  		 	   FROM   customer_accounts
			   WHERE  cust_id = NEW.cust_id
   			   LIMIT  1);	
  END IF;
  RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER trTransaction AFTER INSERT ON Transaction
FOR EACH ROW
EXECUTE FUNCTION accountTransactionUpdate();

--Example use:

INSERT INTO transaction (transaction_id, transaction_type, description, amount, transactiondate, cust_id) VALUES
(4553, 'transfer','transfer for family',133, '2016-03-13',599);

INSERT INTO transaction (transaction_id, transaction_type, description, amount, transactiondate, cust_id) VALUES
(4123, 'deposit','deposit into account',133, '2015-03-13',599);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Stored Procedures

--Procedure1: Procedure for a customer to withdraw an amount from their account balance:

CREATE OR REPLACE PROCEDURE spWithdrawAmount(a_id int, w_amount int)
AS $$
BEGIN
    IF w_amount < 10 
    THEN 
	RAISE NOTICE 'Amount less than $10 cannot be withdrawn';
	RETURN;
    END IF;
    UPDATE Account
    SET balance = balance - w_amount
    WHERE account_id = a_id;
END;
$$
LANGUAGE plpgsql;

-- Example use:
CALL spWithdrawAmount (777, 200);

--Procedure2: procedure for an employee to deposit an amount in a customer’s account balance:

CREATE OR REPLACE PROCEDURE spDepositAmount(a_id int, d_amount int)
AS $$
BEGIN
    IF d_amount < 1 
    THEN 
	RAISE NOTICE 'Amount less than $1 cannot be deposited';
	RETURN;
    END IF;
    UPDATE Account
    SET balance = balance + d_amount
    WHERE account_id = a_id;
END;
$$
LANGUAGE plpgsql;

-- Example use:
CALL spDepositAmount (788, 137);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Functions

--Function 1: Function to obtain all the employees that directly or indirectly to a particular manager:

CREATE OR REPLACE FUNCTION employees (managerNumber int)
RETURNS SETOF Bank_Employee
AS $$
DECLARE
       employee_r Bank_Employee%rowtype;
BEGIN
     IF NOT EXISTS
	( SELECT 1 FROM Bank_Employee
	   WHERE Employee_id = managerNumber)
     THEN
	RAISE NOTICE '% is an invalid employee ID.', managerNumber;
	RETURN;
      END IF;

      FOR employee_r IN
	SELECT * FROM Bank_Employee
	WHERE Manager_id = managerNumber
      LOOP
	RETURN NEXT employee_r;
	RETURN QUERY SELECT * FROM employees(employee_r.Employee_id);
      END LOOP;
END;
$$
LANGUAGE plpgsql;	

--Example use:
SELECT * FROM employees(300);

--Function2: Function to return the account balance of a customer:

CREATE OR REPLACE FUNCTION accBalance(id int, a_id int)
RETURNS int
AS $$
BEGIN
    RETURN (SELECT balance FROM Account
    	   JOIN customer_accounts 
        	   ON acc_id = account_id
    	   WHERE cust_id = id AND account_id = a_id);
END;
$$
LANGUAGE plpgsql;

--Example use:
SELECT * FROM accBalance(19, 220);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Queries

--Query1: Get the customers having a current account with a balance of more than $1000:

SELECT CONCAT(cust_fname, ' ', cust_lname) AS "Customer Name", balance
FROM BankCustomer NATURAL JOIN customer_accounts
NATURAL JOIN Account
WHERE balance > 1000 AND type = 'current account';

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Queries using Aggregate Functions

--Query2: Get the average transacted amount by customer:

SELECT cust_id, AVG(amount)
FROM Transaction
GROUP BY cust_id;

--Query3: getting the sum of balances in every branch

SELECT branch_id, SUM(balance) AS "total balances in branch" FROM account
GROUP BY branch_id
ORDER BY branch_id;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

