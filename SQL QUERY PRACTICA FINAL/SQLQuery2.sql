CREATE PROCEDURE inserAcciones
@nombre nvarchar(50),
@SectorID int
AS
BEGIN
insert into Acciones(Nombre, SectorID)
values (@nombre,@SectorID)
END

EXEC inserAcciones 'Mercado Libre',3

exec inserAcciones('Apple',1)

insert into Acciones(Nombre, SectorID)
values ('Mercado Libre',3)

SELECT * FROM Acciones

INSERT INTO Sector(Nombre)
VALUES ('Comercio Electronico')

SELECT * FROM Usuarios

CREATE PROCEDURE insertInvers(
	@usuarioid int,
	@accionid int, 
	@fecha DATE,
	@operacion nvarchar(20),
	@Cant int,
	@pcio_unit int
)
AS
BEGIN 
INSERT INTO inversiones(UsuarioID, AccionID, Fecha, Operacion, Cantidad, PcioUnitario)
VALUES(1,1, '2022-01-20','venta', -3 , 300)


EXEC insertInvers 1,3, '2022-01-02', 'compra', 5, 450

SELECT * FROM inversiones
UPDATE inversiones
SET Cantidad = 2
WHERE UsuarioID = 5 and AccionID = 2

delete from inversiones
WHERE UsuarioID = 2
SELECT * FROM Usuarios
SELECT * FROM Acciones

DELETE FROM Acciones where Accionid = 8


DROP TABLE inversiones