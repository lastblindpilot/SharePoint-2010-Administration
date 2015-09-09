Export-SPWeb -Identity "http://infra/sites/inventory" -Path "D:\Backup\db.bak" -ItemUrl "Lists/Databases"  -IncludeVersions All 
 
 #You have a List named “L1” underneath subsite called “S1” which is a subsite of “S” (“S” has been created in “Sites” managed path). Your are running the below script which is causing the above mentioned error.
 #Export-SPWeb -Identity "http://yourdomain.com/sites/S/S1" -Path "D:\Backup\xyz.bak" -ItemUrl "/S1/Lists/L1"  -IncludeVersions All 