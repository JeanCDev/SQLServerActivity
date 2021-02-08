
-- Exerc�cio A
select distinct
	c.NMPRODUCT
from REQUEST a
inner join PRODUCTREQUEST b on a.CDREQUEST = b.CDREQUEST
inner join PRODUCT c on b.CDPRODUCT= c.CDPRODUCT
group by c.NMPRODUCT;

--Exercicio B
select 
	a.NMPRODUCT,
	sum(b.CDPRODUCT) as QTPRODUCT,
	SUM(b.QTAMOUNT) as QTTOTAL
from PRODUCT a
inner join PRODUCTREQUEST b on a.CDPRODUCT = b.CDPRODUCT
inner join REQUEST c on b.CDREQUEST = c.CDREQUEST
group by a.NMPRODUCT;

--Exercicio C
select
	RESULT.NMSUPPLIER,
	COUNT(RESULT.CDPRODUCT) as PRODAVAILABLE,
	avg(RESULT.AVGPRICE) AS AVGPRICE,
	sum(RESULT.QTSTOCKTOTAL) AS STOCKTOTAL
from (
select 
	a.NMSUPPLIER,
	sum(b.QTSTOCK) as QTSTOCKTOTAL,
	AVG(b.VLPRICE) as AVGPRICE,
	b.CDPRODUCT as CDPRODUCT
from SUPPLIER a
inner join PRODUCT b on a.CDSUPPLIER = b.CDSUPPLIER
group by a.NMSUPPLIER, b.CDPRODUCT) as RESULT
group by RESULT.NMSUPPLIER;

--Exercicio D
SELECT * FROM (select 
	a.NMCUSTOMER, a.IDFONE,
	max(b.VLTOTAL) as BIGGER, 
	min(b.VLTOTAL) as SMALLER,
	SUM(b.VLTOTAL) AS TOTAL,
	AVG(b.VLTOTAL) as AVERAGE
from CUSTOMER a
inner join REQUEST b on a.CDCUSTOMER = b.CDCUSTOMER
group by a.NMCUSTOMER, a.IDFONE) AS RESULT
ORDER BY RESULT.BIGGER DESC;

-- EXERCICIO E
SELECT * FROM (SELECT 
	A.DTREQUEST, 
	B.NMCUSTOMER,
	COUNT(D.NMPRODUCT) AS PRODUCTYPE,
	SUM(A.VLTOTAL) AS VLTOTALREQUEST,
	AVG(C.VLUNITARY) AS AVGREQUEST
FROM REQUEST A
INNER JOIN CUSTOMER B ON A.CDCUSTOMER = B.CDCUSTOMER
INNER JOIN PRODUCTREQUEST C ON A.CDREQUEST = C.CDREQUEST
INNER JOIN PRODUCT D ON C.CDPRODUCT = D.CDPRODUCT
GROUP BY A.DTREQUEST, B.NMCUSTOMER) AS RESULT 
ORDER BY RESULT.PRODUCTYPE;

-- EXERCICIO F
SELECT * FROM (SELECT 
	A.NMSUPPLIER,
	COUNT(B.CDPRODUCT) AS PRODUCTS
FROM SUPPLIER A 
INNER JOIN PRODUCT B ON A.CDSUPPLIER = B.CDSUPPLIER
GROUP BY A.NMSUPPLIER, A.CDSUPPLIER) AS RESULT
WHERE RESULT.PRODUCTS > 1;

-- EXERCICIO G
SELECT * FROM (SELECT 
	A.NMPRODUCT, 
	COUNT(A.NMPRODUCT) AS TIMESORDERED,
	SUM(B.QTAMOUNT) AS AMOUNTORDERED
FROM PRODUCT A
INNER JOIN PRODUCTREQUEST B ON A.CDPRODUCT = B.CDPRODUCT
GROUP BY A.NMPRODUCT) AS RESULT 
WHERE RESULT.TIMESORDERED < 2; -- TODO OS PRODUTOS FORAM PEDIDOS 22 VEZES

-- EXERCICIO H
SELECT * FROM (SELECT 
	A.NMCUSTOMER, D.NMPRODUCT, 
	SUM(B.VLTOTAL) AS VLTOTALORDERED,
	COUNT(D.CDPRODUCT) AS TIMESORDERED,
	E.NMSUPPLIER
FROM CUSTOMER A 
INNER JOIN REQUEST B ON A.CDCUSTOMER = B.CDCUSTOMER
INNER JOIN PRODUCTREQUEST C ON B.CDREQUEST= C.CDREQUEST
INNER JOIN PRODUCT D ON C.CDPRODUCT = D.CDPRODUCT
INNER JOIN SUPPLIER E ON D.CDSUPPLIER = E.CDSUPPLIER
GROUP BY A.NMCUSTOMER, D.NMPRODUCT, E.NMSUPPLIER) AS RESULT
WHERE RESULT.VLTOTALORDERED > 1000
ORDER BY RESULT.NMCUSTOMER, RESULT.NMPRODUCT;