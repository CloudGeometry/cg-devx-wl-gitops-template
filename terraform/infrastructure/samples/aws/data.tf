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
    values = ["<CLUSTER_NAME>-vpc-intra-eu-west-1a"]
  }
}

data "aws_subnet" "intra_subnet_1b" {
  filter {
    name   = "tag:Name"
    values = ["<CLUSTER_NAME>-vpc-intra-eu-west-1b"]
  }
}

data "aws_subnet" "intra_subnet_1c" {
  filter {
    name   = "tag:Name"
    values = ["<CLUSTER_NAME>-vpc-intra-eu-west-1c"]
  }
}

data "aws_security_group" "cluster_additional_sg" {
  vpc_id = data.aws_vpc.current_vpc.id
  tags = {
    Name = "<CLUSTER_NAME>-cluster"
  }
}
