--------------------------
--		APARTADO 1 		--
--------------------------
drop tablespace mitbspr including contents and datafiles;
create tablespace mitbspr datafile '/u01/app/oracle/oradata/orcl/midfpr01.dbf' size 5m extent management local autoallocate segment space management auto;

drop table viaje cascade constraints;
create table viaje (
	vid 		number(4,0),
	origen		varchar2(20),
	destino		varchar2(20),
	distancia	number(6,0),
	primary key (vid)
) tablespace mitbspr;

drop table tren cascade constraints;
create table tren (
	tid 			number(6,0),
	denominacion	varchar2(30),
	distanciamax	number(6,0),
	primary key (tid)
) tablespace mitbspr;

drop table empleado cascade constraints;
create table empleado (
	eid 		number(9,0),
	nombre		varchar2(30),
	salario		number(10,2),
	primary key (eid)
) tablespace mitbspr;

drop table acreditacion cascade constraints;
create table acreditacion (
	eid 		number(9,0) not null references empleado,
	tid			number(6,0) not null references tren,
	primary key (eid,tid)
) tablespace mitbspr;

drop table operaciones cascade constraints;
create table operaciones (
	vid 		number(4,0) not null references viaje,
	tid			number(6,0) not null references tren,
	primary key (vid, tid)
) tablespace mitbspr;








--------------------------
--		APARTADO 2 		--
--------------------------
-- Tipo A:
-- Creamos el usuario
DROP USER usu_consulta ;
CREATE USER usu_consulta IDENTIFIED BY adbd 
DEFAULT TABLESPACE "MITBSPR"
TEMPORARY TABLESPACE "TEMP";

--Creamos un rol para el tipo A
DROP ROLE tipo_a;
CREATE ROLE tipo_a;

-- Concedemos permisos para el rol: Conexión y consulta de las tablas
-- REVOKE ALL FROM tipo_a  ;
GRANT CREATE SESSION TO tipo_a ;
GRANT SELECT ON TREN TO  tipo_a ;
GRANT SELECT ON VIAJE TO  tipo_a ;
GRANT SELECT ON ACREDITACION TO  tipo_a ;
GRANT SELECT ON EMPLEADO TO  tipo_a ;
GRANT SELECT ON OPERACIONES TO  tipo_a ;
GRANT EXECUTE ANY PROCEDURE TO tipo_a ;
GRANT EXECUTE ANY FUNCTION TO tipo_a ;
--REVOKE ALTER ON ANY TABLE FROM  tipo_b;
--REVOKE CREATE ON ANY TABLE FROM  tipo_b;
/* ***************************************
GRANT CREATE SESSION TO usu_consulta ;
GRANT SELECT ON TREN TO  usu_consulta ;
GRANT SELECT ON VIAJE TO  usu_consulta ;
GRANT SELECT ON ACREDITACION TO  usu_consulta ;
GRANT SELECT ON EMPLEADO TO  usu_consulta ;
GRANT SELECT ON OPERACIONES TO  usu_consulta ;
GRANT EXECUTE ANY PROCEDURE TO usu_consulta ;
GRANT EXECUTE ANY FUNCTION TO usu_consulta ;
****************************************/

-- Metemos al usuario en el rol
GRANT tipo_a TO usu_consulta;

--Activamos el ROL
SET role tipo_a;


-- Tipo B:
-- Creamos el usuario
DROP USER usu_mtmto;
CREATE USER usu_mtmto IDENTIFIED BY adbd 
DEFAULT TABLESPACE "MITBSPR"
TEMPORARY TABLESPACE "TEMP";

-- Creamos el rol del tipo B
DROP ROLE tipo_b;
CREATE ROLE tipo_b;

-- Concedemos permisos al rol: alta, baja, modificacion y consulta
-- tren, viaje y acreditacion. Ejecucion de procedimientos y funciones
-- y la conexion, claro.
-- REVOKE ALL FROM tipo_b  ;
GRANT CREATE SESSION TO tipo_b ;
--GRANT CREATE PROCEDURE TO tipo_b ;			NO SE PIDE
GRANT EXECUTE ANY PROCEDURE TO tipo_b ;
GRANT EXECUTE ANY FUNCTION TO tipo_b ;
GRANT SELECT ON TREN TO  tipo_b ;
GRANT SELECT ON VIAJE TO  tipo_b ;
GRANT SELECT ON ACREDITACION TO  tipo_b ;
GRANT SELECT ON EMPLEADO TO  tipo_b ;
--REVOKE UPDATE ON EMPLEADO FROM  tipo_b ;
--REVOKE INSERT ON EMPLEADO FROM  tipo_b ;
--REVOKE ALTER ON ANY TABLE FROM  tipo_b;
--REVOKE CREATE ON ANY TABLE FROM  tipo_b;
GRANT UPDATE ON TREN TO tipo_b ;
GRANT UPDATE ON VIAJE TO tipo_b ;
GRANT UPDATE ON ACREDITACION TO tipo_b ;
GRANT DELETE ON TREN TO tipo_b ;
GRANT DELETE ON VIAJE TO tipo_b ;
GRANT DELETE ON ACREDITACION TO tipo_b ;
GRANT INSERT ON TREN TO tipo_b ;
GRANT INSERT ON VIAJE TO tipo_b ;
GRANT INSERT ON ACREDITACION TO tipo_b ;
/* ***************************************
GRANT CREATE SESSION TO usu_mtmto ;
GRANT CREATE PROCEDURE TO usu_mtmto ;
GRANT EXECUTE ANY PROCEDURE TO usu_mtmto ;
GRANT EXECUTE ANY FUNCTION TO usu_mtmto ;
GRANT SELECT ON TREN TO  usu_mtmto ;
GRANT SELECT ON VIAJE TO  usu_mtmto ;
GRANT SELECT ON ACREDITACION TO  usu_mtmto ;
GRANT SELECT ON EMPLEADO TO  usu_mtmto ;
GRANT UPDATE ON TREN TO usu_mtmto ;
GRANT UPDATE ON VIAJE TO usu_mtmto ;
GRANT UPDATE ON ACREDITACION TO usu_mtmto ;
GRANT DELETE ON TREN TO usu_mtmto ;
GRANT DELETE ON VIAJE TO usu_mtmto ;
GRANT DELETE ON ACREDITACION TO usu_mtmto ;
GRANT INSERT ON TREN TO usu_mtmto ;
GRANT INSERT ON VIAJE TO usu_mtmto ;
GRANT INSERT ON ACREDITACION TO usu_mtmto ;
****************************************/

-- Metemos al usuario en el rol
GRANT tipo_b TO usu_mtmto;

--Activamos el ROL
SET role tipo_b;


-- Tipo H:
-- Creamos el usuario
DROP USER usu_rrhh;
CREATE USER usu_rrhh IDENTIFIED BY adbd 
DEFAULT TABLESPACE "MITBSPR"
TEMPORARY TABLESPACE "TEMP";

--Creamos un rol para el tipo H
DROP ROLE tipo_h;
CREATE ROLE tipo_h;

-- Concedemos permisos para el rol: Conexión, ejecucion de procedimientos 
-- y funciones, y alta, modificacion y consulta de empleados
-- REVOKE ALL FROM tipo_h  ;
GRANT CREATE SESSION TO tipo_h ;
--GRANT CREATE PROCEDURE TO tipo_h ;				NO SE PIDE
GRANT EXECUTE ANY PROCEDURE TO tipo_h ;
GRANT EXECUTE ANY FUNCTION TO tipo_h ;
GRANT SELECT ON EMPLEADO TO  tipo_h ;
GRANT INSERT ON TREN TO tipo_h ;
GRANT UPDATE ON EMPLEADO TO tipo_h ;
--REVOKE ALTER ON ANY TABLE FROM  tipo_b;
--REVOKE CREATE ON ANY TABLE FROM  tipo_b;
/* ***************************************
GRANT CREATE SESSION TO usu_rrhh ;
GRANT CREATE PROCEDURE TO usu_rrhh ;
GRANT EXECUTE ANY PROCEDURE TO usu_rrhh ;
GRANT EXECUTE ANY FUNCTION TO usu_rrhh ;
GRANT SELECT ON EMPLEADO TO  usu_rrhh ;
GRANT INSERT ON TREN TO usu_rrhh ;
GRANT UPDATE ON EMPLEADO TO usu_rrhh ;
****************************************/

-- Metemos al usuario en el rol
GRANT tipo_h TO usu_rrhh;

--Activamos el ROL
SET role tipo_h;










--------------------------
--		APARTADO 3 		--
--------------------------
CREATE OR REPLACE PROCEDURE viajesDelEmpleado (emp_id NUMBER)
IS
	v_total		INTEGER;
	v_suma		INTEGER;
	CURSOR 		cursor_viajes
	IS
	SELECT 		V.vid, V.origen, V.destino, V.distnacia
	FROM 		Acreditacion A, Operaciones O, Viaje V
	WHERE		A.tid = O.tid
	AND			O.vid = V.vid
	FOR UPDATE;
BEGIN
	dbms_output.put_line ('****************************************************************************************');
	FOR rViajes IN cursor_viajes LOOP
		dbms_output.put_line ('ID: ' || rViajes.id || ' -- ORIGEN: ' || rViajes.origen || ' -- DESTINO: ' || rViajes.destino || ' -- DISTANCIA: ' || rViajes.distancia || 'Km.');
	END LOOP;
	dbms_output.put_line ('****************************************************************************************');
	
	SELECT COUNT(*), SUM(salario) INTO v_total, v_suma FROM Viaje FOR UPDATE;
	dbms_output.put_line ('TOTAL DE VUELOS: ' || v_total);
	dbms_output.put_line ('****************************************************************************************');
	dbms_output.put_line ('SUMA DE LOS SALARIOS: ' || v_suma);
	dbms_output.put_line ('****************************************************************************************');
	commit;
END;
--Ejemplo de ejecucion
EXEC viajesDelEmpleado(5);











--------------------------
--		APARTADO 4 		--
--------------------------
create or replace procedure generaDatosEmpleado(num_empleados integer) as
	cursor cursor_empleado is select salario from empleado for update;
begin
	--Se borran todas las filas por si hubiera datos anteriores.
	delete from acreditacion;
	delete from empleado;
	--Se insertan las  filas con salario = 0.
	insert into empleado(
		select rownum, 'Empleado - ' || to_char(rownum), 0
		from dual connect by level < num_empleados + 1);
	--Se actualiza el salario a un valor aleatorio.
	for r_empleado in cursor_empleado loop
		update empleado set salario = round(dbms_random.value(20000,100000))
			where current of cursor_empleado;
	end loop;
	commit;
end;
--Ejemplo de ejecucion
EXEC generaDatosEmpleado(10);

create or replace procedure generaDatosViaje(num_viajes integer) as
	cursor cursor_viaje is select distancia from viaje for update;
begin
	--Se borran todas las filas por si hubiera datos anteriores.
	delete from viaje;
	delete from operaciones;
	--Se insertan las  filas con distancia = 0
	insert into viaje(
		select rownum, 'Origen - ' || to_char(rownum), 'Destino - ' || to_char(rownum), 0
		from dual connect by level < num_viajes + 1);
	--Se actualiza la distancia a un valor aleatorio.
	for r_viaje in cursor_viaje loop
		update viaje set distancia = round(dbms_random.value(200,2000))
			where current of cursor_viaje;
	end loop;
	commit;
end;
--Ejemplo de ejecucion
EXEC generaDatosViaje(10);

create or replace procedure generaDatosTren(num_trenes integer) as
	cursor cursor_tren is select distanciamax from tren for update;
begin
	--Se borran todas las filas por si hubiera datos anteriores.
	delete from tren;
	delete from operaciones;
	delete from acreditacion;
	--Se insertan las  filas con distancia = 0
	insert into tren(
		select rownum, 'Denominacion - ' || to_char(rownum), 0
		from dual connect by level < num_trenes + 1);
	--Se actualiza la distancia a un valor aleatorio.
	for r_tren in cursor_tren loop
		update tren set distanciamax = round(dbms_random.value(900,90000))
			where current of cursor_tren;
	end loop;
	commit;
end;
--Ejemplo de ejecucion
EXEC generaDatosTren(10);

create or replace procedure generaDatosAcreditacion(num_acre_por_emp integer) as
	cursor cursor_emp_acre is select eid from empleado for update;
begin
	--Se borran todas las filas por si hubiera datos anteriores.
	delete from acreditacion;
	
	--Se obtiene el número de trenes
	select count(*) into num_tren from tren;
	
	--Se inserta para cada empleado el numero de acreditaciones indicadas
	--con el id de empleado y un número aleatorio de entre los rowids de los trenes
	for r_acreditacion in cursor_emp_acre loop
		FOR contador IN 1..num_acre_por_emp
			insert into acreditacion VALUES (r_acreditacion.eid, round(dbms_random.value(0,num_tren+1)));
		END LOOP;
	end loop;
	commit;
end;
--Ejemplo de ejecucion
EXEC generaDatosAcreditacion(3);

create or replace procedure generaDatosOperaciones() as
	cursor cursor_op_viaje is select vid, distancia from viaje for update;
	cursor cursor_op_tren is select tid, distanciamax from tren for update;
begin
	--Se borran todas las filas por si hubiera datos anteriores.
	delete from operaciones;
	
	-- Por cada tipo
	for r_operaciones_viaje in cursor_op_viaje loop
		for r_operaciones_tren in cursor_op_tren loop
			IF 2*r_operaciones_viaje.distancia < r_operaciones_tren.distanciamax THEN 
				insert into operaciones VALUES (r_operaciones_viaje.vid, r_operaciones_tren.tid);
	end loop;
	commit;
end;
--Ejemplo de ejecucion
EXEC generaDatosOperaciones();











--------------------------
--		APARTADO 5 		--
--------------------------

-- Consulta 1

SELECT v.destino, t.tid
FROM viaje v, tren tid, operaciones o
WHERE v.origen = 'Madrid'
AND o.vid = v.vid
AND o.tid = t.tid;

-- ¿Qué usuarios de los creados anteriormente pueden ejecutar ésta consulta?
-- Tipo A: usu_consulta
-- Plan de ejecucion: SET AUTOTRACE ON;
-- CREATE INDEX origen_viaje ON viaje (origen);

SELECT v.destino, t.tid
FROM viaje v, tren tid, operaciones o
AND o.vid = v.vid
AND o.tid = t.tid
AND v.origen = (SELECT vi.origen
				FROM viaje vi
				WHERE vi.origen ='Madrid');

-- Consulta 2

SELECT e.eid, v.origen, v.destino
FROM empleado e, viaje v, acreditacion a, operaciones o 
WHERE v.vid = o.vid
AND o.tid = a.tid
AND a.eid = e.eid
AND e.salario > '50000';

-- CREATE INDEX empleado_viaja ON viaje (vid);
-- CREATE INDEX empleado_salario ON empleado (salario);

-- Consulta 3

SELECT e.nombre
FROM empleado e, acreditacion a, tren t
WHERE a.eid = a.tid
AND t.tid = a.tid
AND t.distancia > 1000
AND 1 < (SELECT count(*)
		 FROM empleado e1, acreditacion a1
		 WHERE e1.eid = a1.eid);
		 
-- CREATE INDEX distancia_tren ON tren (distancia);
