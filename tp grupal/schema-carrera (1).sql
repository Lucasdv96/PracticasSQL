--CREATE DATABASE Carreras;
USE Carreras

/* Tabla tipo de sesion */
CREATE TABLE Tipo_Sesion (
    ID_Sesion int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    Nombre varchar(100)
)

/* Tabla de circuitos */
CREATE TABLE Circuitos (
    ID_Circuito int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    Nombre varchar(250),
    Ubicacion varchar(250),
    Longitud float
)

/* Tabla de pilotos */
CREATE TABLE Pilotos (
    ID_Piloto int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    Nombre varchar(250), 
    Apellido varchar(250),
    Fecha_Nacimiento Date,
    Pais_Nacimiento varchar(250)
)

/* Tabla de escuderias */
CREATE TABLE Escuderias (
    ID_Escuderia int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    Nombre varchar(250)
)

/* Tabla de temporadas */
CREATE TABLE Temporadas (
    ID_Temporada int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    Nombre varchar(250),
    Fecha_Inicio Date,
    Fecha_Final Date
)

/* Tabla de monoplazas */
CREATE TABLE Monoplazas (
    ID_Monoplazas int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    Nombre varchar(200),
    ID_Escuderia int FOREIGN KEY REFERENCES Escuderias(ID_Escuderia),
    ID_Temporada int FOREIGN KEY REFERENCES Temporadas(ID_Temporada)
)

/* Tabla de GPs */
CREATE TABLE GPs (
    ID_GP int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    Nombre varchar(250),
    ID_Circuito int FOREIGN KEY REFERENCES Circuitos(ID_Circuito),
)

/* Tabla de fechas de cada gp corrido */
CREATE TABLE Fechas_GP (
    ID_Fecha int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    Fecha_Inicio time NOT NULL,
    Fecha_Final time NOT NULL,
    ID_Temporada int FOREIGN KEY REFERENCES Temporadas(ID_Temporada),
    ID_GP int FOREIGN KEY REFERENCES GPs(ID_GP)
)

/* Tabla de puestos por sesion */
CREATE TABLE Puestos_Sesion (
    ID_Puesto int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    ID_Piloto int FOREIGN KEY REFERENCES Pilotos(ID_Piloto),
    ID_Sesion int FOREIGN KEY REFERENCES Tipo_Sesion(ID_Sesion),
    ID_GP int FOREIGN KEY REFERENCES GPs(ID_GP)
)

/* Tabla de incidentes */
CREATE TABLE Incidentes (
    ID_Incidente int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    Descripcion varchar(255) NOT NULL,
    ID_Piloto int FOREIGN KEY REFERENCES Pilotos(ID_Piloto),
    ID_GP int FOREIGN KEY REFERENCES GPs(ID_GP),
    ID_Sesion int FOREIGN KEY REFERENCES Tipo_Sesion(ID_Sesion)
)

/* Tabla de records por sesion */
CREATE TABLE Records_Sesion (
    ID_Record int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    ID_Piloto int FOREIGN KEY REFERENCES Pilotos(ID_Piloto),
    ID_Sesion int FOREIGN KEY REFERENCES Tipo_Sesion(ID_Sesion),
    ID_Fecha int FOREIGN KEY REFERENCES Fechas_GP(ID_Fecha),
    Tiempo time not null
)

/* Tabla de campeones de piloto */
CREATE TABLE Campeones_Pilotos (
    ID_Campeon int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    ID_Temporada int FOREIGN KEY REFERENCES Temporadas(ID_Temporada),
    ID_Piloto int FOREIGN KEY REFERENCES Pilotos(ID_Piloto),
    Puntos_Totales float NOT NULL
)

/* Tabla de campeones de escuderias*/
CREATE TABLE Campeones_Escuderias (
    ID_Campeon int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    ID_Escuderia int FOREIGN KEY REFERENCES Escuderias(ID_Escuderia),
    ID_Temporada int FOREIGN KEY REFERENCES Temporadas(ID_Temporada),
    Puntos_Totales float NOT NULL
)

/* Tabla de puntos de pilotos por sesion */
CREATE TABLE Puntos_Pilotos (
    ID_Piloto int FOREIGN KEY REFERENCES Pilotos(ID_Piloto),
    Puntos float NOT NULL,
    ID_Fecha int FOREIGN KEY REFERENCES Fechas_GP(ID_Fecha)
    CONSTRAINT PK_Puntos_Pilotos PRIMARY KEY (ID_Piloto, ID_Fecha)
)

/* Tabla de puntos de escuderias por sesion */
CREATE TABLE Puntos_Escuderias(
    ID_Puntuacion int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    ID_Escuderia int FOREIGN KEY REFERENCES Escuderias(ID_Escuderia),
    Puntos_Sumados float NOT NULL,
    ID_Fecha int FOREIGN KEY REFERENCES Fechas_GP(ID_Fecha)
)

/* Tabla de pilotos por escuderias */
CREATE TABLE Pilotos_Escuderias (
    ID_PilotosEscuderias int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    ID_Piloto int FOREIGN KEY REFERENCES Pilotos(ID_Piloto),
    ID_Escuderia int FOREIGN KEY REFERENCES Escuderias(ID_Escuderia),
    ID_Temporada int FOREIGN KEY REFERENCES Temporadas(ID_Temporada),
)

/* Tabla de records historicos */
CREATE TABLE Records_Historicos (
    ID_Record int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    ID_Piloto int FOREIGN KEY REFERENCES Pilotos(ID_Piloto),
    ID_Circuito int FOREIGN KEY REFERENCES Circuitos(ID_Circuito),
    ID_Temporada int FOREIGN KEY REFERENCES Temporadas(ID_Temporada),
    Tiempo time NOT NULL
)

 /* Indices */
 -- Pilotos
CREATE NONCLUSTERED INDEX idx_piloto_nombre_apellido
ON Pilotos (Nombre, Apellido ASC)

-- Monoplazas
CREATE NONCLUSTERED INDEX idx_gp_nombre
ON GPs (Nombre ASC)

-- Circuitos
CREATE NONCLUSTERED INDEX idx_circuito_nombre
ON Circuitos (Nombre ASC)

-- Temporadas
CREATE NONCLUSTERED INDEX idx_temporada_nombre
ON Temporadas (Nombre ASC)

-- Puestos por sesion
CREATE NONCLUSTERED INDEX idx_puestos_sesion_piloto_gp
ON Puestos_Sesion (ID_Piloto, ID_Sesion, ID_GP ASC)

-- Incidentes
CREATE NONCLUSTERED INDEX idx_incidentes_piloto_sesion
ON Incidentes (ID_Piloto, ID_GP, ID_Sesion ASC)

-- Records por sesion
CREATE NONCLUSTERED INDEX idx_records_sesion_piloto_fecha_tiempo
ON Records_Sesion (ID_Piloto, ID_Sesion, ID_Fecha, Tiempo ASC)

-- GPs
CREATE NONCLUSTERED INDEX idx_gps_nombre
ON GPs (Nombre ASC)

-- Pilotos campeones
CREATE NONCLUSTERED INDEX idx_campeones_piloto_temporada
ON Campeones_Pilotos (ID_Piloto, ID_Temporada ASC)

-- Escuderias campeonas
CREATE NONCLUSTERED INDEX idx_campeones_equipo_temporada
ON Campeones_Escuderias (ID_Escuderia, ID_Temporada ASC)

-- Puntos por piloto
CREATE NONCLUSTERED INDEX idx_puntos_pilotos
ON Puntos_Pilotos (ID_Piloto ASC)

-- Puntos por escuderia
CREATE NONCLUSTERED INDEX idx_puntos_escuderia
ON Puntos_Escuderias (ID_Escuderia ASC)

-- Pilotos por escuderias
CREATE NONCLUSTERED INDEX idx_pilotos_escuderia_temporada
ON Pilotos_Escuderias (ID_Piloto, ID_Escuderia, ID_Temporada ASC)

-- Fechas de gps
CREATE NONCLUSTERED INDEX idx_fecha_gp_temporada_fecha
ON Fechas_GP (ID_Temporada, ID_GP, Fecha_Inicio, Fecha_Final ASC)

-- Records historicos
CREATE NONCLUSTERED INDEX idx_record_historico_piloto_circuito_temporada_tiempo
ON Records_Historicos (ID_Piloto, ID_Circuito, ID_Temporada, Tiempo ASC)