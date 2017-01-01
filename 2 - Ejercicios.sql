-- Ejercicio 1

CREATE OR REPLACE FUNCTION hayCupo (cod_curso char)
RETURN BOOLEAN
IS
	num_plazas_curso number(3);
	num_matriculados_curso number(3);
BEGIN
	SELECT	C.plazas INTO num_plazas_curso
	FROM	cursos C
	WHERE	C.codigo = cod_curso;
	
	SELECT	COUNT (*) INTO num_matriculados_curso
	FROM	inscripciones I
	WHERE	I.codigo = cod_curso;
	
	IF (num_matriculados_curso < num_plazas_curso) THEN
		RETURN TRUE;
	ELSE
		RETURN FALSE;
  END IF;
	
END;

CREATE OR REPLACE PROCEDURE inscribir (cod_curso CHAR, id_estudiante VARCHAR, es_antiguo_alumno BOOLEAN)
IS
	tipo_curso		cursos.tipo%TYPE;
	horas_curso		cursos.horas%TYPE;
	nivel_curso		cursos.nivel%TYPE;
	importe_curso	cuotas.importe%TYPE;
BEGIN
	IF (NOT hayCupo(cod_curso)) THEN
		dbms_output.put_line ('---ERROR: La incripción no es posible. PLAZAS AGOTADAS---');
	ELSE
		--Cogemos nivel, tipo y horas del curso
		SELECT 	C.nivel, C.tipo, C.horas
		INTO 	nivel_curso, tipo_curso, horas_curso
		FROM 	cursos C
		WHERE	C.codigo = cod_curso;
		
		--Cogemos el importe
		SELECT	C.importe
		INTO	importe_curso
		FROM	Cuotas C
		WHERE	C.nivel = nivel_curso
		AND		C.tipo = tipo_curso;
		
		--Si es particular multiplicamos por hora
		IF (tipo_curso = 'Particular') THEN
			importe_curso := importe_curso * horas_curso;
		END IF;
		
		--Si es antiguo alumno, se le hace un 5% de descuento
		IF (es_antiguo_alumno) THEN
			importe_curso := importe_curso * 0.95;
			
			INSERT INTO inscripciones VALUES (cod_curso, id_estudiante, importe_curso, 1);
		ELSE
			INSERT INTO inscripciones VALUES (cod_curso, id_estudiante, importe_curso, 0);
		END IF;
		
		dbms_output.put_line ('INSCRIPCION REALIZADA CON ÉXITO');
	END IF;
	
END;
--Ejemplo de ejecucion
EXEC inscribir('C3', 'b', FALSE);

CREATE OR REPLACE PROCEDURE lista_inscripciones (min_inscripciones NUMBER)
IS
	CURSOR cursor_inscripciones
	IS
	SELECT 		C.codigo, C.nombre, C.nivel, Count(*) AS Inscripciones, SUM (I.importe) AS Total_Recaudado
	FROM 		inscripciones I, Cursos C
	WHERE		I.codigo = C.codigo
	GROUP BY	C.Codigo, C.nombre, C.nivel
	HAVING 		Count(*) > min_inscripciones
	ORDER BY 	C.nivel;
BEGIN
	FOR rInscripciones IN cursor_inscripciones LOOP
		dbms_output.put_line ('CODIGO: ' || rInscripciones.codigo || ', NOMBRE: ' || rInscripciones.nombre || ', NIVEL: ' || rInscripciones.nivel || ', NUMERO_INSCRIPCIONES: ' || rInscripciones.Inscripciones || ', TOTAL_RECAUDADO: ' || rInscripciones.Total_Recaudado);
	END LOOP;
END;
--Ejemplo de ejecucion
EXEC lista_inscripciones(0);



-- Ejercicio 2

create or replace TRIGGER logBorrados
AFTER DELETE
ON ComisionCC
FOR EACH ROW
DECLARE
	v_cc	deposito.cc%TYPE;
BEGIN
	SELECT	D.cc  INTO v_cc
	FROM	deposito D
	WHERE	D.cc = :OLD.cc;
	
	IF (v_cc IS NOT NULL) THEN
		INSERT INTO log VALUES ('DEPOSITO ASOCIADO # ' || :OLD.cc || ' # ' || :OLD.importe);
    dbms_output.put_line ('La cuenta corriente de la comision borrada SI tiene deposito asociado');
	END IF;
  
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      INSERT INTO log VALUES ('Cliente preferente');
      dbms_output.put_line ('La cuenta corriente de la comision borrada NO tiene deposito');
  
END;




-- Ejercicio 3

create or replace TRIGGER actualizaRecord
BEFORE INSERT
ON MARCAS
FOR EACH ROW
DECLARE
	v_prueba	Marcas.prueba%TYPE;
	v_tiempo	Marcas.tiempo%TYPE;
BEGIN
	SELECT	R.prueba, R.tiempo INTO	v_prueba, v_tiempo
	FROM	Records R
	WHERE	R.prueba = :NEW.prueba;
	
	IF (:NEW.tiempo < v_tiempo) THEN
		UPDATE Records R SET R.tiempo = :NEW.tiempo WHERE R.prueba = :NEW.prueba;
    dbms_output.put_line ('Récord de la prueba actualizado');
  ELSE
    dbms_output.put_line ('La marca insertada no mejora el récord de la prueba');
	END IF;
  
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      INSERT INTO Records VALUES (:NEW.prueba, :NEW.tiempo);
      dbms_output.put_line ('No había records de esa prueba y se añadió uno nuevo.');
  
END;



-- Ejercicio 4

CREATE OR REPLACE TRIGGER anyadeLibro
BEFORE INSERT
ON Ejemplares
FOR EACH ROW
DECLARE
	v_isbn	Libros.isbn%TYPE;
BEGIN
	SELECT	L.isbn INTO	v_isbn
	FROM	Libros L
	WHERE	L.isbn = :NEW.isbn;
	
	IF (v_isbn IS NOT NULL) THEN
		UPDATE Libros L SET L.copias = (L.copias + 1);
	END IF;
  
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      INSERT INTO Libros VALUES (:NEW.isbn, 1);
      dbms_output.put_line ('Ese isbn no existía en la tabla Libros y ha sido añadido');
  
END;