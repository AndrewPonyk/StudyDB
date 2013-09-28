
 EXEC DBMS_SCHEDULER.CREATE_PROGRAM(
                        PROGRRAM_NAME=>'JAVA_APP',
                        PROGRAM_TYPE=>'EXECUTABLE',
                        PROGRAM_ACTION=>'D:\Gui).JAR',
                        ENABLED=>TRUE)
                        
