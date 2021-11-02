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
