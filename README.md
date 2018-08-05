# Introduction
This is terraform project which creates AWS stack including ELB, EC2 instance with supplied USER_DATA (i.e shell script to start nginx docker container with custom default page). Stack uses default VPC, subnet and security group to keep the configuration simple. This setup is eligible to be used with AWS free tier.  

# Requirements
AWS cli is configured on local system with sufficient permissions. EC2FullPermission should be OK for this.
Install TERRAFORM

# Clone this repo 
```
tarunp@Blr-Tarunp:~$ git clone https://github.com/tprakash17/aws-instance-with-ELB.git
Cloning into 'aws-instance-with-ELB'...
remote: Counting objects: 10, done.
remote: Compressing objects: 100% (9/9), done.
remote: Total 10 (delta 0), reused 7 (delta 0), pack-reused 0
Unpacking objects: 100% (10/10), done.
Checking connectivity... done.

tarunp@Blr-Tarunp:~$ cd aws-instance-with-ELB/
```
