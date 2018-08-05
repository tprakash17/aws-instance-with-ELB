# Introduction and setup info
This is terraform project which creates AWS stack including ELB, EC2 instance with supplied USER_DATA (i.e shell script to start nginx docker container with custom default page). Stack uses default VPC, subnet and security group to keep the configuration simple. 

* AMI - ami-0dc82b70
* Instance Type- t2.micro instance
* ELB 


## Requirements
* Install AWS cli and configure it with required iam permission. EC2FullPermission should be OK for this.
* Generate ssh keypair in AWS from console or use existing one if you have. This you will specify at terraform run time.
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

If everything looks good, then apply your changes.

## Terraform apply
```
tarunp@Blr-Tarunp:~/aws-instance-with-ELB$ terraform apply -var 'ssh_key_pair=<KEY-PAIR-NAME>'
```

### Verify ELB output after a while. 
![elb output](https://user-images.githubusercontent.com/38158144/43685165-694298d6-98cb-11e8-8c07-e2b079eb74ab.png)
* Note: You need to wait for sometime before you hit the ELB as it might take a while to register ec2 instance.
