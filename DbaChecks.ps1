#Install DbcChecks
Install-Module -name DbaChecks

#Check the backups
Invoke-DbcCheck  -Checks lastbackup

#Check the Failed Jobs
Invoke-DbcCheck -Checks failedjobs

#Check the SPNS
Invoke-DbcCheck -Checks SPN

#Check - Get the disk capacity 
Invoke-DbcCheck -Check DiskCapacity

#Check - Database Checks
Invoke-DbcCheck -Checks AutoClose, AutoShrink, LastGoodCheckDB, LogFileSize, OrphanedUser, Trustworthy

#Check - Run all available checks on every database excluding system databases
Invoke-DbcCheck -AllChecks

#Check - This will get all the commands used
Get-DbcCheck | Out-GridView

#PowerBi - Clear the data from the json file used by the power bi dashboard
Clear-DbcPowerBiDataSource

#PowerBi - Update the power bi dashboard
Invoke-DbcCheck -AllChecks -passthru |  Update-DbcPowerBiDataSource

#PowerBi - This will start Power Bi Dashboard
Start-DbcPowerBi

#Config - Set the computer we want to run on, comma seperated is fine if you have many, make sure though you have permission.
Set-DbcConfig app.computername computername

#Config - Set the instance we want to run against, comma seperated is fine.
Set-DbcConfig app.sqlinstance localhost

#Config - Set the database we want to eclude from checking on every check
Set-DbcConfig command.invokedbccheck.excludedatabases StackOverflow2010 

#Config - Update the Dba Checks Module and supporting modules
Update-Dbchecks

#Config - This will get the current config
Get-DbcConfig | Out-GridView
