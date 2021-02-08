-- Exercício A
select * from(
	select 
		a.NMPRODUCT,
		b.NMSUPPLIER,
		a.VLPRICE,
		a.VLPRICE - (a.VLPRICE * 10)/100 as DISCOUNT10,
		a.VLPRICE - (a.VLPRICE * 20)/100 as DISCOUNT20,
		a.VLPRICE - (a.VLPRICE * 30)/100 as DISCOUNT30
	from PRODUCT a
	inner join SUPPLIER b on a.CDSUPPLIER = b.CDSUPPLIER
) as RESULT 
where RESULT.DISCOUNT10 > 15 order by RESULT.VLPRICE, RESULT.NMPRODUCT;

-- Exercício B
select * 
from (select 
	a.NMPRODUCT,
	b.NMSUPPLIER,
	a.VLPRICE,
	a.VLPRICE * a.QTSTOCK as VLTOTAL,
	a.VLPRICE * (a.QTSTOCK * 2) as VLDOUBLE
from PRODUCT a
inner join SUPPLIER b on a.CDSUPPLIER = b.CDSUPPLIER
) as result
where result.VLDOUBLE > 12000
order by result.NMSUPPLIER, result.NMPRODUCT;

-- Exercício C
select * from CUSTOMER where IDFONE is not null and NMCUSTOMER like 'J%';

-- Exercício D
select 
	a.NMPRODUCT, a.VLPRICE,
	b.NMSUPPLIER
from PRODUCT a
inner join SUPPLIER b on a.CDSUPPLIER = b.CDSUPPLIER
where b.NMSUPPLIER like '%ica%'
order by b.NMSUPPLIER, a.VLPRICE;

-- Exercício E
select 
	a.NMSUPPLIER, a.IDFONE, 
	b.NMPRODUCT, b.VLPRICE,
	b.VLPRICE * b.QTSTOCK as VLTOTAL
from SUPPLIER a
inner join PRODUCT b on a.CDSUPPLIER = b.CDSUPPLIER
where b.NMPRODUCT like 'S%' and b.VLPRICE > 50 -- Não há produtos por mais de 50 com a Letra 'S'
order by a.NMSUPPLIER, b.VLPRICE;

-- Exercício F
select 
	a.NMCUSTOMER,
	d.NMPRODUCT,
	b.DTREQUEST, b.DTDELIVER,
	c.QTAMOUNT, c.VLUNITARY, c.VLUNITARY * c.QTAMOUNT as VLTOTAL
from CUSTOMER a
inner join REQUEST b on a.CDCUSTOMER = b.CDCUSTOMER
inner join PRODUCTREQUEST c on c.CDREQUEST = b.CDREQUEST
inner join PRODUCT d on c.CDPRODUCT = d.CDPRODUCT
inner join SUPPLIER e on d.CDSUPPLIER = e.CDSUPPLIER
where c.QTAMOUNT < 600 and MONTH(b.DTREQUEST) = 08
and d.NMPRODUCT like 'M%';

-- Exercício G
select 
	a.NMCUSTOMER,
	d.NMPRODUCT,
	e.NMSUPPLIER,
	b.DTDELIVER, b.VLTOTAL
from CUSTOMER a
inner join REQUEST b on a.CDCUSTOMER = b.CDCUSTOMER
inner join PRODUCTREQUEST c on b.CDREQUEST = c.CDREQUEST
inner join PRODUCT d on c.CDPRODUCT = d.CDPRODUCT
inner join SUPPLIER e on d.CDSUPPLIER = e.CDSUPPLIER
where e.IDFONE like '(011)%' and d.VLPRICE > 20;
