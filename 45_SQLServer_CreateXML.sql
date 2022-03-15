DECLARE @xml NVARCHAR(200)
DECLARE @id INT
SET @xml = N'
<Youtube>
  <Channel>Mundo Binario</Channel>
  <Creator>Axel Romero</Creator>
  <Course>SQL Server desde cero</Course>
</Youtube>'

--EXEC sp_xml_preparedocument @id OUTPUT, @xml

--  SELECT * FROM OPENXML (@id, '/Youtube', 2) WITH
--  (		
--		Channel VARCHAR(20)
--		,Creator NVARCHAR(20)
--		,Course NVARCHAR(20)
--  )

--EXEC sp_xml_removedocument @id


DECLARE @input XML = N'
<Youtube>
  <Channel>Mundo Binario</Channel>
  <Creator>Axel Romero</Creator>
  <Course>SQL Server desde cero</Course>
</Youtube>'

;WITH XMLNAMESPACES('Youtube' as xsi)
SELECT
FieldName  = T.C.value('local-name(.)', 'varchar(50)'),
FieldValue  = T.C.value('(.)[1]', 'varchar(50)')
FROM
@Input.nodes('/Youtube/*') AS T(C)


--DECLARE @xml AS XML
--SET @xml = [dbo].[UDF_CreatePO](165)
--SELECT @xml

--SELECT @xml.query('PurchaseOrder/LineItem')



--DECLARE @i_XmlDoc		VARCHAR(MAX)	
--		,@xmlDocID		INTEGER

--SET @i_XmlDoc = '<PurchaseOrder>
--  <VendorID>1678</VendorID>
--  <Vendor>Proseware, Inc.</Vendor>
--  <PONumber>000165</PONumber>
--  <ShippingMethod>OVERSEAS - DELUXE</ShippingMethod>
--  <Total>64847.5328</Total>
--  <LineItem>
--    <Item>1</Item>
--    <Product>LL Crankarm</Product>
--    <Qty>550</Qty>
--    <Price>27.0585</Price>
--    <Amount>14882.1750</Amount>
--  </LineItem>
--  <LineItem>
--    <Item>2</Item>
--    <Product>ML Crankarm</Product>
--    <Qty>550</Qty>
--    <Price>33.5790</Price>
--    <Amount>18468.4500</Amount>
--  </LineItem>
--  <LineItem>
--    <Item>3</Item>
--    <Product>HL Crankarm</Product>
--    <Qty>550</Qty>
--    <Price>46.0635</Price>
--    <Amount>25334.9250</Amount>
--  </LineItem>
--</PurchaseOrder>'

--CREATE TABLE #purchaseOrders
--(
--	[PONumber]	VARCHAR(10)
--)

--EXEC sp_xml_preparedocument @xmlDocID OUTPUT, @i_XmlDoc

--INSERT	#purchaseOrders
--		(
--			[PONumber]
--		)
--	SELECT	[xml].[PONumber]
--	FROM	OPENXML(@xmlDocID, 'PurchaseOrder', 2) WITH 
--		( 
--			[PONumber]	VARCHAR(10)
--		) AS [xml]

--	EXEC sp_xml_removedocument @xmlDocID

--	SELECT * FROM #purchaseOrders

--	DROP TABLE #purchaseOrders