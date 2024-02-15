data "aws_vpc" "current_vpc" {
  filter {
    name   = "tag:Name"
    values = ["<CLUSTER_NAME>-vpc"]
  }
}

# data "aws_subnets" "intra_subnets" {
#   filter {
#     name   = "vpc-id"
#     values = [data.aws_vpc.vpc_id]
#   }
#   tags = {
#     Tier = "Intra"
#   }
# }

data "aws_subnet" "intra_subnet_1a" {
  filter {
    name   = "tag:Name"
    values = ["<CLUSTER_NAME>-vpc-intra-<CLOUD_REGION>a"]
  }
}

data "aws_subnet" "intra_subnet_1b" {
  filter {
    name   = "tag:Name"
    values = ["<CLUSTER_NAME>-vpc-intra-<CLOUD_REGION>b"]
  }
}

data "aws_subnet" "intra_subnet_1c" {
  filter {
    name   = "tag:Name"
    values = ["<CLUSTER_NAME>-vpc-intra-<CLOUD_REGION>c"]
  }
}

data "aws_security_group" "cluster_additional_sg" {
  vpc_id = data.aws_vpc.current_vpc.id
  filter {
    name = "tag:kubernetes.io/cluster/<CLUSTER_NAME>"
    values = ["owned"]
  }
  filter {
    name = "tag:aws:eks:cluster-name"
    values = ["<CLUSTER_NAME>"]
  }
}
