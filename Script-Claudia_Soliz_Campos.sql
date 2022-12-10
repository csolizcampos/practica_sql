create schema claudia_soliz_campos authorization buirfrfe;

--tabla CURRENCY
create table claudia_soliz_campos.currency (
	id_currency varchar(10) not null, --PK
	name_currency varchar(50) not null
);

alter table claudia_soliz_campos.currency 
add constraint currency_PK primary key (id_currency);

--Valores
insert into claudia_soliz_campos.currency (id_currency, name_currency) values('EUR', 'Euro');
insert into claudia_soliz_campos.currency (id_currency, name_currency) values('USD', 'US Dolar');
insert into claudia_soliz_campos.currency (id_currency, name_currency) values('JPY', 'Japanese Yen');

--tabla CORPORATE_GROUP
create table claudia_soliz_campos.corporate_group (
	id_group varchar(10) not null, --PK
	name_group varchar(50) not null
);

alter table claudia_soliz_campos.corporate_group
add constraint corporate_group_PK primary key (id_group);

--Valores
insert into claudia_soliz_campos.corporate_group  (id_group, name_group) values('0001CG', 'Grupo Volkswagen');
insert into claudia_soliz_campos.corporate_group  (id_group, name_group) values('0002CG', 'Alianza Renault - Nissan - Mitsubishi');
insert into claudia_soliz_campos.corporate_group  (id_group, name_group) values('0003CG', 'Grupo Stellantis');
insert into claudia_soliz_campos.corporate_group  (id_group, name_group) values('0004CG', 'Grupo BMW');
insert into claudia_soliz_campos.corporate_group  (id_group, name_group) values('0005CG', 'Grupo General Motors');
insert into claudia_soliz_campos.corporate_group  (id_group, name_group) values('0006CG', 'Toyota Motor Corporation');

--tabla BRAND_GROUP
create table claudia_soliz_campos.brand_group (
	id_brand varchar(10) not null, --PK
	id_group varchar(10) not null, --PK, FK
	name_brand varchar(250) not null
);

alter table claudia_soliz_campos.brand_group
add constraint brand_group_PK primary key (id_brand, id_group);

alter table claudia_soliz_campos.brand_group
add constraint brand_group_FK foreign key (id_group)
references claudia_soliz_campos.corporate_group (id_group);

--Valores
insert into claudia_soliz_campos.brand_group  (id_brand, id_group, name_brand) values('0101BR', '0001CG' ,'Audi');
insert  into claudia_soliz_campos.brand_group  (id_brand, id_group, name_brand) values('0102BR', '0002CG' ,'Nissan');
insert into claudia_soliz_campos.brand_group  (id_brand, id_group, name_brand) values('0103BR', '0003CG' ,'Fiat');
insert into  claudia_soliz_campos.brand_group  (id_brand, id_group, name_brand) values('0104BR', '0004CG' ,'BMW');
insert into claudia_soliz_campos.brand_group  (id_brand, id_group, name_brand) values('0105BR', '0005CG' ,'Chevrolet');
insert into claudia_soliz_campos.brand_group  (id_brand, id_group, name_brand) values('0106BR', '0006CG' ,'Toyota');
insert into claudia_soliz_campos.brand_group  (id_brand, id_group, name_brand) values('0201BR', '0001CG' ,'Seat');
insert  into claudia_soliz_campos.brand_group  (id_brand, id_group, name_brand) values('0202BR', '0002CG' ,'Renault');
insert into claudia_soliz_campos.brand_group  (id_brand, id_group, name_brand) values('0203BR', '0003CG' ,'Opel');
insert into claudia_soliz_campos.brand_group  (id_brand, id_group, name_brand) values('0303BR', '0003CG' ,'Citroen');
insert into claudia_soliz_campos.brand_group  (id_brand, id_group, name_brand) values('0302BR', '0002CG' ,'Dacia');
insert into claudia_soliz_campos.brand_group  (id_brand, id_group, name_brand) values('0206BR', '0006CG' ,'Lexus');
insert into claudia_soliz_campos.brand_group  (id_brand, id_group, name_brand) values('0301BR', '0001CG' ,'Skoda');

--tabla INSURANCE
create table claudia_soliz_campos.insurance(
	id_insurance varchar(10) not null, --PK
	insurance_company varchar(250) not null
);

alter table claudia_soliz_campos.insurance
add constraint insurance_PK primary key (id_insurance);

--Valores
insert into claudia_soliz_campos.insurance (id_insurance, insurance_company) values ('INS0001','Mapfre S.A.');
insert into claudia_soliz_campos.insurance (id_insurance, insurance_company) values ('INS0002','Línea Directa Aseguradora S.A.');
insert  into claudia_soliz_campos.insurance (id_insurance, insurance_company) values ('INS0003','AXA Seguros Generales S.A.');
insert into claudia_soliz_campos.insurance (id_insurance, insurance_company) values ('INS0004','Mutua Madrileña Automovilistica S.S.');
insert into claudia_soliz_campos.insurance (id_insurance, insurance_company) values ('INS0005','Zurich Insurance PLC');
insert into claudia_soliz_campos.insurance (id_insurance, insurance_company) values ('INS0006','Allianz AWP P&C S.A.');
insert into claudia_soliz_campos.insurance (id_insurance, insurance_company) values ('INS0007','Seguros Catalana Occidente S.A.U.');
insert into claudia_soliz_campos.insurance (id_insurance, insurance_company) values ('INS0008','Liberty Seguros S.A.');

--tabla POLICY
create table claudia_soliz_campos.policy_vh (
	num_policy varchar(50) not null, --PK
	id_insurance varchar(10) not null, --FK
	init_date date not null,
	renewal_date date not null,
	price smallint not null,
	id_currency varchar(10) not null, --FK
	payment_date date not null,
	commentario varchar(250) null
); 

alter table claudia_soliz_campos.policy_vh 
add constraint policy_vh_PK primary key (num_policy);

alter table  claudia_soliz_campos.policy_vh 
add constraint policy_vh_FK1 foreign key (id_insurance)
references claudia_soliz_campos.insurance (id_insurance);

alter table  claudia_soliz_campos.policy_vh 
add constraint policy_vh_FK2 foreign key (id_currency)
references claudia_soliz_campos.currency (id_currency);

--Valores
insert into claudia_soliz_campos.policy_vh (num_policy, id_insurance, init_date, renewal_date, price,id_currency,payment_date)
values('ZET9543876','INS0003','2022/05/25','2024/05/25',2122,'EUR','2019/05/25');
insert into claudia_soliz_campos.policy_vh (num_policy, id_insurance, init_date, renewal_date, price,id_currency,payment_date)
values('8356AAA','INS0008','2008/08/31','2023/08/31',1071,'EUR','2022/08/31');
insert into claudia_soliz_campos.policy_vh (num_policy, id_insurance, init_date, renewal_date, price,id_currency,payment_date)
values('7880897','INS0007','2013/05/02','2023/05/05',1513,'EUR','2019/05/05');
insert into claudia_soliz_campos.policy_vh (num_policy, id_insurance, init_date, renewal_date, price,id_currency,payment_date)
values('6735AAA','INS0008','2018/09/29','2024/09/29',880,'EUR','2020/09/29');
insert into claudia_soliz_campos.policy_vh (num_policy, id_insurance, init_date, renewal_date, price,id_currency,payment_date)
values('ZET3420080','INS0003','2011/10/24','2024/10/24',675,'EUR','2021/10/24');
insert into claudia_soliz_campos.policy_vh (num_policy, id_insurance, init_date, renewal_date, price,id_currency,payment_date)
values('47789ZG05','INS0003','2017/01/02','2025/01/02',1190,'EUR','2022/01/02');
insert into claudia_soliz_campos.policy_vh (num_policy, id_insurance, init_date, renewal_date, price,id_currency,payment_date)
values('5897724A','INS0006','2014/12/30','2025/12/30',1083,'EUR','2021/01/02');
insert into claudia_soliz_campos.policy_vh (num_policy, id_insurance, init_date, renewal_date, price,id_currency,payment_date)
values('7140519','INS0007','2018/10/04','2023/10/04',1224,'EUR','2019/10/04');
insert into  claudia_soliz_campos.policy_vh (num_policy, id_insurance, init_date, renewal_date, price,id_currency,payment_date)
values('9955107','INS0007','2019/08/13','2024/08/13',967,'EUR','2022/08/13');
insert into claudia_soliz_campos.policy_vh (num_policy, id_insurance, init_date, renewal_date, price,id_currency,payment_date)
values('ABC92723','INS0001','2016/10/10','2024/10/10',1091,'EUR','2020/10/10');
insert into claudia_soliz_campos.policy_vh (num_policy, id_insurance, init_date, renewal_date, price,id_currency,payment_date)
values('0007281799','INS0002','2005/06/03','2024/01/27',902,'EUR','2021/01/27');
insert into claudia_soliz_campos.policy_vh (num_policy, id_insurance, init_date, renewal_date, price,id_currency,payment_date)
values('ABC89132','INS0001','2014/04/02','2024/04/02',843,'EUR','2019/04/02');
insert into claudia_soliz_campos.policy_vh (num_policy, id_insurance, init_date, renewal_date, price,id_currency,payment_date)
values('3684AAA','INS0008','2017/03/30','2025/03/30',2236,'EUR','2019/03/30');
insert into claudia_soliz_campos.policy_vh (num_policy, id_insurance, init_date, renewal_date, price,id_currency,payment_date)
values('0006517331','INS0002','2012/12/08','2023/12/08',1119,'EUR','2021/12/08');
insert into claudia_soliz_campos.policy_vh (num_policy, id_insurance, init_date, renewal_date, price,id_currency,payment_date)
values('ERT990PL700','INS0005','2022/02/14','2024/02/14',505,'EUR','2022/02/14');
insert into claudia_soliz_campos.policy_vh (num_policy, id_insurance, init_date, renewal_date, price,id_currency,payment_date)
values('7594585A','INS0006','2019/05/05','2025/05/05',850,'EUR','2020/05/05');
insert into claudia_soliz_campos.policy_vh (num_policy, id_insurance, init_date, renewal_date, price,id_currency,payment_date)
values('6772071','INS0007','2018/11/05','2024/11/05',1337,'EUR','2022/03/10');
insert into claudia_soliz_campos.policy_vh (num_policy, id_insurance, init_date, renewal_date, price,id_currency,payment_date)
values('ZET1384312','INS0003','2012/02/07','2025/02/07',988,'EUR','2020/05/12');

--table VEHICLES
create table claudia_soliz_campos.vehicles(
	id_vehicle varchar(10) not null, --PK 
	num_plate varchar(10) not null, 
	model varchar(100) not null,
	color varchar(10) not null,
	id_brand varchar(10) not null, --FK
	id_group varchar(10) not null, --FK
	kilometers int not null,
	id_insurance varchar(10) not null, --FK
	num_policy varchar(50) not null,
	price int not null,
	id_currency varchar(10) not null, --FK
	comentario varchar(250) null
);

alter  table claudia_soliz_campos.vehicles 
add constraint vehicles_PK primary key (id_vehicle);

alter table claudia_soliz_campos.vehicles  
add constraint vehicle_FK1 foreign key (id_brand, id_group)
references claudia_soliz_campos.brand_group (id_brand, id_group);

alter table claudia_soliz_campos.vehicles 
add constraint vehicle_FK2 foreign key (id_insurance)
references claudia_soliz_campos.insurance (id_insurance);

alter table claudia_soliz_campos.vehicles  
add constraint vehicle_FK3 foreign key (id_currency)
references claudia_soliz_campos.currency (id_currency);

--Valores
insert into claudia_soliz_campos.vehicles (id_vehicle,num_plate,model,color,id_brand,id_group,kilometers,id_insurance,num_policy,price,id_currency)
values('0001V','2245PWL','Audi A5 Sportback','Black','0101BR','0001CG',375500,'INS0007','ZET9543876',39683,'EUR');
insert into claudia_soliz_campos.vehicles (id_vehicle,num_plate,model,color,id_brand,id_group,kilometers,id_insurance,num_policy,price,id_currency)
values('0002V','5169MTI','Nissan Qashqai','White','0102BR','0002CG',162450,'INS0001','8356AAA',49622,'EUR');
insert into claudia_soliz_campos.vehicles (id_vehicle,num_plate,model,color,id_brand,id_group,kilometers,id_insurance,num_policy,price,id_currency)
values('0003V','5811JFL','FIAT 500','White','0103BR','0003CG',85000,'INS0007','7880897',23107,'EUR');
insert into claudia_soliz_campos.vehicles (id_vehicle,num_plate,model,color,id_brand,id_group,kilometers,id_insurance,num_policy,price,id_currency)
values('0004V','9567HJAL','DOBLO HIBRIDO','White','0103BR','0003CG',145000,'INS0007','6735AAA',33930,'USD');
insert into claudia_soliz_campos.vehicles (id_vehicle,num_plate,model,color,id_brand,id_group,kilometers,id_insurance,num_policy,price,id_currency)
values('0005V','2037VLO','Townstar Combi','White','0102BR','0002CG',138500,'INS0007','ZET3420080',1126831,'JPY');
insert into claudia_soliz_campos.vehicles (id_vehicle,num_plate,model,color,id_brand,id_group,kilometers,id_insurance,num_policy,price,id_currency)
values('0006V','5467FWH','Combo Cargo','White','0203BR','0003CG',55000,'INS0003','47789ZG05',48181,'EUR');
insert into claudia_soliz_campos.vehicles (id_vehicle,num_plate,model,color,id_brand,id_group,kilometers,id_insurance,num_policy,price,id_currency)
values('0007V','4711VAP','BMW Serie 2 Gran Coupe','Black','0104BR','0004CG',74000,'INS0003','5897724A',21123,'USD');
insert into claudia_soliz_campos.vehicles (id_vehicle,num_plate,model,color,id_brand,id_group,kilometers,id_insurance,num_policy,price,id_currency)
values('0008V','4277QJQ','Seat Ibiza','Blue','0201BR','0001CG',240200,'INS0006','7140519',54843,'EUR');
insert into claudia_soliz_campos.vehicles (id_vehicle,num_plate,model,color,id_brand,id_group,kilometers,id_insurance,num_policy,price,id_currency)
values('0009V','7110CRE','TRAX','White','0105BR','0005CG',320500,'INS0003','9955107',17822,'EUR');
insert into claudia_soliz_campos.vehicles (id_vehicle,num_plate,model,color,id_brand,id_group,kilometers,id_insurance,num_policy,price,id_currency)
values('0010V','2416YSP','Camry','Black','0106BR','0006CG',160350,'INS0001','ABC92723',44357,'EUR');
insert into claudia_soliz_campos.vehicles (id_vehicle,num_plate,model,color,id_brand,id_group,kilometers,id_insurance,num_policy,price,id_currency)
values('0011V','7252JFV','Fabia Monte Carlo','White','0301BR','0001CG',64500,'INS0008','0007281799',10690,'USD');
insert into claudia_soliz_campos.vehicles (id_vehicle,num_plate,model,color,id_brand,id_group,kilometers,id_insurance,num_policy,price,id_currency)
values('0012V','7961HNH','CLIO','Blue','0202BR','0002CG',160500,'INS0006','ABC89132',23078,'USD');
insert into claudia_soliz_campos.vehicles (id_vehicle,num_plate,model,color,id_brand,id_group,kilometers,id_insurance,num_policy,price,id_currency)
values('0013V','5866NYC','Berlingo','White','0303BR','0003CG',280000,'INS0008','3684AAA',35719,'EUR');
insert into claudia_soliz_campos.vehicles (id_vehicle,num_plate,model,color,id_brand,id_group,kilometers,id_insurance,num_policy,price,id_currency)
values('0014V','3781RMY','Sandero','White','0302BR','0002CG',145500,'INS0008','0006517331',13098,'EUR');
insert into claudia_soliz_campos.vehicles (id_vehicle,num_plate,model,color,id_brand,id_group,kilometers,id_insurance,num_policy,price,id_currency)
values('0015V','2909SBK','FIAT 500','Blue','0103BR','0003CG',30500,'INS0005','ERT990PL700',47702,'EUR');
insert into claudia_soliz_campos.vehicles (id_vehicle,num_plate,model,color,id_brand,id_group,kilometers,id_insurance,num_policy,price,id_currency)
values('0016V','2535VTP','Lexus UX','Black','0206BR','0006CG',85450,'INS0004','7594585A',21097,'USD');
insert into claudia_soliz_campos.vehicles (id_vehicle,num_plate,model,color,id_brand,id_group,kilometers,id_insurance,num_policy,price,id_currency)
values('0017V','2918HJG','Land Cruiser 150','White','0106BR','0006CG',125000,'INS0002','6772071',1338351,'JPY');
insert into claudia_soliz_campos.vehicles (id_vehicle,num_plate,model,color,id_brand,id_group,kilometers,id_insurance,num_policy,price,id_currency)
values('0018V','2290AGT','Opel Corsa','Blue','0203BR','0003CG',97500,'INS0002','ZET1384312',42111,'EUR');

--tabla INSPECTIONS
create table claudia_soliz_campos.inspections(
	id_inspection varchar(10) not null, --PK
	id_vehicle varchar(10) not null, --PK, FK
	kilometers int not null,
	date_inspection date not null,
	price int,
	id_currency varchar(10) not null,
	comentario varchar(250) null
);

alter table claudia_soliz_campos.inspections
add constraint inspections_PK primary key (id_inspection, id_vehicle);

alter table claudia_soliz_campos.inspections 
add constraint inspections_FK foreign key (id_vehicle)
references  claudia_soliz_campos.vehicles (id_vehicle);

alter table claudia_soliz_campos.inspections 
add constraint inspections_FK2 foreign key (id_currency)
references  claudia_soliz_campos.currency (id_currency);

--Valores
insert into claudia_soliz_campos.inspections (id_inspection,id_vehicle,kilometers,date_inspection,price,id_currency)
values('0001ITV','0001V',175000,'2020/06/15',166,'EUR');
insert into claudia_soliz_campos.inspections (id_inspection,id_vehicle,kilometers,date_inspection,price,id_currency)
values('0002ITV','0002V',54000,'2018/12/08',76,'EUR');
insert into claudia_soliz_campos.inspections (id_inspection,id_vehicle,kilometers,date_inspection,price,id_currency)
values('0003ITV','0018V',40000,'2020/06/08',169,'EUR');
insert into claudia_soliz_campos.inspections (id_inspection,id_vehicle,kilometers,date_inspection,price,id_currency)
values('0004ITV','0006V',50000,'2022/06/04',160,'EUR');
insert into claudia_soliz_campos.inspections (id_inspection,id_vehicle,kilometers,date_inspection,price,id_currency)
values('0005ITV','0013V',70000,'2017/12/11',192,'EUR');
insert into claudia_soliz_campos.inspections (id_inspection,id_vehicle,kilometers,date_inspection,price,id_currency)
values('0006ITV','0013V',140000,'2020/04/04',73,'EUR');
insert into claudia_soliz_campos.inspections (id_inspection,id_vehicle,kilometers,date_inspection,price,id_currency)
values('0007ITV','0002V',115000,'2022/11/21',78,'EUR');
insert into claudia_soliz_campos.inspections (id_inspection,id_vehicle,kilometers,date_inspection,price,id_currency)
values('0008ITV','0017V',55000,'2021/05/17',67,'EUR');
insert into claudia_soliz_campos.inspections (id_inspection,id_vehicle,kilometers,date_inspection,price,id_currency)
values('0009ITV','0008V',75500,'2017/02/14',87,'EUR');
insert into claudia_soliz_campos.inspections (id_inspection,id_vehicle,kilometers,date_inspection,price,id_currency)
values('0010ITV','0011V',55000,'2021/03/13',128,'EUR');
insert into claudia_soliz_campos.inspections (id_inspection,id_vehicle,kilometers,date_inspection,price,id_currency)
values('0011ITV','0005V',45000,'2017/11/09',108,'EUR');
insert into claudia_soliz_campos.inspections (id_inspection,id_vehicle,kilometers,date_inspection,price,id_currency)
values('0012ITV','0014V',50000,'2019/10/14',139,'EUR');
insert into claudia_soliz_campos.inspections (id_inspection,id_vehicle,kilometers,date_inspection,price,id_currency)
values('0013ITV','0010V',100000,'2019/05/17',104,'EUR');
insert into claudia_soliz_campos.inspections (id_inspection,id_vehicle,kilometers,date_inspection,price,id_currency)
values('0014ITV','0018V',90000,'2022/12/04',123,'EUR');
insert into claudia_soliz_campos.inspections (id_inspection,id_vehicle,kilometers,date_inspection,price,id_currency)
values('0015ITV','0014V',100000,'2021/11/16',177,'EUR');
insert into claudia_soliz_campos.inspections (id_inspection,id_vehicle,kilometers,date_inspection,price,id_currency)
values('0016ITV','0016V',65000,'2022/01/18',145,'EUR');
insert into claudia_soliz_campos.inspections (id_inspection,id_vehicle,kilometers,date_inspection,price,id_currency)
values('0017ITV','0005V',100000,'2020/07/26',187,'EUR');
insert into claudia_soliz_campos.inspections (id_inspection,id_vehicle,kilometers,date_inspection,price,id_currency)
values('0018ITV','0007V',50000,'2021/10/02',82,'EUR');
insert into claudia_soliz_campos.inspections (id_inspection,id_vehicle,kilometers,date_inspection,price,id_currency)
values('0019ITV','0003V',50000,'2021/06/17',185,'EUR');
insert into claudia_soliz_campos.inspections (id_inspection,id_vehicle,kilometers,date_inspection,price,id_currency)
values('0020ITV','0004V',70500,'2020/05/11',167,'EUR');
insert into claudia_soliz_campos.inspections (id_inspection,id_vehicle,kilometers,date_inspection,price,id_currency)
values('0021ITV','0017V',110000,'2022/11/18',200,'EUR');
insert into claudia_soliz_campos.inspections (id_inspection,id_vehicle,kilometers,date_inspection,price,id_currency)
values('0022ITV','0008V',160000,'2020/06/19',78,'EUR');
insert into claudia_soliz_campos.inspections (id_inspection,id_vehicle,kilometers,date_inspection,price,id_currency)
values('0023ITV','0009V',150000,'2020/08/25',111,'EUR');
insert into claudia_soliz_campos.inspections (id_inspection,id_vehicle,kilometers,date_inspection,price,id_currency)
values('0024ITV','0012V',80000,'2019/12/04',92,'EUR');
insert into claudia_soliz_campos.inspections (id_inspection,id_vehicle,kilometers,date_inspection,price,id_currency)
values('0025ITV','0015V',30000,'2022/09/18',132,'EUR');
insert into claudia_soliz_campos.inspections (id_inspection,id_vehicle,kilometers,date_inspection,price,id_currency)
values('0026ITV','0013V',210000,'2022/10/26',163,'EUR');




