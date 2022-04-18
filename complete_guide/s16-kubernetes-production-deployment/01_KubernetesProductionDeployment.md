# Kubernetes Production Deployment

## The Deployment Process

Google Cloud will cost money. Probably around $50/month.

## Google Cloud vs AWS for Kubernetes

* Why Google Cloud?
  * Google created Kubernetes
  * AWS only "recently" for Kubernetes support
  * Far, far easier to poke around Kubernetes on Google Cloud
  * Excellent documentation for beginners.

## Creating a GitHub Repo

https://github.com/RommelTJ/multi-k8s

## Linking the GitHub Repo to Travis

Set up the repo on Travis.

## Creating a Google Cloud Project

* Go to https://console.cloud.google.com/
* New Project > "multi-k8s" > Create
* Toggle to "multi-k8s" project

## Linking a Billing Account

* Billing > Manage Billing Account > Set Account

## Kubernetes Engine init

1. Click the Hamburger menu on the top left-hand side of the dashboard.
2. Click Kubernetes Engine
3. Click the ENABLE button to enable the Kubernetes API for this project.
4. After a few minutes of waiting, clicking the bell icon in the top right part of the menu should show a green 
   checkmark for Enable services: container.googleapis.com
5. If you refresh the page it should show a screen to create your first cluster. If not, click the hamburger menu and 
   select Kubernetes Engine and then Clusters. Once you see the screen below, click the CREATE button.
6. A Create Cluster dialog will open and provide two choices. Standard and Autopilot. Click the CONFIGURE button 
   within the Standard cluster option.
7. A form similar to the one shown in the video will be presented. Set the Name to multi-cluster (step 1). 
   Confirm that the Zone set is actually near your location (step 2). The Node Pool that is discussed in the video is 
   now found in a separate dropdown on the left sidebar. Click the downward-facing arrow to view the settings. No 
   changes are needed here (step 3). Finally, click the CREATE button at the bottom of the form (step 4).
8. After a few minutes, the cluster dashboard should load and your multi-cluster should have a green checkmark in the 
   table.

## Creating a Cluster with Google Cloud

See previous section.

## Kubernetes Dashboard on Google Cloud

Clicking around on the Google dashboard.

## Travis Deployment Overview

Travis Config file
* Install Google Cloud SDK CLI
* Configure the SDK without Google Cloud auth info
* Login to Docker CLI
* Build the 'test' version of multi-client
* Run tests
* If tests are successful, run a script to deploy newest images
* Build all our images, tag each one, push each to docker hub
* Apply all configs in the 'k8s' folder
* Imperatively set latest images on each deployment

## Installing the Google Cloud SDK

See `.travis.yml`.

## Generating a Service Account

1. Click the Hamburger menu on the top left-hand side of the dashboard, find IAM & Admin, and select Service Accounts. 
   Then click the CREATE SERVICE ACCOUNT button.
2. In the form that is displayed, set the Service account name to travis-deployer (step 1), then click the CREATE 
   button (step 2).
3. Click in the Select a role filter and scroll down to select Kubernetes Engine and then Kubernetes Engine Admin.
4. Make sure the filter now shows Kubernetes Engine Admin and then click CONTINUE
5. The Grant users access form is optional and should be skipped. Click the DONE button.
6. You should now see a table listing all of the service accounts including the one that was just created. Click the 
   three dots to the right of the service account you just created. Then select Manage Keys in the dropdown.
7. In the Keys dashboard, click ADD KEY and then select Create new key.
8. In the Create private key dialog box, make sure Key type is set to JSON, and then click the CREATE button.
9. The JSON key file should now download to your computer.

## Running Travis CLI in a container

```
docker run -it -v $(pwd):/app ruby:2.4 sh
gem install travis
travis
```

## Encrypting a Service Account File

```
travis login --github-token YOUR_PERSONAL_TOKEN --com
travis encrypt-file service-account.json -r RommelTJ/multi-k8s --com
openssl aes-256-cbc -K $encrypted_9f3b5599b056_key -iv $encrypted_9f3b5599b056_iv -in service-account.json.enc -out service-account.json -d
```

## More Google Cloud CLI Config

See `.travis.yml`.

## Running Tests with Travis

See `.travis.yml`.

## Custom Deployment Providers

See `.travis.yml`.

## Unique Deployment Images

See `deploy.sh`.

## Unique Tags for Built Images

We use the git SHA to generate unique tags.  It also lets you verify which version you're developing on.

## Updating the Deployment Script

See `.travis.yml` and `deploy.sh`.

## Configuring the Google Cloud CLI on Cloud Console

Need to create a PGPASSWORD to create a secret on Google Cloud.

Click `Activate Cloud Shell` on Google Cloud, then: 
```
gcloud config set project multi-k8s-346314
gcloud config set compute/zone us-west1-a
gcloud container clusters get-credentials multi-cluster
```

## Creating a Secret on Google Cloud

Click `Activate Cloud Shell` on Google Cloud, then:
```
kubectl create secret generic pgpassword --from-literal PGPASSWORD=REDACTED
```

## Helm Setup

Helm is a third-party software that can be used to install Charts. Charts are pre-configured Kubernetes resources.

Click `Activate Cloud Shell` on Google Cloud, then:
```
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm install my-release ingress-nginx/ingress-nginx
```

## Kubernetes Security with RBAC

Skipped.

## Assigning Tiller a Service Account

Skipped.

## Ingress-nginx with Helm

See above under Helm Setup.

## Quick note about the default backend
## The result of Ingress-nginx
## Finally - deployment!
## Did I really type that?
## Verifying deployment
## A Workflow for Changing in Prod
## Merging a PR for deployment
## Version Bump
