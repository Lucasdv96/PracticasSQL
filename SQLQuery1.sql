--EJERCICIO 1

--SELECT u.UsuarioID, p.Minutos minutosPlan, sum(l.Minutos) consumidos, p.Minutos - sum(l.Minutos) restantes
--from usuarios u
--join compania c
--on u.CiaId = c.CiaID
--join UsuariosPlanes up 
--on up.UsuarioID = u.UsuarioID
--join planes p
--on p.PlanID = up.PlanID
--join Llamadas l
--on l.UsuarioID = u.UsuarioID
--join Usuarios ud
--on l.DestinoID = ud.UsuarioID
--join Compania cd
--on ud.CiaId = cd.CiaID
--WHERE c.CiaID <> cd.CiaID
--GROUP BY u.UsuarioID, p.Minutos


--EJERCICIO 2
--CREATE INDEX ix_usuarioID_llamadas
--on llamadas(UsuarioID)

--EJERCICIO 3
--CREATE PROCEDURE p_ejercicio3(
--@llamadaID as int
--)
--AS
--BEGIN
--    SELECT u.Nombre NombreUsuario, c.nombre NombreCia, p.nombre NombrePlan,
--	ud.Nombre NombreDestino, cd.nombre NombreCompania, pd.nombre PlanDestino
--	FROM Usuarios u
--	join Compania c
--	on u.CiaId = c.CiaID
--	join UsuariosPlanes up
--	on u.UsuarioID = up.UsuarioID
--	join Planes p
--	on up.PlanID = p.PlanID
--	join Llamadas l 
--	on l.UsuarioID = u.UsuarioID
--	join Usuarios ud 
--	on l.DestinoID = ud.UsuarioID
--	join Compania cd
--	on ud.CiaId = cd.CiaID
--	join UsuariosPlanes upd
--	on ud.UsuarioID = upd.UsuarioID
--	join Planes pd
--	on up.PlanID = pd.PlanID 
--	WHERE l.LlamadaID = @llamadaID
--END
	
--EXEC p_ejercicio3 1

--EJERCICIO 4
--CREATE PROCEDURE p_ejercicio4(@planID as int)
--as
--begin
--	SELECT avg(l.Minutos) MinutosPromedios 
--	FROM Planes p
--	join UsuariosPlanes up
--	on p.PlanID = up.PlanID
--	join Usuarios u
--	on u.UsuarioID = up.UsuarioID
--	join Compania c
--	on c.CiaID = u.CiaId
--	join Llamadas l
--	on u.UsuarioID = l.UsuarioID
--	where p.PlanID = @planID 
--	group by c.CiaID
--END

--EXEC p_ejercicio4 1


--EJERCICIO 5
--CREATE PROCEDURE p_ejercicio5
--as
--begin
--	SELECT u.Nombre NombreUsuario, l.UsuarioID
--	FROM Llamadas l
--	join Usuarios u
--	on l.UsuarioID = u.UsuarioID
--	GROUP BY u.Nombre, l.UsuarioID
--	HAVING COUNT(l.UsuarioID) >= 3
--END
