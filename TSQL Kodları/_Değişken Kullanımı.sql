--DECLARE DEGISKEN TANIMLARKEN KULLANILIR
DECLARE @ISIM AS VARCHAR(100)
SET @ISIM='?MER'

--DECLARE @ISIM AS VARCHAR(100)='?MER'

SELECT @ISIM

DECLARE @SAYI1 AS INTEGER
SET @SAYI1=15
DECLARE @SAYI2 AS INTEGER
SET @SAYI2=20
DECLARE @TOPLAM AS INTEGER
SET @TOPLAM=@SAYI1+@SAYI2

--DECLARE 
--@SAYI1 AS INTEGER,
--@SAYI2 AS INTEGER,
--@TOPLAM AS INTEGER

--SET @SAYI1=15
--SET @SAYI2=20
--SET @TOPLAM=@SAYI1+@SAYI2

SELECT @SAYI1 AS SAYI1,@SAYI2 AS SAYI2, @TOPLAM AS TOPLAM

--TABLODAN DEGISKEN ATAMA
SELECT *FROM ISIMLER

DECLARE @ISIM AS VARCHAR(100)
DECLARE @TELEFON AS VARCHAR(100)

SELECT @ISIM=ISIM, @TELEFON=TELEFON FROM ISIMLER WHERE ID=1

SELECT @ISIM, @TELEFON

--TARIH
DECLARE @TARIH AS DATETIME
SET @TARIH=GETDATE()
SELECT @TARIH
