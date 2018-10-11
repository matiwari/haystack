# cluster variables

variable "k8s_cluster_name" {}
variable "k8s_role_arn" {}
variable "k8s_sg_id" {}
variable "k8s_cluster_vpc_subnets" {}


# worker variables
variable "app-nodes_instance_count" {}
variable "aws_nodes_subnet" {}
variable "monitoring-nodes_instance_count" {}
variable "s3_bucket_name" {}
variable "nodes_ami" {}
variable "app-nodes_instance_type" {}
variable "aws_ssh_key" {}
variable "nodes_iam-instance-profile_arn" {}
variable "nodes_security_groups" {}
variable "app-nodes_instance_volume" {}
variable "monitoring-nodes_instance_type" {}
variable "monitoring-nodes_instance_volume" {}
