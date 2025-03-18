/* 
PUNTO 1.

SELECT * FROM Production.Product
WHERE ReorderPoint = 375
UNION
SELECT * FROM Production.Product
WHERE ReorderPoint = 75
*/

/* 
PUNTO 2.

SELECT * FROM Production.Product
WHERE ReorderPoint = 375 OR ReorderPoint = 75
*/


/*
PUNTO 3.

SELECT * FROM Production.Product
WHERE ReorderPoint = 375
EXCEPT
SELECT * FROM Production.Product
WHERE ListPrice = 0
order by ListPrice ASC; 
*/


/*
PUNTO 4

SELECT * FROM Production.Product
WHERE ReorderPoint = 375 and not ListPrice = 0
-----------------------------------------------
SELECT * FROM Production.Product
WHERE ReorderPoint = 375 and ListPrice != 0
*/

/*
PUNTO 5 y 6

SELECT *
from Production.Product as P 
FULL JOIN Production.ProductReview as PR
ON p.ProductID = pr.ProductID
ORDER BY p.ProductID DESC;
*/

/*
PUNTO 7

SELECT * FROM Production.Product
WHERE ReorderPoint = 375
INTERSECT
SELECT * FROM Production.Product
WHERE ListPrice = 0
*/

/*
PUNTO 8

SELECT * FROM Production.Product
WHERE ReorderPoint = 375 and ListPrice = 0
*/


/*
PUNTO 9

select [Name], safetystocklevel, reorderpoint 
FROM Production.Product
*/

/*
PUNTO 10

SELECT * FROM Production.Product
WHERE ListPrice > 1000
*/

/*
PUNTO 11

SELECT ProductSubcategoryID,cat.[Name] as Categoria,sub.[name] as SubCategoria  FROM Production.ProductCategory as cat
FULL JOIN Production.ProductSubcategory as sub
ON  cat.ProductCategoryID = sub.ProductCategoryID
*/

