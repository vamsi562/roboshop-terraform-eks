variable "sg_name" {
  type = list(string)
  default = [ #"catalogue", "user",
    #"cart", "shipping", "payment",
    #"frontend", 
    "mongodb", "redis", "mysql",
    "rabbitmq",
    "bastion",
    "ingress-alb",
    #"backend-alb"
    "eks_control_plane",
  "eks_node_group"]
}

variable "project_name" {
  type    = string
  default = "roboshop"
}

variable "environment" {
  type    = string
  default = "dev"
}
