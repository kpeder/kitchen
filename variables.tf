/* Global variables */
variable "access_key" {}
variable "secret_key" {}
variable "wkstn_cidr" {}
variable keypair {}
variable "aws_region" {
  type = "map"

  default = {
    primary = "us-west-2"
    backup  = "us-east-1"
  }
}
