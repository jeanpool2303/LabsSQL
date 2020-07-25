--1.-Visualizar todos los registros de la tabla productos:
SELECT *
FROM 
	Production.Product;

--2.-Ver la estructura de la tabla productos

EXEC sp_help 'Production.Product'

--3.-Cuantos productos no pertenece a una subcategoria

SELECT *
FROM 
	Production.Product
WHERE 
	ProductSubcategoryID IS NULL;

--4.-Ver listado de Subcategoria de productos

SELECT *
FROM 
	Production.ProductSubcategory;

--5.-Visualizar listado de subcategoria con sus respectiva categoria

SELECT
	sub.ProductSubcategoryID,
	cat.Name,
	sub.Name,
	sub.rowguid,
	sub.ModifiedDate
FROM
	Production.ProductSubcategory AS sub
	INNER JOIN Production.ProductCategory AS cat
ON 
	cat.ProductCategoryID = sub.ProductCategoryID

--6.-Visualizar cantidad de productos por cada subcategoría

SELECT
	DISTINCT 
	COUNT(pp.ProductID) AS 'Producto',
	ps.Name AS 'Subcategoria'
FROM Production.Product pp
	INNER JOIN Production.ProductSubcategory ps
ON pp.ProductSubcategoryID = ps.ProductSubcategoryID
GROUP BY ps.Name

--7.-Ver precio promedio por cada categoría de producto

SELECT 
	pc.Name AS 'Categoria',
	AVG(pp.ListPrice) AS 'Precio Promedio'
FROM 
	Production.Product pp
	INNER JOIN Production.ProductSubcategory ps
	ON pp.ProductSubcategoryID = ps.ProductSubcategoryID
	INNER JOIN Production.ProductCategory pc
	ON ps.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name

--8.-Ver cantidad de productos por categoría

SELECT 
	C.Name AS Categoria,
	COUNT(P.ProductID) AS CANTIDAD
FROM 
	Production.Product P
	INNER JOIN Production.ProductSubcategory S
	ON S.ProductSubcategoryID = P.ProductSubcategoryID
	INNER JOIN Production.ProductCategory C
	ON C.ProductCategoryID = S.ProductCategoryID
GROUP BY C.Name

--9.-ver cantidad de productos sólo de la categoría components
SELECT
	pro.ProductID,
	cat.Name AS Categoria,
	pro.Name
FROM 
	Production.Product AS pro
	INNER JOIN Production.Productcategory AS cat
	ON cat.Name = 'Components'

--10.-Visualizar el total de ventas por cada categoría de producto
SELECT 
	C.Name,
	SUM(SA.LineTotal * SA.UnitPrice) AS TOTAL
FROM 
	Production.Product P
	INNER JOIN Sales.SalesOrderDetail SA
	ON P.ProductID = SA.ProductID
	INNER JOIN Production.ProductSubcategory S
	ON S.ProductSubcategoryID = P.ProductSubcategoryID
	INNER JOIN Production.ProductCategory C
	ON C.ProductCategoryID = S.ProductCategoryID
GROUP BY 
	C.Name

--11.-Ver la cantidad total de empleados
SELECT 
	COUNT(*) 
FROM 
	HumanResources.Employee
SELECT * 
FROM 
	HumanResources.Employee

--12.-Ver la cantidad total de empleados de acuerdo a su estado civil.

SELECT 
	MaritalStatus,
	COUNT(H.BusinessEntityID) AS ESTADO_CIVIL
FROM 
	HumanResources.Employee H
GROUP BY MaritalStatus ;

--13.-Ver cantidad de empleados por género
SELECT
	Gender,
	COUNT(H.BusinessEntityID) AS Genero
FROM 
	HumanResources.Employee H
GROUP BY Gender ;

--14.-Ver listado de Departamentos

select * 
FROM
	HumanResources.Department

--15.-Ver cantidad de empleados por cada departamento

SELECT 
	Department,
	COUNT(*) AS empleados
FROM 
	HumanResources.vEmployeeDepartment GROUP BY Department
