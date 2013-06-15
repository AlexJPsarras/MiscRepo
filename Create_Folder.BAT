ACCEPT "Enter folder name:" TO v_folder

SET SAFETY OFF

DIR *.ACL to TEMP
OPEN TEMP

v_Project = REVERSE(SPLIT( REVERSE(FILE_NAME) "\" 1 ))
v_Path = SUBSTRING(FILE_NAME 1 AT( 1 v_Project FILE_NAME)-1)

SET DATE "DD-MMM-YY"
v_foldername = "%v_Path%"+"%v_folder% - " + ALLTRIM(DATE()) + " " + ALLTRIM(REPLACE(TIME() ":" "-"))

CLASSIFY ON FILE_ATTRIBUTES TO GRAPH
SAVE GRAPH to "%v_foldername%\graph.jpg"

DELETE "%v_foldername%\graph.jpg" OK
DELETE TEMP.FIL OK
DELETE FORMAT TEMP OK

PAUSE "Folder %v_foldername% created."
PAUSE "Use the variable 'v_foldername' plus a '\' to export to the folder."

SET SAFETY OFF
