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

## How to Wire Up Cert Manager

CertManager is a pod that gets set up by Helm and handles the certificate for us.  
We need to create two objects:  
- Issuer. A Config file telling the cert how to reach out to LetsEncrypt to get the certificate from.
- Certificate. A config file describing the details about the certificate that should be obtained.

## Required Update for Issuer

1. Update apiVersion:  
`apiVersion: cert-manager.io/v1`
2. Add a solvers property:  
```
solvers:
  - http01:
      ingress:
        class: nginx
```

## Issuer Config File

See `issuer.yaml`.

## Required Update for the Certificate

1. Update the API version used:  
`apiVersion: cert-manager.io/v1`
2. Remove the acme challenge from the certificate spec.

## Certificate Config File

See `certificate.yaml`.

## Deploying Changes

Push to main.

## No Resources Found

If you have deployed your issuer and certificate manifests to GCP and you are getting No Resources Found when running 
`kubectl get certificates`, then continue on to the next lecture to create and deploy the Ingress manifest. 
Deploying the updated Ingress should trigger the certificate to be issued. 

## Verifying the Certificate

You can verify from the Google Cloud Console by typing `kubectl get certificates` or `kubectl describe certificates`.

## Required Update for the HTTPS Ingress

`certmanager.k8s.io/cluster-issuer: "letsencrypt-prod"` is now: `cert-manager.io/cluster-issuer: "letsencrypt-prod"`
