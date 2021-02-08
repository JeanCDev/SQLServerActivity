use treinamento;

-- Exercicio 2-A
select IDFONE, NMCUSTOMER from CUSTOMER where IDFONE like '4%';

-- Exercicio 2-B
select * from CUSTOMER
where IDFONE = null; -- Todos os clientes têm telefone

-- Exercicio 2-C
select IDFONE, NMSUPPLIER from SUPPLIER
where IDFONE not like '(%';

-- Exercicio 2-D
select NMPRODUCT, QTSTOCK, 
VLPRICE - (VLPRICE * 10)/100 as DISCOUNT
from PRODUCT where QTSTOCK > 2000;

-- Exercicio 2-E
select NMPRODUCT, VLPRICE from PRODUCT
where VLPRICE between 10 and 20;

-- Exercicio 2-F
select NMPRODUCT, VLPRICE,
QTSTOCK * VLPRICE as VLTOTAL
from PRODUCT where VLPRICE > 50; -- não tinha produtos por mais de 50 reais

-- Exercicio 2-G
select a.NMPRODUCT, b.NMSUPPLIER, b.IDFONE
from PRODUCT a
inner join SUPPLIER b on a.CDSUPPLIER = b.CDSUPPLIER
where a.VLPRICE > 20 and QTSTOCK > 1500;

-- Exercicio 2-H
select a.NMCUSTOMER, b.DTREQUEST, b.VLTOTAL
from CUSTOMER a
inner join REQUEST b on a.CDCUSTOMER = b.CDCUSTOMER
where b.DTREQUEST between '2003-06-01' and '2003-07-31';

-- Exercicio 2-I
select 
	a.NMCUSTOMER,
	d.NMPRODUCT,
	b.DTREQUEST,
	c.QTAMOUNT,
	c.VLUNITARY,
	c.VLUNITARY * c.QTAMOUNT as TOTALREQUEST
from CUSTOMER a 
inner join REQUEST b on a.CDCUSTOMER = b.CDCUSTOMER
inner join PRODUCTREQUEST c on b.CDREQUEST = c.CDREQUEST
inner join PRODUCT d on c.CDPRODUCT = d.CDPRODUCT
where c.QTAMOUNT > 500; -- Todos os clientes pediram 10 unidades