# Using a Claim in a Pod

Storage classes are used to give control over how storage is configured.

Add the storage class name and then apply via kubectl.

## Understanding "State"

State is data created and used by your application which must not be lost
* User generated data, user accounts, etc.
    * Often stored in databases but could also be files.
* Intermediate results derived by the app
    * Often stored in memory or temporary database tables or files.
* Volumes are needed to persist the data. This is why we use volumes.
