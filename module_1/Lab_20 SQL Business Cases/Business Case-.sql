use business_Case;

-- 1 Table Cars
create table business_Case.Cars(ID int, VIN Varchar(225) primary key, Manufacturer varchar(225), Model varchar(255), years year , color varchar(225));
select * from business_Case.Cars;

-- 1.2 
INSERT INTO business_Case.Cars (ID,VIN, Manufacturer, Model, years, Color)
VALUES ('0', '3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', '2019', 'Blue');
select * from business_Case.Cars;


-- 2 Table Customers
create table business_Case.Customers (ID int, customer_id varchar(225) primary key , Name varchar(225), phone_n varchar(255), email varchar(225), city varchar(225), state varchar(225), country varchar(225), zip int);

-- 2.1 
INSERT INTO business_Case.Customers(ID, customer_id, Name, phone_n, email, city, state, country, zip)
VALUES ('0',	'10001',	'Pablo Picasso',	'+34 636 17 63 82',	'-', 'Madrid',	'Madrid',	'Spain',	'28045');
select * from business_Case.Customers;


-- 3 Table Sales person 
create table business_Case.Sales_p (ID int, staff_id varchar(225) , Name varchar(225), store varchar(255));
alter table business_Case.Sales_p add primary key (staff_id);

-- 3.1
INSERT INTO business_Case.Sales_p (ID, staff_id, Name, Store)
VALUES ('0',	'00001',	'Petey Cruiser',	'Madrid');

-- 4 Table Invoice 
create table business_Case.invoice (
ID int, 
Invoice_n int primary key, 
dates date, 
VIN varchar(225),
customer_id varchar(225),
staff_id varchar(225),
constraint fk_invoice_vin FOREIGN KEY(VIN) REFERENCES business_Case.Cars(VIN) on update cascade,
constraint fk_invoice_customer_id FOREIGN KEY(customer_id) REFERENCES business_Case.Customers(customer_id) on update cascade,
constraint fk_invoice_staff_id FOREIGN KEY(staff_id) REFERENCES business_Case.Sales_p(staff_id)
)
select * from business_Case.Cars;
-- 4.1 add rows 
INSERT INTO business_Case.invoice(ID, Invoice_n, dates, VIN, customer_id, staff_id)
VALUES ('0',	'852399038',	'2018-08-22', 
(SELECT VIN from business_Case.Cars  WHERE VIN='3K096I98581DHSNUP'), 
(SELECT customer_id from business_Case.Customers WHERE customer_id='10001'), 
(SELECT staff_id from business_Case.Sales_p WHERE staff_id='00001'));