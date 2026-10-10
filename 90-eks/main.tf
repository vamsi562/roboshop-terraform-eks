#------- Managed Node Group EKS Cluster --------
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = local.common_name_suffix
  kubernetes_version = "1.34"

  addons = {
    coredns = {}
    eks-pod-identity-agent = {
      before_compute = true
    }
    kube-proxy = {}
    vpc-cni = {
      before_compute = true
    }
    metrics-server = {}
  }

  # Optional
  endpoint_public_access = false

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true

  vpc_id                   = local.vpc_id
  subnet_ids               = local.subnet_id
  control_plane_subnet_ids = local.subnet_id

  create_node_security_group = false # node sescurity group is already created and stored in ssm parameter store, we are using that security group for node group
  node_security_group_id     = local.eks_node_sg

  create_security_group = false                      # this is for cluster security group, we are using existing security group for cluster and node group
  security_group_id     = local.eks_control_plane_sg # cluster security group id

  # EKS Managed Node Group(s)
  eks_managed_node_groups = {
    # blue = {
    #   # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
    #   ami_type       = "AL2023_x86_64_STANDARD"
    #   instance_types = ["m5.xlarge"]
    #   iam_role_additional_policies = {
    #     amazonEFS = "arn:aws:iam::aws:policy/service-role/AmazonEFSCSIDriverPolicy"
    #     amazonEBS = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
    #   }
    #   min_size     = 2
    #   max_size     = 10
    #   desired_size = 2
    # } comment after upgrading cluster from 1.33 to 1.34 and evicted pods and resources in blue node to green
    green = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["m5.xlarge"]
      iam_role_additional_policies = {
        amazonEFS = "arn:aws:iam::aws:policy/service-role/AmazonEFSCSIDriverPolicy"
        amazonEBS = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
      }
      min_size     = 2
      max_size     = 10
      desired_size = 2
      # taints = {
      #   upgrade = {
      #     key    = "upgrade"
      #     value  = "true"
      #     effect = "NO_SCHEDULE"
      #   }
      # }
    }
  }
  tags = local.common_tags
}
