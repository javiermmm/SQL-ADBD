/*
-- 1.)
a. El codigo se ejecuta en paralelo con multiples sesiones, por lo que se puede hacer persistir el resultado de la actualizacion, 
durante la ejecucion de las consultas siguientes, en otra sesion y así ver resultados erroneos.

b. Añadiendo un select antes de las 3 select, con un FOR UPDATE para bloquear los datos afectados por las consultas posteriores.

c. Juntando, las tres selects en una sola

d. ¿todas?

e. con SET TRANSACTION READ ONLY


--2.)
----2.1
select avg(a.c1+b.c1) from mitabla a, mitabla b;


SQL> alter table usuario1.mitabla drop column c2;
alter table usuario1.mitabla drop column c2
                     *
ERROR at line 1:
ORA-00054: resource busy and acquire with NOWAIT specified or timeout expired


SQL> update usuario1.mitabla set c1=101 where c1<1000 and c1>1;

998 updated



----2.2
SELECT *													SELECT *
FROM mitabla where c1=1										FROM mitabla where c1=2
FOR UPDATE													FOR UPDATE


SELECT *													SELECT *
FROM mitabla where c1=2										FROM mitabla where c1=1
FOR UPDATE													FOR UPDATE



SQL> select * from usuario1.mitabla where c1 = 2 for update;
select * from usuario1.mitabla where c1 = 2 for update
                       *
ERROR at line 1:
ORA-00060: deadlock detected while waiting for resource



--3.)
----3.1
porque no se hace commit o rollback, es decir, las otras dos siguen esperando por las filas que necesitan;


--4.)
----4.5
SQL> archive log list
Database log mode	       Archive Mode
Automatic archival	       Enabled
Archive destination	       USE_DB_RECOVERY_FILE_DEST
Oldest online log sequence     11
Next log sequence to archive   13
Current log sequence	       13


----4.7
oracle@ubuntu32vb:~$ ls -l /u01/app/oracle/flash_recovery_area/ORCL/archivelog/2015_11_29/
total 39844
-rw-r----- 1 oracle oinstall 40797696 nov 29 18:08 o1_mf_1_13_c5pd7w4z_.arc


----4.9
SQL> select name from v$archived_log;

NAME
--------------------------------------------------------------------------------
/u01/app/oracle/flash_recovery_area/ORCL/archivelog/2015_11_29/o1_mf_1_13_c5pd7w
4z_.arc

/u01/app/oracle/flash_recovery_area/ORCL/archivelog/2015_11_29/o1_mf_1_14_c5pdv6
ck_.arc


oracle@ubuntu32vb:~$ ls -l /u01/app/oracle/flash_recovery_area/ORCL/archivelog/2015_11_29
total 40980
-rw-r----- 1 oracle oinstall 40797696 nov 29 18:08 o1_mf_1_13_c5pd7w4z_.arc
-rw-r----- 1 oracle oinstall  1159680 nov 29 18:18 o1_mf_1_14_c5pdv6ck_.arc

*/