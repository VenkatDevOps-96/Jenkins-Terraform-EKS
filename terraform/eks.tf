module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.10.1"   # lock module version

  name    = local.name
  version = "1.28"       # Kubernetes version
  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.private_subnets

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  manage_aws_auth = true

  cluster_addons = [
    { name = "coredns", version = "v1.10.1-eksbuild.1" },
    { name = "kube-proxy", version = "v1.28.0-eksbuild.1" }
  ]

  eks_managed_node_groups = {
    default = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_type    = "t3.medium"
      subnets          = module.vpc.private_subnets
    }
  }
}


