variable "region" {
  default = "us-west-1"
}

variable "VpcId" {

}

variable "Subnets" {
  type = "list"
}

variable "KeyName" {

}

variable "DBName" {
  default = "wordpressdb"
}

variable "InstanceType" {
  default = "t2.micro"
}

variable "SSHLocation" {
  default = "199.253.245.4/32"
}

variable "DBClass" {
  default = "db.t2.micro"
}

variable "DBUser" {
  default = "wpuser"
}

variable "MultiAZDatabase" {
  default = "false"
}

variable "WebServerCapacity" {
  default = "1"
}

variable "DBAllocatedStorage" {
  default = "5"
}

variable "AWSInstanceType2Arch" {
  type = "map"
  default = {
    t1.micro.arch = "PV64"
    t2.small.arch = "HVM64"
    t2.micro.arch = "HVM64"
  }
}

variable "AWSRegionArch2AMI" {
  type = "map"
  default = {
    us-west-1.PV64 = "ami-a2490dc2"
    us-west-1.HVM64 = "ami-31490d51"
  }
}