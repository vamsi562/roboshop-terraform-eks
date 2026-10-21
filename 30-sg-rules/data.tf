data "aws_ssm_parameter" "bastion_sg" {
  name = "/${var.project_name}/${var.environment}/bastion_sg_id"
}

data "aws_ssm_parameter" "public_subnets" {
  name = "/${var.project_name}/${var.environment}/public_subnet_ids"
}


data "aws_ssm_parameter" "mongodb_sg" {
  name = "/${var.project_name}/${var.environment}/mongodb_sg_id"
}


data "aws_ssm_parameter" "redis_sg" {
  name = "/${var.project_name}/${var.environment}/redis_sg_id"
}

data "aws_ssm_parameter" "rabbitmq_sg" {
  name = "/${var.project_name}/${var.environment}/rabbitmq_sg_id"
}

data "aws_ssm_parameter" "mysql_sg" {
  name = "/${var.project_name}/${var.environment}/mysql_sg_id"
}

data "aws_ssm_parameter" "eks_control_plane_sg" {
  name = "/${var.project_name}/${var.environment}/eks_control_plane_sg_id"
}

data "aws_ssm_parameter" "eks_node_group_sg" {
  name = "/${var.project_name}/${var.environment}/eks_node_group_sg_id"
}

data "aws_ssm_parameter" "ingress_alb_sg" {
  name = "/${var.project_name}/${var.environment}/ingress-alb_sg_id"
}
