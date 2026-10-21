resource "aws_ecr_repository" "main" {
  count = length(var.component)
  name  = "${var.project_name}/${var.component[count.index]}"

  image_scanning_configuration {
    scan_on_push = false
  }
  force_delete = true

}
