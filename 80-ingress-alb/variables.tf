variable "project_name" {
  type    = string
  default = "roboshop"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "domain_name" {
  type    = string
  default = "chikoo.fun"
}

variable "frontend-alb_tags" {
  type    = map(string)
  default = {}
}
