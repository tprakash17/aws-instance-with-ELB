variable "ami"{
	default = "ami-0dc82b70"
	description = "debian-stretch-hvm-x86_64-gp2-2018-02-22-67467 available in us-east-1 region"
}
variable "instance_type"{
	default = "t2.micro"
}

# take this from user in run time
variable "ssh_key_pair"{
}

