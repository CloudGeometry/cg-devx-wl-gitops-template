# AWS Elasticache
# For more details please see official provider documentation https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster

resource "aws_elasticache_cluster" "memcached" {
  cluster_id           = "memcached-cluster-example"
  engine               = "memcached"
  node_type            = "cache.t4g.micro"
  num_cache_nodes      = 2
  parameter_group_name = "default.memcached1.6"
  port                 = 11211
  tags = {
    Environment = "dev"
  }
}

resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "redis-cluster-example"
  engine               = "redis"
  node_type            = "cache.t4g.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis7"
  engine_version       = "7.1"
  port                 = 6379
  tags = {
    Environment = "dev"
  }
}
