-- EXERCICIO A
ALTER TABLE PRODUCTREQUEST
NOCHECK CONSTRAINT FKPRODUCTREQREQUEST
DELETE FROM REQUEST
WHERE VLTOTAL < 1000 AND
CDREQUEST NOT IN (
	SELECT CDREQUEST FROM PRODUCTREQUEST
) AND MONTH(DTREQUEST) = 06;

-- EXERCICIO B
BEGIN TRAN
UPDATE PRODUCT
SET PRODUCT.VLPRICE = R.AVGUNITARY
FROM (
 SELECT 
	CDPRODUCT,
	AVG(VLUNITARY) AS AVGUNITARY,
	SUM(CDPRODUCT) AS AMOUNT
 FROM PRODUCTREQUEST
 GROUP BY CDPRODUCT
) R
WHERE PRODUCT.CDPRODUCT = R.CDPRODUCT
AND AMOUNT < 800;


SELECT * FROM PRODUCT

ROLLBACK

-- EXERCICIO C
INSERT INTO CUSTOMER (CDCUSTOMER, NMCUSTOMER, IDFONE, NMADRESS)
SELECT 8+CDSUPPLIER, NMSUPPLIER, IDFONE, 'DESCONHECIDO' FROM SUPPLIER;

-- EXERCICIO D
UPDATE REQUEST
SET DTDELIVER = DATEADD(DAY, 30, DTDELIVER)
WHERE VLTOTAL < 10000;
