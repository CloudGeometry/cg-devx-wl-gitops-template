data "aws_vpc" "current_vpc" {
  filter {
    name   = "tag:Name"
    values = ["${local.cluster_name}-vpc"]
  }
}

data "aws_subnet" "intra_subnet_1a" {
  filter {
    name   = "tag:Name"
    values = ["${local.cluster_name}-vpc-intra-${local.region}a"]
  }
}

data "aws_subnet" "intra_subnet_1b" {
  filter {
    name   = "tag:Name"
    values = ["${local.cluster_name}-vpc-intra-${local.region}b"]
  }
}

data "aws_subnet" "intra_subnet_1c" {
  filter {
    name   = "tag:Name"
    values = ["${local.cluster_name}-vpc-intra-${local.region}c"]
  }
}

data "aws_security_group" "cluster_additional_sg" {
  vpc_id = data.aws_vpc.current_vpc.id
  filter {
    name = "tag:kubernetes.io/cluster/${local.cluster_name}"
    values = ["owned"]
  }
  filter {
    name = "tag:aws:eks:cluster-name"
    values = ["${local.cluster_name}"]
  }
}