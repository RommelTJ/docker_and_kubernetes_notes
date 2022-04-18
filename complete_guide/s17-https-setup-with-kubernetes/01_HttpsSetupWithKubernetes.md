# HTTPS Setup with Kubernetes

## HTTPS Setup Overview

* Buying a domain name is not free.
* HTTPS will be setup with LetsEncrypt.
  * Kubernetes cluster will issue a request to LetsEncrypt for a certificate.
  * LetsEncrypt issues a request to the cluster to verify the request on a specific route.
  * If it all checks out, LetsEncrypt issues a certificate for 90 days.
