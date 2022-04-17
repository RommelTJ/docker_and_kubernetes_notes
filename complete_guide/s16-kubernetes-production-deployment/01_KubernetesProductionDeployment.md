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
## Installing the Google Cloud SDK
## Generating a Service Account
## Running Travis CLI in a container
## Encrypting a Service Account File
## More Google Cloud CLI Config
## Running Tests with Travis
## Custom Deployment Providers
## Unique Deployment Images
## Unique Tags for Built Images
## Updating the Deployment Script
## Configuring the Google Cloud CLI on Cloud Console
## Creating a Secret on Google Cloud
## Helm Setup
## Kubernetes Security with RBAC
## Assigning Tiller a Service Account
## Ingress-nginx with Helm
## Quick note about the default backend
## The result of Ingress-nginx
## Finally - deployment!
## Did I really type that?
## Verifying deployment
## A Workflow for Changing in Prod
## Merging a PR for deployment
## Version Bump
