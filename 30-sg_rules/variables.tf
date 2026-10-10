# variable "instance_type" {
#   type    = string
#   default = "t3.micro"
# }

variable "project_name" {
  type    = string
  default = "roboshop"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "sg_rule_tags" {
  type    = map(string)
  default = {}
}
