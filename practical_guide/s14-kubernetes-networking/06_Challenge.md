# Challenge

Which approach for pod-to-pod communication is best? 
* Depends on whether you want to have multiple containers per pod (usually not the case).
* Lookup IP vs Kubernetes env variables vs CoreDNS names.
* Domain names are the most common way because it's easier.

Challenge: Deploy Tasks API and make sure it can talk to the Auth API.
