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
   3. Go to AWS EKS > Compute tab > Add Node Group
      1. Select any name.
      2. Enter IAM Role: Create "EC2" role with 
         1. EKS Worker Node policy permission and 
         2. CNI Policy and 
         3. EC2 Container Register Read only.
   4. Select role. Next.
   5. Set computer and scaling configuration. Next.
   6. Next.
   7. Create.
5. Applying our configs:
   1. `kubectl apply -f=auth.yaml -f=users.yaml`
   2. Note that we get a URL for the External IP. You can use that to send requests.
   3. Note that on AWS a Load Balancer is automatically created because we specify a LoadBalancer service type.
