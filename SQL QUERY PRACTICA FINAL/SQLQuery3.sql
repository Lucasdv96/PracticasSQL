USE Practica_Examen_Final
--EJERCICIO 3 
CREATE INDEX ID_SECTOR_ID
ON ACCIONES(SectorId)

--EJERCICIO 4 
CREATE INDEX IDX_USR_ACC_FECH
ON INVERSIONES(UsuarioID, AccionId, Fecha)

--EJERCICIO 5
CREATE VIEW V_ejerc5 AS

SELECT inv.UsuarioID, us.Nombre as UserName, inv.AccionID, ac.Nombre as AccionName, inv.Cantidad, inv.PcioUnitario/inv.Cantidad as prec_unit_prom
FROM inversiones inv
JOIN Usuarios us
on inv.UsuarioID = us.UsuarioID
join Acciones ac
on inv.AccionID = ac.Accionid
GROUP BY inv.UsuarioID, us.Nombre, inv.AccionID, ac.Nombre, inv.Cantidad, inv.PcioUnitario
HAVING inv.cantidad > 0

select * from V_ejerc5

--EJERCICIO 6
CREATE VIEW V_ejerc6 AS
SELECT sec.SectorID as Sectores, sec.Nombre as NombreSector, COUNT(1) as cantidad_acciones
FROM inversiones inv
JOIN Acciones ac
on inv.AccionID = ac.Accionid
join Sector sec
on ac.SectorID = sec.SectorID
GROUP BY sec.SectorID, sec.Nombre

select * from V_ejerc6


SELECT *
FROM inversiones inv
join Acciones ac 
on inv.AccionID = ac.Accionid
join Sector sc
on ac.SectorID = sc.SectorID
ORDER BY inv.UsuarioID
exec sp_ejerc7 1
--EJERCICIO 7

CREATE PROCEDURE sp_ejerc7
(@usrid int)
AS
BEGIN
SELECT usr.Nombre as Nombre_User,ac.Nombre as Nombre_accion, SUM(inv.Cantidad) AS Cant_Acciones
FROM inversiones inv
join Usuarios usr
on inv.UsuarioID = usr.UsuarioID
join Acciones ac
on inv.AccionID = ac.Accionid
where inv.UsuarioID = @usrid
group by  usr.Nombre,ac.Nombre
END
exec sp_ejerc7 1

--ejercicio 8 
CREATE PROCEDURE sp_ejerc8(
@usrid int
)
AS
BEGIN
SELECT acc.Nombre, COUNT(inv.UsuarioID) as cant_usur
FROM inversiones inv
join Acciones acc
on inv.AccionID = acc.Accionid
join Sector sec
on acc.SectorID = sec.SectorID
where acc.SectorID = @usrid
group by acc.Nombre
END

EXEC sp_ejerc8 3

SELECT * FROM inversiones i
join Acciones ac
on i.AccionID = ac.Accionid
EXEC sp_ejerc8 1

--EJERCICIO 9
CREATE PROCEDURE sp_ejerc9(
@usrid int,
@accid int,
@oper nvarchar(20),
@cant int, 
@pcu int
)
AS
BEGIN
	INSERT INTO inversiones
	(UsuarioID, AccionID, Fecha, Operacion, Cantidad, PcioUnitario)
	VALUES(@usrid,@accid, GETDATE(), @oper, @cant, @pcu)
END


--EJERCICIO 10
CREATE PROCEDURE sp_ejerc10(
@valor int
)
as
begin
SELECT ac.Nombre as Nombre_Accion,AVG(inv.PcioUnitario) as Precio_Promedio
FROM inversiones inv
join Acciones ac 
on inv.AccionID = ac.Accionid
WHERE inv.Operacion = 'Compra' 
GROUP BY ac.Nombre
HAVING @valor < AVG(inv.PcioUnitario)
END

EXEC sp_ejerc10 50

DROP PROCEDURE sp_ejerc10