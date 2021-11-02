# Creating and Configuring the Kubernetes Cluster with EKS

1. Go to AWS EKS. Give the cluster a name.
2. Configure the cluster.
   1. For name, enter a name.
   2. For Service Role, 
      1. go to IAM and create "EKS - Cluster" role, Next, Next, Next, Give name, Create.
      2. Select role.
   3. Next
3. Specify networking
   1. Services > Cloud Formation > Create stack > Past URL to EKS template, Next, Give Name, Next, Next, Create Stack
   2. Select newly created VPC.
   3. For cluster endpoint access, select Public and Private.
   4. Next, Next, Create.
4. Add nodes.
   1. Go to app source code.
   2. Open the hidden `.kube` folder and add the EKS cluster to the config.
      1. Easiest way is to use AWS CLI.
      2. My Account > My Security Credentials > Create a New Access Key. Download the file.
      3. `aws configure` -> Enter Access Key ID and Secret Key. Etc.
      4. `aws eks --region us-east-1 update-kubeconfig --name kub-deploy-demo`. This updates kubectl.
