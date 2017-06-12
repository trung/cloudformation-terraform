/*
This template should provision resources same as the CloudFormation one
*/
provider "aws" {
  region = "${var.region}"
  profile = "lab"
}