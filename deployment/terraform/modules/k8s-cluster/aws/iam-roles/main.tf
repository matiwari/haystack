resource "aws_iam_instance_profile" "masters-profile" {
  name = "${var.haystack_cluster_name}-eks-masters"
  role = "${aws_iam_role.masters-role.name}"
}

resource "aws_iam_instance_profile" "nodes-profile" {
  name = "${var.haystack_cluster_name}-eks-nodes"
  role = "${aws_iam_role.nodes-role.name}"
}

resource "aws_iam_role" "masters-role" {
  name = "${var.haystack_cluster_name}-eks-masters"
  assume_role_policy = "${file("${path.module}/manifests/masters_iam-role.json")}"
}

resource "aws_iam_role" "nodes-role" {
  name = "${var.haystack_cluster_name}-eks-nodes"
  assume_role_policy = "${file("${path.module}/manifests/nodes_iam-role.json")}"
}


resource "aws_iam_role_policy_attachment" "master-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = "${aws_iam_role.masters-role.name}"
}

resource "aws_iam_role_policy_attachment" "master-AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = "${aws_iam_role.masters-role.name}"
}

resource "aws_iam_role_policy_attachment" "nodes-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = "${aws_iam_role.nodes-role.name}"
}
resource "aws_iam_role_policy_attachment" "nodes-SecretsManagerPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
  role       = "${aws_iam_role.nodes-role.name}"
}

resource "aws_iam_role_policy_attachment" "nodes-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = "${aws_iam_role.nodes-role.name}"
}

resource "aws_iam_role_policy_attachment" "demo-node-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = "${aws_iam_role.nodes-role.name}"
}
/*
data "template_file" "masters-iam-role-policy-template" {
  template = "${file("${path.module}/templates/masters_iam-role-policy.tpl")}"
  vars {
    aws_hosted_zone_id = "${var.aws_hosted_zone_id}"
    s3_bucket_name = "${var.s3_bucket_name}"
  }
}
resource "aws_iam_role_policy" "masters-policy" {
  name = "masters.${var.k8s_cluster_name}"
  role = "${aws_iam_role.masters-role.name}"
  policy = "${data.template_file.masters-iam-role-policy-template.rendered}"
}


data "template_file" "nodes-iam-role-policy-template" {
  template = "${file("${path.module}/templates/nodes_iam-role-policy.tpl")}"
  vars {
    s3_bucket_name = "${var.s3_bucket_name}"
  }
}
resource "aws_iam_role_policy" "nodes-policy" {
  name = "nodes.${var.k8s_cluster_name}"
  role = "${aws_iam_role.nodes-role.name}"
  policy = "${data.template_file.nodes-iam-role-policy-template.rendered}"
}
*/