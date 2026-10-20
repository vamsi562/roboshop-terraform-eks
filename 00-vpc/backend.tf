terraform {
  backend "s3" {
    bucket       = "remote-tf-state-backend-vk"
    key          = "roboshop-k8s-vpc-jenkins"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}
