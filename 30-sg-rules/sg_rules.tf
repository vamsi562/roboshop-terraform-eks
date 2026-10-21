# resource "aws_security_group_rule" "backend_bastion" {
#   type                     = "ingress"
#   security_group_id        = local.backend_alb_sg
#   source_security_group_id = local.bastion_sg_id
#   from_port                = 80
#   to_port                  = 80
#   protocol                 = "tcp"

# }

resource "aws_security_group_rule" "bastion_sg" {
  type              = "ingress"
  security_group_id = local.bastion_sg_id
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]

}

resource "aws_security_group_rule" "bastion_mongodb" {
  type                     = "ingress"
  security_group_id        = local.mongodb_sg
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"

}

resource "aws_security_group_rule" "bastion_redis" {
  type                     = "ingress"
  security_group_id        = local.redis_sg
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"

}

resource "aws_security_group_rule" "bastion_rabbitmq" {
  type                     = "ingress"
  security_group_id        = local.rabbitmq_sg
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"

}

resource "aws_security_group_rule" "bastion_mysql" {
  type                     = "ingress"
  security_group_id        = local.mysql_sg
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"

}

resource "aws_security_group_rule" "bastion_eks_control_plane" {
  type                     = "ingress"
  security_group_id        = local.eks_control_plane_sg
  source_security_group_id = local.bastion_sg_id
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"

}

resource "aws_security_group_rule" "bastion_eks_node_group" {
  type                     = "ingress"
  security_group_id        = local.eks_node_group_sg
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"

}

# EKS Nodes accept all traffic from eks control plane
resource "aws_security_group_rule" "eks_node_group_eks_control_plane" {
  type                     = "ingress"
  security_group_id        = local.eks_node_group_sg
  source_security_group_id = local.eks_control_plane_sg
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"

}

# EKS Control plane accept all traffic from eks node group
resource "aws_security_group_rule" "eks_control_plane_eks_node_group" {
  type                     = "ingress"
  security_group_id        = local.eks_control_plane_sg
  source_security_group_id = local.eks_node_group_sg
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"

}

# enable communication between pods in  VPC
# allowing vpc cidr or creating a self referencing rule for node group sg to allow communication between pods in the same node group, by default aws consider inbound traffic as deny unless explicitly specified
resource "aws_security_group_rule" "eks_node_group_vpc" {
  type              = "ingress"
  security_group_id = local.eks_node_group_sg
  cidr_blocks       = ["10.0.0.0/16"]
  from_port         = 0
  to_port           = 0
  protocol          = "-1"

}


resource "aws_security_group_rule" "ingress_alb_sg" {
  type              = "ingress"
  security_group_id = local.ingress_alb_sg
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]

}
