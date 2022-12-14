CREATE PROC SP_WORKER_INOUT
@WORKERBARCODE AS VARCHAR(50),
@DATE AS DATETIME,
@IOTYPE AS VARCHAR(1),
@GATEID AS INT
AS
BEGIN
DECLARE @WORKERNAME AS VARCHAR(100)
DECLARE @WORKERID AS INT
SELECT @WORKERNAME=WORKERNAME,@WORKERID=ID FROM WORKERS
WHERE WORKERBARCODE=@WORKERBARCODE

	IF @WORKERID IS NULL
	BEGIN
		RAISERROR('OKUTULAN KART GE?ERS?ZD?R',16,1)
		RETURN
	END
	 
DECLARE @LASTIO AS VARCHAR(1)

SELECT TOP 1 @LASTIO=IOTYPE FROM WORKERTRANSACTIONS
WHERE WORKERID=1 AND DATE_>=CONVERT(DATE,GETDATE())
ORDER BY DATE_ DESC

	IF @LASTIO=@IOTYPE
	BEGIN
		IF @IOTYPE='G'
		BEGIN
			RAISERROR('ZATEN ??ER?DE G?R?N?YORSUNUZ,G?R?? YAPAMAZSINIZ',16,1)
			RETURN
		END
	
		IF @IOTYPE='C'
		BEGIN
			RAISERROR('ZATEN DI?ARIDA G?R?N?YORSUNUZ,?IKI? YAPAMAZSINIZ',16,1)
			RETURN
		END
	END

INSERT INTO WORKERTRANSACTIONS(WORKERID,DATE_,IOTYPE,GATEID)
VALUES(@WORKERID,@DATE,@IOTYPE,@GATEID)

SELECT @WORKERNAME AS WORKERNAME,@DATE AS DATE_,@IOTYPE AS IOTYPE
END

TRUNCATE TABLE WORKERTRANSACTIONS

SELECT *FROM WORKERTRANSACTIONS

EXEC SP_WORKER_INOUT 'B2485EFE-1393-440C-A16A-A885CC6AF3E5','2020-04-12 08:05:45','G',1

SELECT *FROM WORKERS