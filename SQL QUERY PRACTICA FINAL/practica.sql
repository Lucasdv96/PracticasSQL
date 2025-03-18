--SELECT *
--FROM Production.Product


--PUNTO 1
--INSERT INTO Production.ProductListPriceHistory(ProductID, StartDate, ListPrice, ModifiedDate)
--VALUES(1,'2022-04-22T00:00:00','40,000','2022-04-23T00:00:00')

--PUNTO 2
--INSERT INTO Production.ProductPhoto (ThumbnailPhotoFileName,LargePhotoFileName,ModifiedDate)
--VALUES('mi_nueva_foto_small.gif','mi_nueva_foto_small_nombre_largo.gif','2022-04-23T00:00:00')

--PUNTO 3
--INSERT INTO Production.Location(Name,CostRate,Availability,ModifiedDate)
--VALUES('Fierros Largos','50.00','100','2022-04-23T00:00:00')

--PUNTO 4
--SELECT Name, CostRate, Availability
--FROM Production.Location
--WHERE CostRate != 0

--PUNTO 5
--SELECT ReviewerName, EmailAddress, Comments
--FROM Production.ProductReview
--WHERE  Rating = 5

--PUNTO 6
--SELECT ProductID, Bin,Quantity 
--FROM Production.ProductInventory
--WHERE Shelf = 'B'

--PUNTO 7
/*
SELECT pp.ThumbNailPhoto,pp.LargePhoto
FROM Production.ProductProductPhoto ppp
INNER JOIN Production.ProductPhoto pp
 on pp.ProductPhotoID = ppp.ProductPhotoID
 WHERE PP.ProductID = 330
 */
 
 --PUNTO 8 
 /*
 SELECT pl.Name
 FROM Production.Location pl
 INNER JOIN Production.ProductInventory PI
 ON pl.LocationID = pi.LocationID
 INNER JOIN Production.Product p
 ON pi.ProductID = p.ProductID
 WHERE p.ProductID = 330
 */
 --PUNTO 9
/*
SELECT *
FROM Production.ProductSubcategory psc
INNER JOIN Production.ProductCategory pc
on psc.ProductCategoryID = pc.ProductCategoryID
WHERE pc.Name = 'Bikes'
*/

--PUNTO 10
/*
SELECT p.ProductID,COUNT(pl.LocationID) as locaciones                 
FROM Production.Product p
INNER JOIN Production.ProductInventory pi
on p.ProductID = pi.ProductID
INNER JOIN Production.Location pl
on pl.LocationID = pi.LocationID
group by p.ProductID
ORDER BY COUNT(PL.LocationID) desc
*/

--PUNTO 11
/*
SELECT pc.Name, COUNT(psc.ProductSubcategoryID) as subcategorias
FROM Production.ProductCategory pc
INNER JOIN Production.ProductSubcategory psc
on pc.ProductCategoryID = psc.ProductCategoryID
GROUP BY pc.Name
ORDER BY subcategorias DESC
*/

--PUNTO 12
/*
SELECT ppp.ProductID, COUNT(1) as cant 
FROM Production.ProductPhoto pp
INNER JOIN Production.ProductProductPhoto ppp
ON pp.ProductPhotoID = ppp.ProductPhotoID
GROUP BY ppp.ProductID
ORDER BY COUNT(1) DESC
*/

--PUNTO 13
/*
UPDATE Production.ProductReview
SET ReviewerName = 'Lucas'
WHERE ProductReviewID = 3
SELECT * 
FROM Production.ProductReview
*/

--PUNTO 14
/*
SELECT*
FROM Production.ProductCategory
UPDATE Production.ProductCategory
SET Name = 'Accesorios'
WHERE ProductCategoryID = 4
*/

--PUNTO 15
/*
SELECT * 
FROM Production.Location
UPDATE Production.Location
SET Name = 'Pintura'
WHERE LocationID = 40
*/
--PUNTO 16
/*
SELECT p.Name, pp.LargePhotoFileName
FROM Production.ProductPhoto pp
INNER JOIN Production.ProductProductPhoto ppp
on pp.ProductPhotoID = ppp.ProductPhotoID
INNER JOIN Production.Product p 
on p.ProductID = ppp.ProductID
*/

--PUNTO 17
/*
SELECT p.Name as ProductName, pl.Name as Location
FROM Production.Product p
INNER JOIN Production.ProductInventory pi
on p.ProductID = pi.ProductID
INNER JOIN  Production.Location pl
ON pi.LocationID = pi.LocationID
WHERE Pi.Quantity = 0
*/

--PUNTO 18 
/*
SELECT p.Name, pl.Name
FROM Production.Product p
JOIN Production.ProductInventory piv
on p.ProductID = piv.ProductID
JOIN  Production.Location pl
ON pl.LocationID = piv.LocationID
WHERE pl.CostRate = 0
GROUP BY P.Name, pl.Name
*/

--PUNTO 19 
/*
SELECT p.Name, p.StandardCost
FROM Production.Product p
JOIN Production.ProductReview pr
ON p.ProductID = pr.ProductID
JOIN Production.ProductSubcategory psc
on p.ProductSubcategoryID = psc.ProductSubcategoryID
WHERE pr.Rating > 3 and psc.Name = 'Socks'

JULITO
SELECT Name, StandardCost 
FROM Production.Product AS P
JOIN Production.ProductReview AS PR
ON P.ProductID = PR.ProductID
WHERE PR.Rating > 3 and 
P.ProductSubcategoryID IN (SELECT ProductSubcategoryID FROM Production.ProductSubcategory WHERE Name = 'Socks')
*/

--PUNTO 20
/*
SELECT p.Name, p.Color
FROM Production.Product p 
JOIN Production.ProductInventory piv
on p.ProductID = piv.ProductID
join Production.ProductSubcategory psc
on p.ProductSubcategoryID = psc.ProductSubcategoryID
WHERE piv.Quantity > 300 and psc.Name = 'Brakes' and Shelf = 'A' and Bin = 1

--JULITO--
SELECT Name,
       Color
FROM Production.Product AS P
JOIN Production.ProductInventory AS PIV
ON P.ProductID = PIV.ProductID
WHERE PIV.Quantity > 300 and Shelf = 'A' and Bin = 1 and
P.ProductID IN (SELECT ProductID FROM Production.Product WHERE ProductSubcategoryID IN
(SELECT ProductSubcategoryID FROM Production.ProductSubcategory WHERE Name = 'Brakes'))
*/

--PUNTO 21
/*
SELECT p.Name, p.ReorderPoint
FROM Production.ProductListPriceHistory plh
JOIN Production.product p
on p.ProductID = plh.ProductID
join Production.ProductSubcategory psc
on p.ProductSubcategoryID = psc.ProductSubcategoryID
WHERE PLH.StartDate < '2012-01-01T00:00:00' and psc.Name = 'Jerseys'
*/

--PUNTO 22
/*
DELETE FROM Production.ProductReview
WHERE Rating < 3
*/

--PUNTO 23
/*
DELETE FROM Production.ProductReview 
WHERE ModifiedDate < '2013-10-01T00:00:00'
*/

--PUNTO 24
/*
DELETE FROM Production.ProductListPriceHistory
WHERE ModifiedDate < '2013-01-01T00:00:00'
*/

/*
SELECT * 
FROM Production.ProductListPriceHistory
*/
CREATE TABLE tabla_lucas(
	ID Int PRIMARY KEY,
	Columna1 Varchar(250)NOT NULL,
	Columna2 DateTime 	
	)

CREATE TABLE Orders (
    OrderID int NOT NULL PRIMARY KEY,
    OrderNumber int NOT NULL,
    PersonID int FOREIGN KEY REFERENCES Persons(PersonID)
);
