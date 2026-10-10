# roboshop-terraform-eks

- Create VPC and its subnets, internet gateway, route table, route table association with subnets, routes, elastic ip and nat gateway
- create security groups for bastion, all db's, eks cluster & node, ingress controller
- create security group rules from bastion all resources, cluster to node and vice versa, vpc to node to allow communication between pods
- Create a certificate in aws certificate manager, with domain as *.<domain_name>. Also create a route53 record for certificate
- create a ingress controller i.e application load balancer, listener and route 53 record of alb dns.(Here we are provisioning alb and attaching it to cluster, nt providing access to cluster for creation of ingress controller)
- create eks cluster referencing open source modules. point cluster to eks cluster sg and node sg which we created. Also attach EBS and EFS policies to node group


aws eks update-kubeconfig --region us-east-1 --name roboshop-dev