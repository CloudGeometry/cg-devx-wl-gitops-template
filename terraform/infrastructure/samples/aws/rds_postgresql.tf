# AWS RDS Postgresql
# For more details please see official provider documentation https://registry.terraform.io/modules/terraform-aws-modules/rds/aws/latest

module "db_postgresql" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "${local.wl_name}-demodb"

  engine            = "postgres"
  engine_version    = "15.4"
  instance_class    = "db.t3.small"
  allocated_storage = 5
  storage_encrypted = true
  auto_minor_version_upgrade  = false

  db_name  = "demodb" # DBName must begin with a letter and contain only alphanumeric characters
  username = "demoadmin"
  port     = "5432"

  iam_database_authentication_enabled = true

  vpc_security_group_ids = [module.postgresql_security_group.security_group_id]

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = [data.aws_subnet.intra_subnet_1a.id, data.aws_subnet.intra_subnet_1b.id, data.aws_subnet.intra_subnet_1c.id]

  # DB parameter group
  family = "postgres15"

  # DB option group
  major_engine_version = "15"

  # Database Deletion Protection
  deletion_protection = false

  tags = {
    Environment = "dev"
  }
}

module "postgresql_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/postgresql"
  version = "~> 5.0"

  name        = "postgresql_security_group"
  description = "Security group for postgresql with TCP port open within VPC"
  vpc_id      = data.aws_vpc.current_vpc.id

  computed_ingress_with_source_security_group_id = [
    {
      rule                     = "postgresql-tcp"
      source_security_group_id = data.aws_security_group.cluster_additional_sg.id
    }
  ]
  number_of_computed_ingress_with_source_security_group_id = 1
}

# data "aws_secretsmanager_secret" "database_secret" {
#   arn = module.db_postgresql.db_instance_master_user_secret_arn
# }

# data "aws_secretsmanager_secret_version" "current" {
#   secret_id = data.aws_secretsmanager_secret.secret.id
# }

# output "sensitive_database_credentials_hash" {
#   value = jsondecode(nonsensitive(data.aws_secretsmanager_secret_version.current.secret_string))
# }
