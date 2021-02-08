-- CREATE DATABASE db_commerce;
use db_commerce;

-- Exercício A
CREATE TABLE tb_supplier(
	cdSupplier int not null,
	nmSupplier varchar(30) not null,
	nrPhone varchar(15) not null);

create table tb_customer(
	cdCustomer int not null,
	nmCustomer varchar(30) not null,
	nrPhone varchar(15),
	dsAddress varchar(50));

create table tb_request (
	cdRequest int not null,
	dtRequest date not null,
	cdCustomer int not null,
	dtDeliver date not null,
	vlTotal money not null
);

create table tb_productRequest(
	cdRequest int not null,
	cdProduct int not null,
	qtAmount int not null,
	vlUnitary money not null
);

create table tb_product(
	cdProduct int not null,
	nmProduct varchar(30) not null,
	cdSupplier int not null,
	vlPrice money not null,
	qtStock int not null);

-- Exercicio B
alter table tb_customer
add constraint PK_customer
primary key (cdCustomer);

alter table tb_product
add constraint PK_product
primary key (cdProduct);

alter table tb_productRequest
add constraint PK_product_request
primary key (cdProduct, cdRequest);

alter table tb_request
add constraint PK_request
primary key (cdRequest);

alter table tb_supplier
add constraint PK_supplier
primary key (cdSupplier);

-- Exercício C
alter table tb_request
add constraint FK_customer
foreign key (cdCustomer) references tb_customer(cdCustomer);

alter table tb_productRequest
add constraint FK_product_request
foreign key (cdRequest) references tb_request(cdRequest);

alter table tb_productRequest
add constraint FK_product
foreign key (cdProduct) references tb_product(cdProduct);

alter table tb_product
add constraint FK_supplier
foreign key (cdSupplier) references tb_supplier(cdSupplier);

-- Exercício D
create index inSupplier on tb_product(cdSupplier);

-- Exercicio E
create index inCostumer on tb_request(cdCustomer);

-- Exercicio F
alter table tb_supplier
add dsAddress varchar(50) null;

--Exercicio G
insert into tb_customer(cdCustomer, nmCustomer, nrPhone, dsAddress)
values(1,'Fabiano', '99879375', 'Rua: Tijucas,110,Centro,Joinville-SC');

-- Exercicio h
insert into tb_request(cdRequest, dtRequest, cdCustomer, dtDeliver,vltotal)
values (1, '2008-01-31', 1, '2008-02-05', 54.00);

--Exercicio I
update tb_customer set nrPhone = '99012567' where cdCustomer = 1;

-- Exercicio J
go 
alter table tb_request
nocheck constraint FK_customer
delete from tb_customer where cdCustomer = 1
go

delete from tb_request where cdRequest = 1;

-- Exercicio K
go
alter table tb_productRequest
nocheck constraint FK_product
drop table tb_productRequest;

alter table tb_product
nocheck constraint FK_supplier
drop table tb_product;

alter table tb_request
nocheck constraint FK_customer
drop table tb_request;

drop table tb_customer;
drop table tb_supplier;
go