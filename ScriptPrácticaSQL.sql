create schema keepcodingcars authorization gppjgzjf;

-- Table CompanyGroup
create table keepcodingcars.company_group(
	id_company varchar(20) not null, --pk 
	name varchar(200) not null
);
-- adding PK
alter table keepcodingcars.company_group
add constraint id_company_PK primary key (id_company);


-- Table Brand
create table keepcodingcars.brand(
	id_brand varchar(20) not null, --pk
	id_company varchar(20) not null, --fk  
	name varchar(200) not null
);
-- adding PK
alter table keepcodingcars.brand
add constraint id_brand_PK primary key (id_brand);
-- adding FK
alter table keepcodingcars.brand
add constraint company_brand_FK foreign key (id_company)
references keepcodingcars.company_group(id_company);


-- Table Model
create table keepcodingcars.model(
	id_model varchar(20) not null, --pk
	id_brand varchar(20) not null, --fk  
	name varchar(200) not null
);
-- adding PK
alter table keepcodingcars.model
add constraint id_model_PK primary key (id_model);
-- adding FK
alter table keepcodingcars.model
add constraint brand_model_FK foreign key (id_brand)
references keepcodingcars.brand(id_brand);


-- Table Color
create table keepcodingcars.color(
	id_color varchar(20) not null, --pk
	name varchar(200) not null
);
-- adding PK
alter table keepcodingcars.color
add constraint id_color_PK primary key (id_color);


-- Table Currency
create table keepcodingcars.currency(
	id_currency varchar(20) not null, --pk
	name varchar(200) not null
);
-- adding PK
alter table keepcodingcars.currency
add constraint id_currency_PK primary key (id_currency);


-- Table InsuranceCompany
create table keepcodingcars.insurance_company(
	id_insurance_company varchar(20) not null, --pk
	name varchar(200) not null
);
-- adding PK
alter table keepcodingcars.insurance_company
add constraint id_insurance_company_PK primary key (id_insurance_company);


-- Table Policy
create table keepcodingcars.insurance_policy(
	id_policy varchar(20) not null, --pk
	policy_number varchar(20) not null, 
	id_insurance_company varchar(20) not null --fk 
);
-- adding PK
alter table keepcodingcars.insurance_policy
add constraint insurance_policy_PK primary key (id_policy);

-- adding FKs
alter table keepcodingcars.insurance_policy
add constraint car_policy_FK foreign key (id_insurance_company)
references keepcodingcars.insurance_company(id_insurance_company);


-- Table Car
create table keepcodingcars.car(
	id_car varchar(20) not null, --pk
	plate_number varchar(20) not null, 
	id_model varchar(20) not null, --fk  
	id_color varchar(20) not null, --fk  
	kms varchar(20) not null,
	id_policy varchar(20) not null, --fk  
	purchase_date date not null, 
	termination_date date null
);
-- adding PK
alter table keepcodingcars.car
add constraint id_car_PK primary key (id_car);

-- adding FKs
alter table keepcodingcars.car
add constraint model_car_FK foreign key (id_model)
references keepcodingcars.model(id_model);

alter table keepcodingcars.car
add constraint color_car_FK foreign key (id_color)
references keepcodingcars.color(id_Color);

alter table keepcodingcars.car
add constraint id_policy_car_FK foreign key (id_policy)
references keepcodingcars.insurance_policy(id_policy);


-- Table CarService
create table keepcodingcars.car_service(
	id_car_service varchar(20) not null, --pk
	id_car varchar(20) not null, -- fk
	kms varchar(20) not null,
	service_date date not null, 
	amount numeric(12,5) not null, 
	id_currency varchar(20) not null -- fk
);
-- adding PK
alter table keepcodingcars.car_service
add constraint id_car_service_PK primary key (id_car_service);

-- adding FKs
alter table keepcodingcars.car_service
add constraint car_carService_FK foreign key (id_car)
references keepcodingcars.car(id_car);

alter table keepcodingcars.car_service
add constraint currency_car_FK foreign key (id_currency)
references keepcodingcars.currency(id_currency);

-- Rellenamos las Tablas con Datos

insert into keepcodingcars.company_group 
(id_company, "name")
values('001', 'Grupo Stellantis');

insert into keepcodingcars.company_group 
(id_company, "name")
values('002', 'Grupo Volkswagen');

insert into keepcodingcars.company_group 
(id_company, "name")
values('003', 'Grupo BMW');

insert into keepcodingcars.company_group 
(id_company, "name")
values('004', 'Geely');

insert into keepcodingcars.company_group 
(id_company, "name")
values('005', 'Toyota Motor Corporation');

insert into keepcodingcars.brand 
(id_brand, id_company , "name")
values('001', '005','Toyota');

insert into keepcodingcars.brand 
(id_brand, id_company , "name")
values('002', '005','Lexus');

insert into keepcodingcars.brand 
(id_brand, id_company , "name")
values('003', '001','Peugeot');

insert into keepcodingcars.brand 
(id_brand, id_company , "name")
values('004', '001','Fiat');

insert into keepcodingcars.brand 
(id_brand, id_company , "name")
values('005', '002','Volkswagen');

insert into keepcodingcars.brand 
(id_brand, id_company , "name")
values('006', '002','Audi');

insert into keepcodingcars.brand 
(id_brand, id_company , "name")
values('007', '003','BMW');

insert into keepcodingcars.brand 
(id_brand, id_company , "name")
values('008', '003','Mini');

insert into keepcodingcars.brand 
(id_brand, id_company , "name")
values('009', '004','Volvo');

insert into keepcodingcars.brand 
(id_brand, id_company , "name")
values('010', '004','Mercedes-Benz');

insert into keepcodingcars.model 
(id_model, id_brand , "name")
values('001', '009','V40');

insert into keepcodingcars.model 
(id_model, id_brand , "name")
values('002', '010','GLE Coupe');

insert into keepcodingcars.model 
(id_model, id_brand , "name")
values('003', '010','GLC Coupe');

insert into keepcodingcars.model 
(id_model, id_brand , "name")
values('004', '008','Countryman');

insert into keepcodingcars.model 
(id_model, id_brand , "name")
values('005', '007','X6');

insert into keepcodingcars.model 
(id_model, id_brand , "name")
values('006', '007','X5');

insert into keepcodingcars.model 
(id_model, id_brand , "name")
values('007', '006','A3	Sportback');

insert into keepcodingcars.model 
(id_model, id_brand , "name")
values('008', '006','Q3');

insert into keepcodingcars.model 
(id_model, id_brand , "name")
values('009', '005','Golf');

insert into keepcodingcars.model 
(id_model, id_brand , "name")
values('010', '005','T-Roc');

insert into keepcodingcars.model 
(id_model, id_brand , "name")
values('011', '005','Polo');

insert into keepcodingcars.model 
(id_model, id_brand , "name")
values('012', '004','500');

insert into keepcodingcars.model 
(id_model, id_brand , "name")
values('013', '004','Panda');

insert into keepcodingcars.model 
(id_model, id_brand , "name")
values('014', '003','208');

insert into keepcodingcars.model 
(id_model, id_brand , "name")
values('015', '003','308');

insert into keepcodingcars.model 
(id_model, id_brand , "name")
values('016', '002','UX');

insert into keepcodingcars.model 
(id_model, id_brand , "name")
values('017', '002','NX');

insert into keepcodingcars.model 
(id_model, id_brand , "name")
values('018', '001','Corolla');

insert into keepcodingcars.model 
(id_model, id_brand , "name")
values('019', '001','Yaris');

insert into keepcodingcars.model 
(id_model, id_brand, "name")
values('020', '001','Aygo');

insert into keepcodingcars.color 
(id_color, "name")
values('001', 'White');

insert into keepcodingcars.color 
(id_color, "name")
values('002', 'Black');

insert into keepcodingcars.color 
(id_color, "name")
values('003', 'Red');

insert into keepcodingcars.color 
(id_color, "name")
values('004', 'Gray');

insert into keepcodingcars.color 
(id_color, "name")
values('005', 'Blue');

insert into keepcodingcars.color 
(id_color, "name")
values('006', 'Yellow');

insert into keepcodingcars.currency 
(id_currency, "name")
values('EUR', 'Euro');

insert into keepcodingcars.currency 
(id_currency, "name")
values('USD', 'Dollar');

insert into keepcodingcars.currency 
(id_currency, "name")
values('GBP', 'Pounds');

insert into keepcodingcars.insurance_company 
(id_insurance_company, "name")
values('001', 'Allianz');

insert into keepcodingcars.insurance_company 
(id_insurance_company, "name")
values('002', 'Mapfre');

insert into keepcodingcars.insurance_company 
(id_insurance_company, "name")
values('003', 'Axa');

insert into keepcodingcars.insurance_company 
(id_insurance_company, "name")
values('004', 'Zurich');

insert into keepcodingcars.insurance_company 
(id_insurance_company, "name")
values('005', 'Generali');

--Policy
insert into keepcodingcars.insurance_policy 
(id_policy, policy_number, id_insurance_company)
values('001', 'AZ3838474', '001');
insert into keepcodingcars.insurance_policy 
(id_policy, policy_number, id_insurance_company)
values('002', 'AZ8493736', '001');
insert into keepcodingcars.insurance_policy 
(id_policy, policy_number, id_insurance_company)
values('003', 'AZ6337463', '001');
insert into keepcodingcars.insurance_policy 
(id_policy, policy_number, id_insurance_company)
values('004', '128746648', '002');
insert into keepcodingcars.insurance_policy 
(id_policy, policy_number, id_insurance_company)
values('005', '128373737', '002');
insert into keepcodingcars.insurance_policy 
(id_policy, policy_number, id_insurance_company)
values('006', '128666363', '002');
insert into keepcodingcars.insurance_policy 
(id_policy, policy_number, id_insurance_company)
values('007', 'AZ8445556', '001');
insert into keepcodingcars.insurance_policy 
(id_policy, policy_number, id_insurance_company)
values('008', '000383772', '003');
insert into keepcodingcars.insurance_policy 
(id_policy, policy_number, id_insurance_company)
values('009', '000988332', '003');
insert into keepcodingcars.insurance_policy 
(id_policy, policy_number, id_insurance_company)
values('010', '000322772', '003');
insert into keepcodingcars.insurance_policy 
(id_policy, policy_number, id_insurance_company)
values('011', '990087362', '004');
insert into keepcodingcars.insurance_policy 
(id_policy, policy_number, id_insurance_company)
values('012', 'G8477929444', '005');
insert into keepcodingcars.insurance_policy 
(id_policy, policy_number, id_insurance_company)
values('013', 'G8908883773', '005');


-- Cars
insert into keepcodingcars.car 
(id_car, plate_number, id_model, id_color, kms, id_policy, purchase_date)
values('001', '6677-KJK', '003', '002', 20000, '001', '2021-05-25');

insert into keepcodingcars.car 
(id_car, plate_number, id_model, id_color, kms, id_policy, purchase_date)
values('002', '9385-KYD', '006', '004', 25000, '002', '2021-09-29');

insert into keepcodingcars.car 
(id_car, plate_number, id_model, id_color, kms, id_policy, purchase_date)
values('003', '9675-GYH', '002', '002', 26000, '003', '2020-01-29');

insert into keepcodingcars.car 
(id_car, plate_number, id_model, id_color, kms, id_policy, purchase_date)
values('004', '9988-KHT', '009', '002', 15000, '004', '2021-01-10');

insert into keepcodingcars.car 
(id_car, plate_number, id_model, id_color, kms, id_policy, purchase_date)
values('005', '2583-KHT', '010', '001', 10000, '005', '2021-01-10');

insert into keepcodingcars.car 
(id_car, plate_number, id_model, id_color, kms, id_policy, purchase_date, termination_date)
values('006', '1577-HNT', '008', '003', 80000, '006', '2018-12-15','2022-11-05');

insert into keepcodingcars.car 
(id_car, plate_number, id_model, id_color, kms, id_policy, purchase_date, termination_date)
values('007', '2584-HBB', '010', '001', 120000, '007', '2017-12-20','2022-12-03');

insert into keepcodingcars.car 
(id_car, plate_number, id_model, id_color, kms, id_policy, purchase_date)
values('008', '8703-MHT', '004', '002', 65378, '008', '2022-05-18');

insert into keepcodingcars.car 
(id_car, plate_number, id_model, id_color, kms, id_policy, purchase_date)
values('009', '9982-HSJ', '007', '005', 150000, '009', '2013-05-18');

insert into keepcodingcars.car 
(id_car, plate_number, id_model, id_color, kms, id_policy, purchase_date, termination_date)
values('010', '2584-FRF', '011', '003', 250000, '010', '2010-12-20','2021-04-12');

insert into keepcodingcars.car 
(id_car, plate_number, id_model, id_color, kms, id_policy, purchase_date)
values('011', '9982-LMG', '005', '001', 78000, '011', '2022-02-10');

insert into keepcodingcars.car 
(id_car, plate_number, id_model, id_color, kms, id_policy, purchase_date)
values('012', '9982-MMF', '017', '002', 7000, '012', '2022-09-26');

insert into keepcodingcars.car 
(id_car, plate_number, id_model, id_color, kms, id_policy, purchase_date)
values('013', '1543-MBB', '014', '004', 3800, '013', '2022-04-01');

-- Car Service:
insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('001', '010', 15000, '2012-01-18', 250, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('002', '010', 24000, '2013-01-18', 250, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('003', '010', 35000, '2013-02-02', 350, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('004', '009', 50000, '2014-05-02', 540, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('005', '010', 43000, '2014-07-01', 620, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('006', '010', 50000, '2015-09-10', 350, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('007', '009', 75000, '2015-09-10', 350, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('008', '009', 90000, '2016-11-11', 420, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('009', '010', 70000, '2016-11-11', 432, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('010', '009', 102000, '2018-01-09', 357, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('011', '010', 88000, '2018-01-09', 240, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('012', '007', 30000, '2018-12-19', 232, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('013', '007', 35000, '2019-12-19', 232, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('014', '009', 110000, '2019-12-19', 232, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('015', '010', 96000, '2019-12-19', 232, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('016', '010', 99000, '2020-12-19', 232, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('017', '009', 120000, '2020-12-19', 232, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('018', '007', 44000, '2020-12-19', 232, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('019', '006', 20000, '2019-12-19', 232, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('020', '006', 29000, '2020-12-19', 232, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('021', '003', 29000, '2021-01-19', 232, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('022', '001', 2000, '2021-01-19', 232, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('023', '002', 9000, '2021-01-19', 232, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('024', '004', 3000, '2021-01-19', 232, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('025', '005', 19000, '2021-01-19', 232, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('026', '006', 38000, '2021-12-19', 232, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('027', '003', 49000, '2022-01-19', 232, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('028', '001', 21000, '2022-01-19', 232, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('029', '002', 19000, '2022-01-19', 232, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('030', '004', 13000, '2022-01-19', 232, 'EUR');

insert into keepcodingcars.car_service 
(id_car_service, id_car, kms, service_date, amount, id_currency)
values('031', '005', 29000, '2022-01-19', 232, 'EUR');
