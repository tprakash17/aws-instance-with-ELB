# Introduction
This is terraform project which creates AWS stack including ELB, EC2 instance with supplied USER_DATA (i.e shell script to start nginx docker container with custom default page). Stack uses default VPC, subnet and security group to keep the configuration simple. This setup is eligible to be used with AWS free tier.  

## Requirements
* AWS cli is configured on local system with sufficient permissions. EC2FullPermission should be OK for this. This is required for terraform to have permission to create AWS resources.
* Generate ssh keypair in AWS from console or use existing one if you have.
* Install TERRAFORM

## Clone Repository
```
tarunp@Blr-Tarunp:~$ git clone https://github.com/tprakash17/aws-instance-with-ELB.git
Cloning into 'aws-instance-with-ELB'...
remote: Counting objects: 10, done.
remote: Compressing objects: 100% (9/9), done.
remote: Total 10 (delta 0), reused 7 (delta 0), pack-reused 0
Unpacking objects: 100% (10/10), done.
Checking connectivity... done.
```

## Run the SETUP
Before we execute make sure you have AWS cli configured as mentioned above. Also before we RUN terraform setup, make sure we initialiaze it.
```
tarunp@Blr-Tarunp:~/aws-instance-with-ELB$ terraform init
```

## DRY run
To verify the setup configuration.

```
tarunp@Blr-Tarunp:~/aws-instance-with-ELB$ terraform plan -var 'ssh_key_pair=<KEY-PAIR-NAME>' or terraform apply
```

If everything looks good, then we can go ahead and actually apply changes.

```
tarunp@Blr-Tarunp:~/aws-instance-with-ELB$ terraform apply -var 'ssh_key_pair=<KEY-PAIR-NAME>'
```
