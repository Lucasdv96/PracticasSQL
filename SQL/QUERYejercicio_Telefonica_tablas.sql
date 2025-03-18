--CREATE TABLE Compania(
--	CiaID int PRIMARY KEY,
--	nombre varchar(250) not null,
--	CONSTRAINT FK_CiaId UNIQUE(CiaID)
--)

--Create TABLE Usuarios(
--	UsuarioID int NOT NULL PRIMARY KEY,
--	Nombre varchar(250)not null,
--	CiaId int foreign key references Compania(CiaID),
--	CONSTRAINT FK_UsuarioId UNIQUE(UsuarioID)
--)


--CREATE TABLE Planes(
--	PlanID int primary key ,
--	nombre varchar(250) not null,
--	Minutos INT 
--	CONSTRAINT FK_PlanID UNIQUE(PlanID)
--)

--CREATE TABLE Llamadas(
--	LlamadaID int PRIMARY KEY, 
--	UsuarioID int,
--	DestinoID int,
--	Minutos int,		
--	CONSTRAINT FK_LlamadaID UNIQUE(LlamadaID)
--)

--CREATE TABLE UsuariosPlanes(
--	UsuarioID int FOREIGN KEY REFERENCES Usuarios(UsuarioID),
--	PlanID int FOREIGN KEY REFERENCES Planes(PlanID)
--)

ALTER TABLE Llamadas
ADD FOREIGN KEY(UsuarioID) REFERENCES Usuarios(UsuarioID)
ALTER TABLE Llamadas
ADD FOREIGN KEY(DestinoID) REFERENCES Usuarios(UsuarioID)