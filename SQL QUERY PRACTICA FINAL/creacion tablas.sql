CREATE DATABASE INVERSIONES1
USE INVERSIONES1

CREATE TABLE Usuarios(
UsuarioID int identity(1,1) primary key,
Nombre nvarchar(50) not null
)

CREATE TABLE Sector(
SectorID int identity(1,1) primary key,
Nombre nvarchar(50) not null
)


CREATE TABLE Acciones(
AccionesID int identity(1,1) primary key,
Nombre nvarchar(50) not null,
SectorID int FOREIGN KEY REFERENCES SECTOR(SectorID) Not Null
)


CREATE TABLE Inversiones(
InversionesID int identity(1,1) primary key,
UsuarioID int FOREIGN KEY REFERENCES Usuarios(UsuarioID) Not Null,
AccionesID int FOREIGN KEY REFERENCES Acciones(AccionesID) Not Null,
FECHA DATE NOT NULL,
Operacion nvarchar(50) NOT NULL,
Cantidad int NOT NULL,
PcioUnitario int NOT NULL
)

INSERT INTO Sector(Nombre)
VALUES('Tecnologia')
INSERT INTO Sector(Nombre)
VALUES('Software')
INSERT INTO Sector(Nombre)
VALUES('Comercio Electronico')

INSERT INTO Acciones(Nombre, SectorID)
VALUES('Apple', 1)
INSERT INTO Acciones(Nombre, SectorID)
VALUES('Microsoft', 2)
INSERT INTO Acciones(Nombre, SectorID)
VALUES('Google', 2)
INSERT INTO Acciones(Nombre, SectorID)
VALUES('Amazon', 3)
INSERT INTO Acciones(Nombre, SectorID)
VALUES('Mercado Libre', 3)

INSERT INTO USUARIOS (Nombre)
VALUES('Nombre_1')
INSERT INTO USUARIOS (Nombre)
VALUES('Nombre_2')
INSERT INTO USUARIOS (Nombre)
VALUES('Nombre_3')
INSERT INTO USUARIOS (Nombre)
VALUES('Nombre_4')
INSERT INTO USUARIOS (Nombre)
VALUES('Nombre_5')