locals {
  ami_id        = data.aws_ami.joindevops_ami.id
  bastion_sg_id = data.aws_ssm_parameter.bastion.value
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    Terraform   = true
  }
  common_name_suffix = "${var.project_name}-${var.environment}"
  subnet_id          = split(",", data.aws_ssm_parameter.public_subnets.value)[0]
}
