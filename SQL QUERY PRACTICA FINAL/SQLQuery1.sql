--CREATE DATABASE Practica_Examen_Final

--USE Practica_Examen_Final

CREATE TABLE Sector (
	SectorID INT IDENTITY NOT NULL PRIMARY KEY,
	Nombre nvarchar(50) 
)

CREATE TABLE Acciones(
	Accionid INT IDENTITY NOT NULL PRIMARY KEY,
	Nombre nvarchar(50),
	SectorID int FOREIGN KEY REFERENCES Sector(SectorID)
)

CREATE TABLE Usuarios(
	UsuarioID INT IDENTITY NOT NULL PRIMARY KEY,
	Nombre nvarchar(50) 
)

CREATE TABLE inversiones(
	UsuarioID int FOREIGN KEY REFERENCES Usuarios(UsuarioID),
	AccionID int FOREIGN KEY REFERENCES Acciones(Accionid),
	Fecha DATE,
	Operacion nvarchar(20),
	Cantidad int,
	PcioUnitario int
)

	Constraint PK_Usuarios_Acciones Primary KEY (UsuarioID, Accionid)
) 
