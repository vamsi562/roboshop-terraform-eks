variable "project_name" {
  type    = string
  default = "roboshop"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "component" {
  type    = list(string)
  default = ["catalogue", "user", "cart", "shipping", "payment", "frontend"]
}
