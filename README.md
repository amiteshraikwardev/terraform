Prerequisite:-
- Get accesskey & secretkey of ADMINISTRATOR user of AWS.

- Install AWS Cli
Mac = https://docs.aws.amazon.com/cli/latest/userguide/install-macos.html#install-bundle-macos
Windows = https://docs.aws.amazon.com/cli/latest/userguide/install-windows.html#install-msi-on-windows
Ubuntu = https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html

- Get Configured aws credentials.
$ aws configure

When you type this command, the AWS CLI prompts you for four pieces of information (access key, secret access key, AWS Region, and output format), and stores them in a profile (a collection of settings) named default. This profile is then used any time you run an AWS CLI command that doesn't explicitly specify a profile to use.
$ aws configure
AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
Default region name [None]: 
Default output format [None]: 



=============================================================

- To change variable open variable.tf and replace below variable with new value for North Virginia=us-east-1, Oregon = us-west-2, Ireland =eu-west-1
1). For select region
variable "region" {
  default = "us-west-2" 

2). For Operating system selection 

variable "centos6" {
  type = "map"
  default = {
    us-east-1 = "ami-dc4862a3" # Virginia
    us-west-2 = "ami-5ec1673e" # Oregon
    eu-west-1 = "ami-0451e9d3427711cb1" # Ireland
    us-east-2 = "ami-ad5863c8" # Ohio

NOTE:-Before processed make sure AMI ID shoud be currect one.

3). For Environment setup please update default value with new one

variable "company_name" {
  default = "dapi"
  description = "the ssh key to use in the EC2 machines"

4). To set aws access key and secreat key to deploy the environment update the default value to path of your Credentials file location

variable "credentialsfile" {
  default = "C:/Users/Hardik/.aws/credentials" #replace your home directory
  description = "where your access and secret_key are stored, you create the file when you run the aws config"
}


5). For update VPC IP range just replace 10.7.0.0 to new value like fullcidr-10.8.0.0/16 then accordingly change the Public-AzA-CIDR to 10.8.0.0/24 and Private-AzA-CIDR-10.8.1.0/24

variable "vpc-fullcidr" {
    default = "10.7.0.0/16"
  description = "the vpc cdir"
}
variable "Subnet-Public-AzA-CIDR" {
  default = "10.7.0.0/24"
  description = "${var.company_name} Public subnet"
}
variable "Subnet-Private-AzA-CIDR" {
  default = "10.7.1.0/24"
  description = "${var.company_name} Private subnet"
}

6). Update the public key of your's so in public_key 
resource "aws_key_pair" "key_pair" {
key_name   = "${var.company_name}"
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAxByQLSNg8F59hGYbYYySeLGcaEHfcsnwKo7mFwEKfVsHYi3vpfIEAp5SX0Cf3kwyrgT/NPfsz5dU60fasL3GGBFbnU+FN1Hn3q6hQWyrb7AABk7EBun+pWen1KdzTThIACcpJ1EujExk+t1UUnleY3+ccyqeDTotUu6h9dtjeUuvvreV6rvzzeQWA6pJEltUo8boEL/ruopqBOE8Tlk6NujuxEq3gYn7bgVMZWYHwZ61wszk3bSszBerv+LN5MXEbjr0rEfw2oP0Dxod5O8FEkwvIkFM37R4oMdQZBVH50Kim7CUsUidxgBQtgl3GX6r3bhi2OIc3x1GCwfilYvsHQ== rsa-key-20190620-hiro"
}


##############################################################################################################################
For Run terraform
##############################################################################################################################
Initialize aws library
D:\terrafome\terrafome>terraform.exe init

run terraform plan 
D:\terrafome\terrafome>terraform.exe plan 

So you will see below line at the end of the above command execution

run terraform apply to create aws environment 
D:\terrafome\terrafome>terraform.exe apply 



