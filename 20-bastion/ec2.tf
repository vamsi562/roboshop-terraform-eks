resource "aws_instance" "bastion" {
  ami                    = local.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [local.bastion_sg_id]
  subnet_id              = local.subnet_id
  user_data              = file("${path.module}/bootstrap.sh")
  # iam_instance_profile   = aws_iam_instance_profile.bastion.name
  root_block_device {
    volume_size = 50
    volume_type = "gp3"
  }
  tags = merge(local.common_tags,
    {
      Name = "${local.common_name_suffix}-eks-bastion"
    },
    var.ec2_tags
  )
}

# resource "aws_iam_instance_profile" "bastion" {
#   name = "bastion"
#   role = "BastionTerraformAdmin"
# }
