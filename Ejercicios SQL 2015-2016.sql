-- #####################
-- Ejercicio 2.1
-- #####################
-- Creacion de un usuario

-- USER SQL
CREATE USER usuario1 IDENTIFIED BY null 
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- ROLES

-- SYSTEM PRIVILEGES
GRANT CREATE TRIGGER TO usuario1 ;
GRANT ALTER SESSION TO usuario1 ;
GRANT CREATE MATERIALIZED VIEW TO usuario1 ;
GRANT CREATE VIEW TO usuario1 ;
GRANT CREATE SESSION TO usuario1 ;
GRANT CREATE TABLE TO usuario1 ;
GRANT CREATE SEQUENCE TO usuario1 ;
GRANT CREATE PROCEDURE TO usuario1 ;

-- QUOTAS
ALTER USER usuario1 QUOTA 100M ON USERS;



-- #####################
-- Ejercicio 3.1
-- #####################
/*
       TS# NAME                           INCLUDED_IN_DATABASE_BACKUP BIGFILE FLASHBACK_ON ENCRYPT_IN_BACKUP
---------- ------------------------------ --------------------------- ------- ------------ -----------------
         0 SYSTEM                         YES                         NO      YES                            
         1 SYSAUX                         YES                         NO      YES                            
         2 UNDOTBS1                       YES                         NO      YES                            
         4 USERS                          YES                         NO      YES                            
         3 TEMP                           NO                          NO      YES                            
*/




-- #####################
-- Ejercicio 3.2
-- #####################
/*
     FILE# CREATION_CHANGE# CREATION_TIME        TS#     RFILE# STATUS  ENABLED    CHECKPOINT_CHANGE# CHECKPOINT_TIME UNRECOVERABLE_CHANGE# UNRECOVERABLE_TIME LAST_CHANGE# LAST_TIME OFFLINE_CHANGE# ONLINE_CHANGE# ONLINE_TIME      BYTES     BLOCKS CREATE_BYTES BLOCK_SIZE NAME                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              PLUGGED_IN BLOCK1_OFFSET AUX_NAME                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          FIRST_NONLOGGED_SCN FIRST_NONLOGGED_TIME FOREIGN_DBID FOREIGN_CREATION_CHANGE# FOREIGN_CREATION_TIME PLUGGED_READONLY PLUGIN_CHANGE# PLUGIN_RESETLOGS_CHANGE# PLUGIN_RESETLOGS_TIME
---------- ---------------- ------------- ---------- ---------- ------- ---------- ------------------ --------------- --------------------- ------------------ ------------ --------- --------------- -------------- ----------- ---------- ---------- ------------ ---------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------- ------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ------------------- -------------------- ------------ ------------------------ --------------------- ---------------- -------------- ------------------------ ---------------------
         1                7 13/08/09               0          1 SYSTEM  READ WRITE             826647 27/10/15                            0                                                    754487         754488 07/08/15     713031680      87040            0       8192 /u01/app/oracle/oradata/orcl/system01.dbf                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  0          8192 NONE                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                0                                 0                        0                       NO                            0                        0                       
         2             2164 13/08/09               1          2 ONLINE  READ WRITE             826647 27/10/15                            0                                                    754487         754488 07/08/15     524288000      64000            0       8192 /u01/app/oracle/oradata/orcl/sysaux01.dbf                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  0          8192 NONE                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                0                                 0                        0                       NO                            0                        0                       
         3           752002 13/08/09               2          3 ONLINE  READ WRITE             826647 27/10/15                            0                                                    754487         754488 07/08/15      94371840      11520            0       8192 /u01/app/oracle/oradata/orcl/undotbs01.dbf                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 0          8192 NONE                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                0                                 0                        0                       NO                            0                        0                       
         4            18243 13/08/09               4          4 ONLINE  READ WRITE             826647 27/10/15                            0                                                    754487         754488 07/08/15       5242880        640            0       8192 /u01/app/oracle/oradata/orcl/users01.dbf                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   0          8192 NONE                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                0                                 0                        0                       NO                            0                        0                       

-rw-r----- 1 oracle oinstall   9748480 oct 27 19:59 control01.ctl
-rw-r----- 1 oracle oinstall  52429312 oct 27 19:11 redo01.log
-rw-r----- 1 oracle oinstall  52429312 oct 27 19:11 redo02.log
-rw-r----- 1 oracle oinstall  52429312 oct 27 19:58 redo03.log
-rw-r----- 1 oracle oinstall 524296192 oct 27 19:58 sysaux01.dbf
-rw-r----- 1 oracle oinstall 713039872 oct 27 19:58 system01.dbf
-rw-r----- 1 oracle oinstall  30416896 oct 27 19:12 temp01.dbf
-rw-r----- 1 oracle oinstall  94380032 oct 27 19:57 undotbs01.dbf
-rw-r----- 1 oracle oinstall   5251072 oct 27 19:47 users01.dbf
*/



-- #####################
-- Ejercicio 3.3a
-- #####################
/*
OWNER                          SEGMENT_NAME                                                                      PARTITION_NAME                 SEGMENT_TYPE       SEGMENT_SUBTYPE TABLESPACE_NAME                HEADER_FILE HEADER_BLOCK      BYTES     BLOCKS    EXTENTS INITIAL_EXTENT NEXT_EXTENT MIN_EXTENTS MAX_EXTENTS   MAX_SIZE RETENTION MINRETENTION PCT_INCREASE  FREELISTS FREELIST_GROUPS RELATIVE_FNO BUFFER_POOL FLASH_CACHE CELL_FLASH_CACHE
------------------------------ --------------------------------------------------------------------------------- ------------------------------ ------------------ --------------- ------------------------------ ----------- ------------ ---------- ---------- ---------- -------------- ----------- ----------- ----------- ---------- --------- ------------ ------------ ---------- --------------- ------------ ----------- ----------- ----------------
SCOTT                          DEPT                                                                                                             TABLE              ASSM            USERS                                    4          130      65536          8          1          65536     1048576           1  2147483645 2147483645                                                                           4 DEFAULT     DEFAULT     DEFAULT          
SCOTT                          EMP                                                                                                              TABLE              ASSM            USERS                                    4          146      65536          8          1          65536     1048576           1  2147483645 2147483645                                                                           4 DEFAULT     DEFAULT     DEFAULT          
SCOTT                          SALGRADE                                                                                                         TABLE              ASSM            USERS                                    4          162      65536          8          1          65536     1048576           1  2147483645 2147483645                                                                           4 DEFAULT     DEFAULT     DEFAULT          
USUARIO1                       ZIPCODES                                                                                                         TABLE              ASSM            USERS                                    4          170      65536          8          1          65536     1048576           1  2147483645 2147483645                                                                           4 DEFAULT     DEFAULT     DEFAULT          
USUARIO1                       EMPLOYEES                                                                                                        TABLE              ASSM            USERS                                    4          186      65536          8          1          65536     1048576           1  2147483645 2147483645                                                                           4 DEFAULT     DEFAULT     DEFAULT          
USUARIO1                       PARTS                                                                                                            TABLE              ASSM            USERS                                    4          202      65536          8          1          65536     1048576           1  2147483645 2147483645                                                                           4 DEFAULT     DEFAULT     DEFAULT          
USUARIO1                       CUSTOMERS                                                                                                        TABLE              ASSM            USERS                                    4          218      65536          8          1          65536     1048576           1  2147483645 2147483645                                                                           4 DEFAULT     DEFAULT     DEFAULT          
USUARIO1                       ORDERS                                                                                                           TABLE              ASSM            USERS                                    4          234      65536          8          1          65536     1048576           1  2147483645 2147483645                                                                           4 DEFAULT     DEFAULT     DEFAULT          
USUARIO1                       ODETAILS                                                                                                         TABLE              ASSM            USERS                                    4          250      65536          8          1          65536     1048576           1  2147483645 2147483645                                                                           4 DEFAULT     DEFAULT     DEFAULT          
USUARIO1                       CATALOG                                                                                                          TABLE              ASSM            USERS                                    4          266      65536          8          1          65536     1048576           1  2147483645 2147483645                                                                           4 DEFAULT     DEFAULT     DEFAULT          
USUARIO1                       STUDENTS                                                                                                         TABLE              ASSM            USERS                                    4          282      65536          8          1          65536     1048576           1  2147483645 2147483645                                                                           4 DEFAULT     DEFAULT     DEFAULT          
USUARIO1                       COURSES                                                                                                          TABLE              ASSM            USERS                                    4          298      65536          8          1          65536     1048576           1  2147483645 2147483645                                                                           4 DEFAULT     DEFAULT     DEFAULT          
USUARIO1                       COMPONENTS                                                                                                       TABLE              ASSM            USERS                                    4          314      65536          8          1          65536     1048576           1  2147483645 2147483645                                                                           4 DEFAULT     DEFAULT     DEFAULT          
USUARIO1                       ENROLLS                                                                                                          TABLE              ASSM            USERS                                    4          330      65536          8          1          65536     1048576           1  2147483645 2147483645                                                                           4 DEFAULT     DEFAULT     DEFAULT          
USUARIO1                       SCORES                                                                                                           TABLE              ASSM            USERS                                    4          346      65536          8          1          65536     1048576           1  2147483645 2147483645                                                                           4 DEFAULT     DEFAULT     DEFAULT          
SCOTT                          PK_DEPT                                                                                                          INDEX              ASSM            USERS                                    4          138      65536          8          1          65536     1048576           1  2147483645 2147483645                                                                           4 DEFAULT     DEFAULT     DEFAULT          
SCOTT                          PK_EMP                                                                                                           INDEX              ASSM            USERS                                    4          154      65536          8          1          65536     1048576           1  2147483645 2147483645                                                                           4 DEFAULT     DEFAULT     DEFAULT          
USUARIO1                       SYS_C0010797                                                                                                     INDEX              ASSM            USERS                                    4          178      65536          8          1          65536     1048576           1  2147483645 2147483645                                                                           4 DEFAULT     DEFAULT     DEFAULT          
USUARIO1                       SYS_C0010799                                                                                                     INDEX              ASSM            USERS                                    4          194      65536          8          1          65536     1048576           1  2147483645 2147483645                                                                           4 DEFAULT     DEFAULT     DEFAULT          
USUARIO1                       SYS_C0010804                                                                                                     INDEX              ASSM            USERS                                    4          210      65536          8          1          65536     1048576           1  2147483645 2147483645                                                                           4 DEFAULT     DEFAULT     DEFAULT          
USUARIO1                       SYS_C0010806                                                                                                     INDEX              ASSM            USERS                                    4          226      65536          8          1          65536     1048576           1  2147483645 2147483645                                                                           4 DEFAULT     DEFAULT     DEFAULT          
USUARIO1                       SYS_C0010809                                                                                                     INDEX              ASSM            USERS                                    4          242      65536          8          1          65536     1048576           1  2147483645 2147483645                                                                           4 DEFAULT     DEFAULT     DEFAULT          
USUARIO1                       SYS_C0010815                                                                                                     INDEX              ASSM            USERS                                    4          258      65536          8          1          65536     1048576           1  2147483645 2147483645                                                                           4 DEFAULT     DEFAULT     DEFAULT          
USUARIO1                       SYS_C0010819                                                                                                     INDEX              ASSM            USERS                                    4          274      65536          8          1          65536     1048576           1  2147483645 2147483645                                                                           4 DEFAULT     DEFAULT     DEFAULT          
USUARIO1                       SYS_C0010822                                                                                                     INDEX              ASSM            USERS                                    4          290      65536          8          1          65536     1048576           1  2147483645 2147483645                                                                           4 DEFAULT     DEFAULT     DEFAULT          
USUARIO1                       SYS_C0010830                                                                                                     INDEX              ASSM            USERS                                    4          306      65536          8          1          65536     1048576           1  2147483645 2147483645                                                                           4 DEFAULT     DEFAULT     DEFAULT          
USUARIO1                       SYS_C0010838                                                                                                     INDEX              ASSM            USERS                                    4          322      65536          8          1          65536     1048576           1  2147483645 2147483645                                                                           4 DEFAULT     DEFAULT     DEFAULT          
USUARIO1                       SYS_C0010843                                                                                                     INDEX              ASSM            USERS                                    4          338      65536          8          1          65536     1048576           1  2147483645 2147483645                                                                           4 DEFAULT     DEFAULT     DEFAULT          
USUARIO1                       SYS_C0010851                                                                                                     INDEX              ASSM            USERS                                    4          354      65536          8          1          65536     1048576           1  2147483645 2147483645                                                                           4 DEFAULT     DEFAULT     DEFAULT          

 29 filas seleccionadas 

*/

SELECT DISTINCT SEGMENT_TYPE FROM dba_segments where TABLESPACE_NAME IS NOT NULL;

/*
SEGMENT_TYPE     
------------------
LOBINDEX           
INDEX PARTITION    
TABLE PARTITION    
NESTED TABLE       
ROLLBACK           
LOB PARTITION      
LOBSEGMENT         
INDEX              
TABLE              
CLUSTER            
TYPE2 UNDO         

 11 filas seleccionadas 

*/



-- #####################
-- Ejercicio 3.3b
-- #####################
/*
Averiguar el byte exacto en el que empieza el extent
*/
select e.block_id * e.bytes AS CONCRETE_BYTE_START
from dba_extents e
where owner = 'USUARIO1' 
and segment_name='MITABLA';

/*
CONCRETE_BYTE_START
-------------------
           23592960 
           24117248 
           24641536 

*/




-- #####################
-- Ejercicio 3.3c
-- #####################
select e.owner, e.segment_name, e.segment_type, e.tablespace_name, e.extent_id, e.file_id, df.name 
from dba_extents e, v$datafile df
where owner = 'USUARIO1' 
and segment_name='MITABLA'
and e.file_id = df.file#;

/*
OWNER                          SEGMENT_NAME                                                                      SEGMENT_TYPE       TABLESPACE_NAME                 EXTENT_ID    FILE_ID NAME                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
------------------------------ --------------------------------------------------------------------------------- ------------------ ------------------------------ ---------- ---------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
USUARIO1                       MITABLA                                                                           TABLE              USERS                                   0          4 /u01/app/oracle/oradata/orcl/users01.dbf                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
USUARIO1                       MITABLA                                                                           TABLE              USERS                                   2          4 /u01/app/oracle/oradata/orcl/users01.dbf                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
USUARIO1                       MITABLA                                                                           TABLE              USERS                                   1          4 /u01/app/oracle/oradata/orcl/users01.dbf                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
*/



-- #####################
-- Ejercicio 3.4b
-- #####################
/*
oracle@ubuntu32vb:~$ ls -l /u01/app/oracle/oradata/orcl
total 1472860
-rw-r----- 1 oracle oinstall   9748480 nov  3 19:37 control01.ctl
-rw-r----- 1 oracle oinstall   1056768 oct 29 17:00 midf01.dbf
-rw-r----- 1 oracle oinstall  52429312 nov  3 19:37 redo01.log
-rw-r----- 1 oracle oinstall  52429312 oct 29 14:12 redo02.log
-rw-r----- 1 oracle oinstall  52429312 oct 29 15:00 redo03.log
-rw-r----- 1 oracle oinstall 524296192 nov  3 19:36 sysaux01.dbf
-rw-r----- 1 oracle oinstall 713039872 nov  3 19:37 system01.dbf
-rw-r----- 1 oracle oinstall  30416896 nov  3 19:11 temp01.dbf
-rw-r----- 1 oracle oinstall  94380032 nov  3 19:35 undotbs01.dbf
-rw-r----- 1 oracle oinstall   5251072 oct 29 16:45 users01.dbf




SELECT * FROM v$tablespace;

       TS# NAME                           INC BIG FLA ENC
---------- ------------------------------ --- --- --- ---
         0 SYSTEM                         YES NO  YES    
         1 SYSAUX                         YES NO  YES    
         2 UNDOTBS1                       YES NO  YES    
         4 USERS                          YES NO  YES    
         3 TEMP                           NO  NO  YES    
         6 MITBS                          YES NO  YES    

 6 filas seleccionadas 




SELECT * FROM v$datafile;

     FILE#                        CREATION_CHANGE# CREATION_TIME        TS#     RFILE# STATUS  ENABLED                         CHECKPOINT_CHANGE# CHECKPOINT_TIME                   UNRECOVERABLE_CHANGE# UNRECOVERABLE_TIME                            LAST_CHANGE# LAST_TIME                         OFFLINE_CHANGE#                          ONLINE_CHANGE# ONLINE_TIME      BYTES     BLOCKS                            CREATE_BYTES BLOCK_SIZE NAME                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              PLUGGED_IN                           BLOCK1_OFFSET AUX_NAME                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              FIRST_NONLOGGED_SCN FIRST_NONLOGGED_TIME                            FOREIGN_DBID                FOREIGN_CREATION_CHANGE# FOREIGN_CREATION_TIME PLU                          PLUGIN_CHANGE#                PLUGIN_RESETLOGS_CHANGE# PLUGIN_RESETLOGS_TIME
---------- --------------------------------------- ------------- ---------- ---------- ------- ---------- --------------------------------------- --------------- --------------------------------------- ------------------ --------------------------------------- --------- --------------------------------------- --------------------------------------- ----------- ---------- ---------- --------------------------------------- ---------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------- --------------------------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --------------------------------------- -------------------- --------------------------------------- --------------------------------------- --------------------- --- --------------------------------------- --------------------------------------- ---------------------
         1                                       7 13/08/09               0          1 SYSTEM  READ WRITE                                  830332 29/10/15                                              0                                                                                                       754487                                  754488 07/08/15     713031680      87040                                       0       8192 /u01/app/oracle/oradata/orcl/system01.dbf                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  0                                    8192 NONE                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    0                                                            0                                       0                       NO                                        0                                       0                      
         2                                    2164 13/08/09               1          2 ONLINE  READ WRITE                                  830332 29/10/15                                              0                                                                                                       754487                                  754488 07/08/15     524288000      64000                                       0       8192 /u01/app/oracle/oradata/orcl/sysaux01.dbf                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  0                                    8192 NONE                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    0                                                            0                                       0                       NO                                        0                                       0                      
         3                                  752002 13/08/09               2          3 ONLINE  READ WRITE                                  830332 29/10/15                                              0                                                                                                       754487                                  754488 07/08/15      94371840      11520                                       0       8192 /u01/app/oracle/oradata/orcl/undotbs01.dbf                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 0                                    8192 NONE                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    0                                                            0                                       0                       NO                                        0                                       0                      
         4                                   18243 13/08/09               4          4 ONLINE  READ WRITE                                  830332 29/10/15                                              0                                                                                                       754487                                  754488 07/08/15       5242880        640                                       0       8192 /u01/app/oracle/oradata/orcl/users01.dbf                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   0                                    8192 NONE                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    0                                                            0                                       0                       NO                                        0                                       0                      
         5                                  834718 29/10/15               6          5 ONLINE  READ WRITE                                  834719 29/10/15                                              0                                                                                                            0                                       0                1048576        128                                 1048576       8192 /u01/app/oracle/oradata/orcl/midf01.dbf                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    0                                    8192 NONE                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    0                                                            0                                       0                       NO                                        0                                       0                      


*/



-- #####################
-- Ejercicio 3.4c
-- #####################
select * from dba_extents where
segment_name='MITBL';


-- #####################
-- Ejercicio 3.4d
-- #####################
/*
Error que empieza en la línea: 1 del comando :
INSERT INTO mitbl (select 'esto es un texto repetido muchas veces' from dual connect by level <= 10000)
Informe de error -
Error SQL: ORA-01653: no se ha podido ampliar la tabla SYSTEM.MITBL con 8 en el tablespace MITBS
01653. 00000 -  "unable to extend table %s.%s by %s in tablespace %s"
*Cause:    Failed to allocate an extent of the required number of blocks for
           a table segment in the tablespace indicated.
*Action:   Use ALTER TABLESPACE ADD DATAFILE statement to add one or more
           files to the tablespace indicated.
		   
¿POR QUÉ?
Porque...
*/		   

-- #####################
-- Ejercicio 4
-- #####################
/*
oracle@ubuntu32vb:~$ ls -l /u01/app/oracle/oradata/orcl
total 1472860
-rw-r----- 1 oracle oinstall   9748480 nov  3 19:37 control01.ctl			*****CONTROLFILE*****
-rw-r----- 1 oracle oinstall   1056768 oct 29 17:00 midf01.dbf
-rw-r----- 1 oracle oinstall  52429312 nov  3 19:37 redo01.log				*****REDO*****
-rw-r----- 1 oracle oinstall  52429312 oct 29 14:12 redo02.log				*****REDO*****
-rw-r----- 1 oracle oinstall  52429312 oct 29 15:00 redo03.log				*****REDO*****
-rw-r----- 1 oracle oinstall 524296192 nov  3 19:36 sysaux01.dbf
-rw-r----- 1 oracle oinstall 713039872 nov  3 19:37 system01.dbf
-rw-r----- 1 oracle oinstall  30416896 nov  3 19:11 temp01.dbf
-rw-r----- 1 oracle oinstall  94380032 nov  3 19:35 undotbs01.dbf
-rw-r----- 1 oracle oinstall   5251072 oct 29 16:45 users01.dbf
*/


-- #####################
-- Ejercicio 4.1
-- #####################
/*
STATUS  NAME                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              IS_ BLOCK_SIZE                          FILE_SIZE_BLKS
------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --- ---------- ---------------------------------------
        /u01/app/oracle/oradata/orcl/control01.ctl                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        NO       16384                                     594
        /u01/app/oracle/flash_recovery_area/orcl/control02.ctl                                                                                                                                                                                                                                                                                                                                                                                                                                                                            NO       16384                                     594
*/

-- #####################
-- Ejercicio 4.2b
-- #####################
-- 3 grupos, 1 fichero por grupo


-- #####################
-- Ejercicio 4.2c
-- #####################
