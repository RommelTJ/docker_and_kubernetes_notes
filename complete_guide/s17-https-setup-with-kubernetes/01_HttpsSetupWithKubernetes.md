# HTTPS Setup with Kubernetes

## HTTPS Setup Overview

* Buying a domain name is not free.
* HTTPS will be setup with LetsEncrypt.
  * Kubernetes cluster will issue a request to LetsEncrypt for a certificate.
  * LetsEncrypt issues a request to the cluster to verify the request on a specific route.
  * If it all checks out, LetsEncrypt issues a certificate for 90 days.

## Domain Purchase

Purchase the domain.

## Domain Name Setup

On Kubernetes Google Cloud Dashboard, add the DNS settings for custom resource records to forward to the IP address
of the Kubernetes service, once for .com A-record and once for www (CNAME).

## Required Updates for Cert Manager Install

1. Create the namespace for cert-manager:  
`kubectl create namespace cert-manager`
2. Add the Jetstack Helm repository  
`helm repo add jetstack https://charts.jetstack.io`
3. Update your local Helm chart repository cache:  
`helm repo update`
4. Install the cert-manager Helm chart:  
```
helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --version v1.2.0 \
  --create-namespace
```
5. Install the CRDs:  
`kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.2.0/cert-manager.crds.yaml`

Official docs for reference: https://cert-manager.io/docs/installation/kubernetes/#installing-with-helm

## Cert Manager Install

See steps above.
