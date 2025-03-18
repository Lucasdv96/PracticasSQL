CREATE LOGIN adminLogin WITH PASSWORD = 'Isabel1234'
CREATE LOGIN viewLogin WITH PASSWORD = 'Isabel1234'
CREATE LOGIN createLogin WITH PASSWORD = 'Isabel1234'

CREATE USER adminUser FOR LOGIN adminLogin
CREATE USER viewUser FOR LOGIN viewLogin
CREATE USER createUser FOR LOGIN createLogin

GRANT SELECT, DELETE, UPDATE, INSERT ON DATABASE :: Carreras TO adminUser

GRANT SELECT ON Carreras.dbo.Pilotos TO viewUser
GRANT SELECT ON Carreras.dbo.Escuderias TO viewUser
GRANT SELECT ON Carreras.dbo.Pilotos_Escuderias TO viewUser
GRANT SELECT ON Carreras.dbo.GPs TO viewUser
GRANT SELECT ON Carreras.dbo.Circuitos TO viewUser
GRANT SELECT ON Carreras.dbo.Monoplazas TO viewUser

GRANT INSERT ON Carreras.dbo.Pilotos TO createUser
GRANT INSERT ON Carreras.dbo.Escuderias TO createUser
GRANT INSERT ON Carreras.dbo.Circuitos TO createUser
GRANT INSERT ON Carreras.dbo.GPs TO createUser
GRANT INSERT ON Carreras.dbo.Monoplazas TO createUser
GRANT INSERT ON Carreras.dbo.Temporadas TO createUser
GRANT INSERT ON Carreras.dbo.Pilotos_Escuderias TO createUser
GRANT INSERT ON Carreras.dbo.Fechas_GP TO createUser