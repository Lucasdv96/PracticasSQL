-- Segundo Parcial 
-- Ejercicio 1: Cree un stored procedure que reciba un ID de turno, una fecha y la hora,  
-- y con los datos recibidos actualice la fecha y la hora para el turno indicado. 

 

CREATE PROCEDURE sp_turno_actualizar (@turnoID int, @fecha date, @hora int) 
AS BEGIN 
  UPDATE Turnos 
    SET Fecha = @fecha, Hora= @hora 
WHERE TurnoID= @turnoID 
END 

EXEC dbo.sp_turno_actualizar 1, '2022-06-13', 15 

 

-- Ejercicio 2: Cree una función que reciba un EspID (id de especialidad) y  
-- devuelva la cantidad de profesionales que tienen esa especialidad.  

CREATE FUNCTION f_profesionales_cantidad (@espID int) 
RETURNS int 
AS BEGIN 
    DECLARE @ret int 
SELECT @ret= COUNT(1)  
FROM Profesionales 
WHERE EspID = @espID  
RETURN @ret 
END 

SELECT dbo.f_profesionales_cantidad(2) AS cant 

 
 -- Ejercicio 3: Cree una vista que informe Nombre Paciente,  
-- Nombre Profesional, Especialidad, Fecha y Hora del Turno 

 CREATE VIEW v_Turnos 
AS 
    SELECT p.Nombre Paciente, pr.Nombre Profesional, e.Nombre Especialidad, t.Fecha, t.Hora 
    FROM Turnos t 
JOIN Pacientes p 
  ON t.PacienteID = p.PacienteID 
JOIN Profesionales pr 
  ON t.ProfesionalID = pr.ProfID 
JOIN Especialidad e 
ON pr.EspID = e.EspID  

SELECT * FROM v_Turnos 

-- Ejercicio 4: Cree una vista que muestre la cantidad de turnos por especialidad. 

CREATE VIEW v_turnos_especialidad AS     
SELECT e.Nombre Especialidad, COUNT(1) Cantidad 
FROM Turnos t 
JOIN Profesionales pr 
  ON t.ProfesionalID = pr.ProfID 
JOIN Especialidad e 
  ON e.EspID = pr.EspID 
GROUP BY e.Nombre  

SELECT * FROM v_turnos_especialidad 

 

-- Ejercicio 5: Cree un stored procedure que reciba un ID de especialidad y  
-- devuelva la cantidad de pacientes que tiene cada profesional de dicha especialidad. 

 CREATE PROCEDURE sp_profesional_pacientes(@espID int) 
AS 
BEGIN
SELECT t1.ProfesionalID, t2.Nombre Profesional, COUNT(1) pacientes 
FROM
  (SELECT DISTINCT ProfesionalID, PacienteID  
  FROM Turnos) t1 
JOIN Profesionales t2 
  ON t1.ProfesionalID = t2.ProfID 
WHERE t2.EspID = @espID 
GROUP BY t1.ProfesionalID, t2.Nombre 
END 

EXEC sp_profesional_pacientes 2 

 

-- Ejercicio 6: Cree un Stored Procedure que reciba un ID de turno y  
-- devuelva Nombre del Paciente, Nombre del Profesional, Nombre de la Especialidad. 
 

CREATE PROCEDURE sp_turno_ver(@turnoID int) 
AS BEGIN 
    SELECT p.Nombre Paciente, pr.Nombre Profesional, e.Nombre Especialidad 
    FROM Turnos t 
JOIN Pacientes p
  ON t.PacienteID = p.PacienteID 
JOIN Profesionales pr 
  ON t.ProfesionalID = pr.ProfID 
JOIN Especialidad e 
  ON pr.EspID = e.EspID 
    WHERE TurnoID = @turnoID     
 

END 

 

-- Ejercicio 7: Cree una vista que devuelva una lista de profesionales  

-- que tienen más de dos turnos asignados. 

 

CREATE VIEW v_profesionales_turnos  

AS 

 

    SELECT p.Nombre Profesional, COUNT(1) cantidad_turnos 

FROM Turnos t 

JOIN Profesionales p 

  ON t.ProfesionalID = p.ProfID 

GROUP BY p.Nombre 

HAVING COUNT(1) > 2 

 

-- Ejercicio 8: Cree un login y un usuario de base de datos denominado ‘usrDoctor’  

-- y asígnele permisos para lectura, inserción y actualización a la tabla de turnos 

 

CREATE LOGIN usrLogin WITH PASSWORD = 'abc123' 

CREATE USER usrDoctor FOR LOGIN usrLogin 

GRANT SELECT, INSERT, UPDATE ON Turnos TO usrDoctor 

 

-- Ejercicio 9: Cree un índice sobre la columna EspID de la tabla de Profesionales. 

 

CREATE INDEX idx_profesionales_espid 

  ON Profesionales(EspID) 

 

-- Ejercicio 10: Cree un índice sobre la columna PacienteID de la tabla de Turnos. 

 

CREATE INDEX idx_turnos_pacienteid 

  ON Turnos(pacienteID) 

 