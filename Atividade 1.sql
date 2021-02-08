-- CREATE DATABASE db_commerce;
use db_commerce;

-- Exercício A
CREATE TABLE tb_supplier(
	cdSupplier int primary key identity,
	nmSupplier varchar(30) not null,
	nrPhone varchar(15) not null);

create table tb_costumer(
	cdCostumer int primary key identity,
	nmCostumer varchar(30) not null,
	nrPhone varchar(15),
	dsAddress varchar(50));

create table tb_request (
	cdRequest int primary key identity,
	dtRequest date not null,
	cdCostumer int not null,
	dtDellivery date not null,
	vlTotal money not null
);

create table tb_productRequest(
	cdRequest int not null,
	cdProduct int not null,
	qtAmount int not null,
	vlUnitary money not null
	primary key(cdRequest, cdProduct)
);

create table tb_product(
	cdProduct int primary key identity,
	nmProduct varchar(30) not null,
	cdSupplier int not null,
	vlPrice money not null,
	qtStock int not null);

-- Exercício B
alter table tb_request
add constraint FK_costumer
foreign key (cdCostumer) references tb_costumer(cdCostumer);

alter table tb_productRequest
add constraint FK_product_request
foreign key (cdRequest) references tb_request(cdRequest);

alter table tb_productRequest
add constraint FK_product
foreign key (cdProduct) references tb_product(cdProduct);

alter table tb_product
add constraint FK_supplier
foreign key (cdSupplier) references tb_supplier(cdSupplier);

-- Exercício C
create index inSupplier on tb_product(cdSupplier);

-- Exercicio E
create index inCostumer on tb_request(cdCostumer);

-- Exercicio F
alter table tb_supplier
add dsAddress varchar(50) null;

--Exercicio G
insert into tb_costumer(nmCostumer, nrPhone, dsAddress)
values('Fabiano', '99879375', 'Rua: Tijucas,110,Centro,Joinville-SC');

-- Exercicio h
insert into tb_request(dtRequest, cdCostumer, dtDellivery,vltotal)
values ('2008-01-31', 1, '2008-02-05', 54.00);

--Exercicio I
update tb_costumer set nrPhone = '99012567' where cdCostumer = 1;

-- Exercicio J
go 
alter table tb_request
nocheck constraint FK_costumer
delete from tb_costumer where cdCostumer = 1
go

delete from tb_request where cdRequest = 4;


-- Exercicio K
go
alter table tb_productRequest
nocheck constraint FK_product
drop table tb_productRequest;

alter table tb_product
nocheck constraint FK_supplier
drop table tb_product;

alter table tb_request
nocheck constraint FK_costumer
drop table tb_request;

drop table tb_costumer;
drop table tb_supplier;
go