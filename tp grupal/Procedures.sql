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
GO

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
 Nombre_Apellido, Fecha_Nacimiento, Pais_Nacimiento
)
VALUES(@nombre, @apellido, @fecha_nacimineto, @pais_nacimiento)
end

EXEC dbo.p_Agregar_piloto 'Juan Manuel', 'Fangio','1911-06-24','Argentina' 
GO

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
GO

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
GO

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
GO

--QUINTO PROCEDURE
CREATE PROCEDURE p_borrar_piloto(
@id int
)
AS
BEGIN
DELETE FROM Pilotos
WHERE ID_Piloto = @id
END
GO

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
GO

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
GO

CREATE PROCEDURE soloPrimerosSesionId (@gpId int, @sesionId int) 
AS BEGIN

    SELECT P.Nombre_Apellido, RS.Tiempo FROM Puestos_Sesion AS PS  
    JOIN Pilotos AS P
    ON PS.ID_Piloto = P.ID_Piloto
    JOIN Tipo_Sesion AS S
    ON PS.ID_Sesion = S.ID_Sesion 
    JOIN Records_Sesion AS RS
    ON PS.ID_GP = RS.ID_Fecha
    JOIN Fecha_GP AS FGP
    ON RS.ID_Fecha = FGP.ID_Fecha
    JOIN GPs AS GP
    ON FGP.ID_GP = GP.ID_GP
    WHERE Puesto = 1 AND PS.ID_GP = @gpId AND PS.ID_Sesion = @sesionId
END

EXEC soloPrimerosSesionId 1, 3
