variable "region" {
  default = "us-east-1"
}
variable "centos6" {
  type = "map"
  default = {
    us-east-1 = "ami-e3fdd999" # Virginia
    us-west-1 = "ami-ade6e5cd" # Oregon
    eu-west-1 = "ami-0451e9d3427711cb1" # Ireland
    us-east-2 = "ami-ad5863c8" # Ohio
  }
  description = "I add only 3 regions (Virginia, Oregon, Ireland) to show the map feature but you can add all the regions that you need"
}
variable "centos7" {
  type = "map"
  default = {
    us-east-1 = "ami-4bf3d731" # Virginia
    us-west-2 = "ami-5ec1673e" # Oregon
    eu-west-1 = "ami-0ff760d16d9497662" # Ireland
    us-east-2 = "ami-ad5863c8" # Ohio
  }
 }
variable "windows12" {
  type = "map"
  default = {
    us-east-1 = "ami-08b11fc5bd2026dee" # Virginia
    us-east-2 = "ami-08c44c744ddf87622" # Ohio
    us-west-2 = "ami-5ec1673e" # Oregon
    eu-west-1 = "ami-9398d3e0" # Ireland

  }

description = "I add only 3 regions (Virginia, Oregon, Ireland) to show the map feature but you can add all the regions that you need"
}
variable "company_name" {
  default = "cwx-kt"
  description = "the ssh key to use in the EC2 machines"
}

variable "credentialsfile" {
  default = "C:/Users/lenovo/.aws/credentials" #replace your home directory
  description = "where your access and secret_key are stored, you create the file when you run the aws config"
}

variable "vpc-fullcidr" {
    default = "10.50.0.0/16"
  description = "the vpc cdir"
}
variable "Subnet-Public-AzA-CIDR" {
  default = "10.50.0.0/24"
  description = "${var.company_name} Public subnet"
}
variable "Subnet-Private-AzA-CIDR" {
  default = "10.50.1.0/24"
  description = "${var.company_name} Private subnet"
}

variable "long_key" {
  type = "string"
  default = <<EOF
#!/bin/bash
iptables -F
chkconfig iptables off && service iptables stop &&
yum install -y epel-release && yum install nc curl telnet ntp unzip wget vim vsftpd -y
echo '# arago HIRO repository
[hiro]
name=arago HIRO CentOS 6 Repository
baseurl=htt xyz #give url info here
gpgcheck=0
enabled=1' >> /etc/yum.repos.d/hiro.repo
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config && setenforce 0
wget http://javadl.oracle.com/webapps/download/AutoDL?BundleId=233161_512cd62ec5174c3487ac17c61aaa89e8 -O java8.rpm  && rpm -ivh java8.rpm
export JAVA_HOME='/usr/java/jre1.8.0_171-amd64/'
echo "export JAVA_HOME='/usr/java/jre1.8.0_171-amd64/'" >> /etc/profile
useradd dev 
echo 'dev ALL=(ALL)   NOPASSWD: ALL' >> /etc/sudoers
mkdir /home/dev/.ssh
touch /home/dev/.ssh/authorized_keys 
echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA144PEyOfTQMKAxHIQDlgMfnxd4pC0ZLGoroVzqo2EYMDu2bbwtg1/NxxijhTrmllMD4seWLLJe470bpJCsghKUW65yia/bqZ4YP0hcUvcInfk2fRaHx0MMms+eawwU0era99ZDe9B8obAjvoiLEnvy4TywJSkVZwFb6jL1O8Ril3MIT0/B1bdSbbJ8Sr17xFbrm5d6OsVSUledND70v5lAepSC1fwME5TXV5OaJ0Ua2n83SLs2ry5Q0bbdH4U0x1fuInUs+XioSgj0zUxHr67/iDMfv8Qqyy1aNfnLcL3QAH2z3lfPSixKY3BxyUkdK2FBjcZeLHXTFWY7v7QUamwQ==" >> /home/dev/.ssh/authorized_keys 
chmod 600 /home/dev/.ssh/authorized_keys
chown -R dev.dev /home/dev/.ssh/authorized_keys
EOF
}

