/*
Ejercicio 1: Cree el índice considere necesario para optimizar
la siguiente consulta:  

SELECT * FROM Llamadas WHERE UsuarioID = 3 AND DestinoID = 2.  

Create INDEX ix_LLamada_usuario
on llamadas(UsuarioID, DestinoID)
*/

--ejercicio 2
/*
CREATE VIEW vLlamadas as

select l.LlamadaID,u.Nombre as NombreUsuario, u2.Nombre as NombreDestino, l.Minutos
from Usuarios u 
JOIN Llamadas l
on u.UsuarioID = l.UsuarioID
JOIN usuarios u2
on u2.UsuarioID = l.DestinoID

SELECT * from vLlamadas
--*/

--CREATE VIEW vEjercicio3 as
--SELECT C.nombre as CompanyName, p.nombre as PlanName, count(1) as CantUsuarios
--FROM Usuarios u
--JOIN Compania c
--on c.CiaID = u.CiaId
--JOIN UsuariosPlanes up
--on u.UsuarioID = up.UsuarioID
--JOIN Planes p 
--ON p.PlanID = up.PlanID
--GROUP BY c.nombre, p.nombre

--SELECT * FROM vEjercicio3

--EJERCICIO 3 OTRA COSA

--select t1.Cia, t1.NombrePlan, ISNULL(t2.Cantidad, 0) as cantidad 
--from 
--(select c.Nombre Cia, p.Nombre NombrePlan, COUNT(1) Cantidad  
--from Usuarios u 
--  join Compania c 
--  on u.CiaID = c.CiaID 
--join UsuariosPlanes up 
--  on up.UsuarioID = u.UsuarioID 
--join Planes p 
--  on up.PlanID = p.PlanID 
--group by c.Nombre, p.Nombre 
--) as t2 
--right join  
--(select Compania.Nombre Cia, Planes.Nombre NombrePlan 
--from Compania, Planes) as t1 
--on t1.Cia = t2.Cia and t1.NombrePlan = t2.NombrePlan 

--Ejercicio 4
--CREATE PROCEDURE usuario_plan
--@planID int
--as
--begin
--SELECT u.Nombre NombreUsuario, p.nombre NombrePlan, p.Minutos
--FROM Usuarios u
--join UsuariosPlanes up
--on up.UsuarioID = u.UsuarioID
--join planes p 
--on up.PlanID = p.PlanID
--WHERE p.PlanID = @planID
--END

--exec usuario_plan 1

--EJERCICIO 5 
--CREATE VIEW vCompanyUserCount as
--SELECT c.CiaID CompanyID, c.nombre CompanyName FROM Compania c
--join Usuarios u
--ON C.CiaID = U.CiaId
--GROUP by c.CiaID, c.Nombre
--HAVING count(UsuarioID) >= 2

--SELECT * FROM vCompanyUserCount


--EJERCICIO 6
CREATE FUNCTION f_can_llamados_usr_dest(
@usuarioID  int,
@destinoID  int
)
returns int
as 
begin
declare @cantidad as int

SELECT @cantidad= COUNT(1)
from Llamadas
WHERE UsuarioID = @usuarioID and DestinoID = @destinoID

RETURN @CANTIDAD
END

select f_can_llamados_usr_dst 1, 2
