# roboshop-terraform-eks

- Create VPC and its subnets, internet gateway, route table, route table association with subnets, routes, elastic ip and nat gateway
- create security groups for bastion, all db's, eks cluster & node, ingress controller
- create security group rules from bastion all resources, cluster to node and vice versa, vpc to node to allow communication between pods
- Create a certificate in aws certificate manager, with domain as *.<domain_name>. Also create a route53 record for certificate
- create a ingress controller i.e application load balancer, listener and route 53 record of alb dns.(Here we are provisioning alb and attaching it to cluster, nt providing access to cluster for creation of ingress controller)
- create eks cluster referencing open source modules. point cluster to eks cluster sg and node sg which we created. Also attach EBS and EFS policies to node group


aws eks update-kubeconfig --region us-east-1 --name roboshop-dev

    ```
        foreach ($i in "00-vpc","10-sg","20-bastion","30-sg-rules","40-ecr","70-acm","80-ingress-alb","90-eks") { if (Test-Path $i) { cd $i; git add .; if ($LASTEXITCODE -eq 0) { git commit -m "$i" }; if ($LASTEXITCODE -eq 0) { git push }; cd .. } else { Write-Warning "Directory $i does not exist." } }
    ```