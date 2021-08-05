# Using EFS Volumes with ECS

Problem: When restarting a container, data is lost.  

EFS: Elastic File System.

## How to use EFS with ECS

1. On AWS, select the latest Task Definition, scroll to volumes. Add a volume with EFS. 
2. Go to EFS console, create file system. Add VPC. 
3. Click Customize.
4. In network access, change security groups to match newly created security group for ECS.
   1. Inbound Rule > NFS > source = goals security group.
5. Click Next > Next > Create.
6. Back in ECS, refresh, add file system.
7. Go to mongodb container > Name > Storage and logging > Mount points > Add data path `/data/db`.
8. Click Create
9. Click Actions > Update Service
10. Now data is persisted to the same database on the same volume.
