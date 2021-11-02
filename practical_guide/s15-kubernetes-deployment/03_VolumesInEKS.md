# Volumes

## Getting started with Volumes

Type: csi. Container Storage Interface (CSI) The most common solution. A type of volume that allows integration to
different volumes. We want to use AWS EFS. Google "AWS EFS Driver".

## Adding EFS as a Volume with the CSI volume type

1. Install EFS driver:
   1. `kubectl apply -k "github.com/kubernetes-sigs/aws-efs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-1.3"`
2. Go to AWS Console > EC2 > Security Groups, Create Security Group
   1. Create "eks-efs" security group. 
   2. Select EKS VPC.
   3. Inbound rules: NFS, Custom, enter EKS VPC IPv4 CIDR
   4. Create
3. Go to AWS console > EFS > Create File System
   1. Name it: "eks-efs"
   2. Select VPC
   3. Customize
   4. Next
   5. Network Access: Remove security groups and replace them with the eks-efs security group.
   6. Next, Next, Create.

## Creating a Persistent Volume for EFS

1. Grab the efs id from AWS console.
2. Add persistent volume config to `users.yaml`
3. Get the EFS Storage Class from GitHub and paste it above the Persistent Volume.
4. Update the deployment resource to include the volume.

## Using the EFS Volume

1. Update `user-actions.js` and `user-routes.js` to take advantage of an EFS Volume.
2. `docker build -t rommelrico/kub-deploy-users .`
3. `docker push rommelrico/kub-deploy-users`
4. `kubectl delete deployment users-deployment`
5. `kubectl apply -f=users.yaml`

You can also go to AWS:
1. Go to EFS console.
2. View System metrics to verify it worked.

You can test data survives by shrinking the replicas to 0 and then recreating the cluster.
