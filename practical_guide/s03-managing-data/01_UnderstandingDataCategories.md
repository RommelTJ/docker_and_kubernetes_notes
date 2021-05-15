# Understanding Data Categories

## Read-only data

Application (code + environment)  
Written and provided by us  
Code copied to image and container in build phase  
Code is "fixed". Can't be changed once image is built  

## Read+Write Temporary data

User enters something in a form.  
Fetched / Produced in running container.    
Stored in memory or temporary files.  
Dynamic and changing but cleared regularly.
We are ok with losing it.  

## Permanent app data

User accounts in a database.  
Fetched / Produced in running container.  
Stored in files or a database.  
Must not be lost if container stops / restarts.    
Stored with containers and volumes.  
