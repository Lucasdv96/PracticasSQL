--EJERCICIO 3
--Create view vProdCatSales as 
--select pc.name as pcName,p.name, soh.OrderDate, sod.OrderQty  from Production.Product p 
--join Production.ProductSubcategory psc 
--on p.ProductSubcategoryID = psc.ProductSubcategoryID 
--join Production.ProductCategory pc 
--on pc.ProductCategoryID = psc.ProductCategoryID 
--join Sales.SalesOrderDetail sod 
--on p.ProductID = sod.ProductID 
--join Sales.SalesOrderHeader soh 
--on sod.SalesOrderID = soh.SalesOrderID 

--select * from dbo.vProdCatSales


--EJERCICIO 4
--create view vImporteVendido as 
--select pc.Name as pcName, psc.Name as pscName, sum(sod.OrderQty * sod.UnitPrice) as Importe 
--from Production.Product p 
--join Production.ProductSubcategory psc 
--on p.ProductSubcategoryID = psc.ProductSubcategoryID 
--join Production.ProductCategory pc 
--on pc.ProductCategoryID = psc.ProductCategoryID 
--join Sales.SalesOrderDetail sod 
--on p.ProductID = sod.ProductID 
--group by pc.Name, psc.Name 


--select * from Sales.SalesOrderDetail 
--select * from dbo.vImporteVendido 

  --EJERCICIO 5
--create view vOrdersOnline as 
--select OrderDate, SalesOrderNumber, CustomerID, TotalDue 
--from sales.SalesOrderHeader 
--where OnlineOrderFlag = 1 
--select * from dbo.vOrdersOnline 
  

  --EJERCICIO 6
--create view UnassignedColorProduct as 
--select * from Production.Product 
--where Color is null 

  

--select * from dbo.UnassignedColorProduct 

  
--EJERCICIO 7
--create procedure Ejercicio7  
--@id int,  
--@id2 int, 
--@ctn varchar(25) 
--as  
--begin 
--update Sales.SalesOrderDetail  
--set CarrierTrackingNumber = @ctn 
-- where SalesOrderID = @id and SalesOrderDetailID = @id2 
--end 
--dbo.ejercicio7  43659,1, '1111-111A-11' 

-- select * from sales.SalesOrderDetail 

 
--EJERCICIO 1 
--SELECT *  from sales.SalesOrderHeader  
--where PurchaseOrderNumber = 'PO15428132599' 
--create index IX_sales_SalesOrderHeader 
--on sales.SalesOrderHeader(PurchaseOrderNumber); 
--go 

 
--EJERCICIO 8 
--create procedure ejercicio8 
--as 
--select Name from Production.ProductSubcategory  
--WHERE ProductCategoryID  IN(SELECT T1.ProductCategoryID from ( 
--SELECT ProductCategoryID, count(1) as cantidad from Production.ProductSubcategory 
--group by ProductCategoryID  
--having count(ProductSubcategoryID) > 5 ) as T1) 

--select * from Production.ProductsubCategory 
--dbo.ejercicio8 

  

--Ejercicio 9 
--Create procedure betweenQuantity 
--@desde datetime, 
--@hasta datetime 
--aS 
--select count(sod.OrderQty)as Cantidad, soh.TerritoryID from sales.SalesOrderHeader soh 
--join sales.SalesOrderDetail sod 
--on soh.SalesOrderID = sod.SalesOrderID 
--where soh.OrderDate between (@desde) and (@hasta) 
--group by soh.TerritoryID 
--order by soh.TerritoryID asc 

--dbo.betweenQuantity '2011-05-31T00:00:00', '2011-06-05T00:00:00'  

  
--EJERCICIO 10 
--CREATE PROCEDURE insertCategory 
--@Name varchar(50),
--@rowguid uniqueidentifier, 
--@ModifiedDate DateTime
--as
--INSERT INTO Production.ProductCategory
--VALUES (
--@Name,
--@rowguid,
--@ModifiedDate
--) 
--select * from Production.ProductCategory

-- dbo.insertCategory 'Cosas', 'AAAAAAAA-DF71-47A7-B81B-64EE161AA37B', '2022-06-05T00:00:00'


--EJERCICIO 11
--select * from sales.SalesOrderDetail
--where CarrierTrackingNumber = '4911-403C-98'

--CREATE INDEX idx_Sales_CarrierTrackingNumber
--ON sales.salesOrderDetail(CarrierTrackingNumber)

--EJERCICIO12



---------------------



--EJERCICIO 13
--CREATE VIEW vEjercicio13
--as
--SELECT psc.Name AS CategoryName, p.Name AS ProductName, soh.ShipDate, sod.UnitPrice
--FROM Production.ProductCategory pc
--join Production.ProductSubcategory psc
--on pc.ProductCategoryID = psc.ProductCategoryID
--join Production.Product p
--on p.ProductSubcategoryID = psc.ProductSubcategoryID
--join Sales.SalesOrderDetail sod
--on sod.ProductID = p.ProductID
--join sales.SalesOrderHeader soh
--on sod.SalesOrderID = soh.SalesOrderID

--select * from vEjercicio13

--EJERCICIO 14	

--CREATE VIEW vEjercicio14
--as
--select pc.Name as CategoryName, p.Name as ProductName, sod.OrderQty * sod.UnitPrice AS AmountSold
--from Production.ProductCategory pc
--join Production.ProductSubcategory psc
--on pc.ProductCategoryID = psc.ProductSubcategoryID
--join Production.Product p 
--on p.ProductSubcategoryID = psc.ProductSubcategoryID
--join sales.SalesOrderDetail sod
--on sod.ProductID = p.ProductID
--group by pc.Name, p.Name, sod.OrderQty * sod.UnitPrice

--select * from vEjercicio14


--EJERCICIO 15 
--CREATE VIEW vNotOnlineOrders
--as
--select orderdate, SalesOrderNumber, CustomerID, TotalDue
--from Sales.SalesOrderHeader
--where OnlineOrderFlag = 0

--SELECT * FROM vNotOnlineOrders

----EJERCICIO 16
--CREATE VIEW vProductsWitoutSubcategory
--as
--SELECT * FROM Production.Product
--WHERE ProductSubcategoryID is NULL

--SELECT * FROM vProductsWitoutSubcategory

----EJERCICIO 17 
--CREATE PROCEDURE UpdateStatus
--@id int,
--@Status int
--as
--UPDATE Sales.SalesOrderHeader
--SET Status = @status
--WHERE SalesOrderHeader.SalesOrderID = @id

--SELECT * FROM sales.SalesOrderHeader

--EXEC dbo.UpdateStatus 43659, 1

--EJERCICIO 19
--CREATE PROCEDURE Ejercicio19
--@desde DateTime,
--@hasta DateTime
--as
--BEGIN
--select TotalDue from sales.SalesOrderHeader
--WHERE OrderDate >= @desde and OrderDate <= @hasta
--END

--SELECT * FROM Sales.SalesOrderHeader
--exec dbo.Ejercicio19 '2011-05-31T00:00:00', '2011-06-04T00:00:00'
