
variable "k8s_cluster_name" {}

//variable "aws_zone" {}
variable "role_arn" {}
//variable "aws_vpc_id" {}

//variable "cluster_name" {}
variable "aws_subnet_ids" {
  type = "list"
}
variable "master_security_group_ids" {
  type = "list"
}
variable depends_on {
  default = [],
  type = "list"
}
