--PRIMER SELECT
SELECT * FROM Pilotos p
JOIN Campeones_Pilotos cp
on p.ID_Piloto = cp.ID_Piloto
WHERE Pais_Nacimiento = 'Argentina' and Puntos_Totales > 150

--Segundo SELECT

SELECT COUNT(1) as Cantidad_Campeonatos, e.Nombre
FROM Escuderias e 
join Campeones_Escuderias ce
on e.ID_Escuderia = ce.ID_Escuderia
group by e.Nombre
Having COUNT(ce.ID_Campeon) > 5


--TERCER SELECT
CREATE PROCEDURE p_Agregar_piloto(
@nombre nvarchar(150),
@apellido nvarchar(150),
@fecha_nacimineto DATE,
@pais_nacimiento nvarchar(100)
)
AS
begin
INSERT INTO Pilotos (
 Nombre, Apellido, Fecha_Nacimiento, Pais_Nacimiento
)
VALUES(@nombre, @apellido, @fecha_nacimineto, @pais_nacimiento)
end

EXEC dbo.p_Agregar_piloto 'Juan Manuel', 'Fangio','1911-06-24','Argentina' 

--SEGUNDO PROCEDURE
CREATE PROCEDURE p_agregar_escuderia(
@Nombre nvarchar(50)
)
AS
BEGIN
INSERT INTO Escuderias(
Nombre)
VALUES (@Nombre)
END

--TERCERO PREOCURE
CREATE PROCEDURE p_Agregar_circuito(
@nombre nvarchar(100),
@ubicacion nvarchar(100),
@longt int
)
AS
BEGIN
INSERT INTO Circuitos(Nombre, Ubicacion,Longitud)
VALUES (@Nombre, @ubicacion, @longt)
END

--CUARTO PROCEDURE
CREATE PROCEDURE p_agregar_gp(
@nombre nvarchar(100),
@id_cicuito int
)
AS 
BEGIN
INSERT INTO GPs(Nombre, ID_Circuito)
VALUES(@nombre, @id_cicuito)
END

--QUINTO PROCEDURE
CREATE PROCEDURE p_borrar_piloto(
@id int
)
AS
BEGIN
DELETE FROM Pilotos
WHERE ID_Piloto = @id
END


--SEXTO PROCEDURE
CREATE PROCEDURE p_update_record_sesion(
@id_record int,
@id_piloto int,
@id_sesion int,
@id_fecha int,
@tiempo time
)
AS
BEGIN
UPDATE Records_Sesion
SET @id_record = @id_record,ID_Piloto = @id_piloto, ID_Sesion = @id_sesion, Tiempo = @tiempo
WHERE ID_Record = @id_record
END

--SEPTIMO PROCEDURE
CREATE PROCEDURE p_update_record_historico(
@id_record int,
@id_temporada int,
@id_piloto int,
@id_fecha int,
@tiempo time
)
AS
BEGIN
UPDATE Records_Historicos
SET @id_record = @id_record,ID_Piloto = @id_piloto, ID_Temporada =@id_temporada, Tiempo = @tiempo
WHERE ID_Record = @id_record
END



