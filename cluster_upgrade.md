# Upgradation process

Lets use blue green deployment strategy for existing control plane & cluster

- For existing cluster we have nodes consider them as blue, now create similar nodes and refer them as green with taints so that k8s will ignore while scheduling pods
- Update terraform script and include green nodes and apply
- Now upgrade control plane to latest version
- once control plane upraded, upgrade green node groupn to latest version. No blue node group upgradation needed
- Green nodes gets upgraded, untaint green nodes using below command
    ```
        kubectl taint node <node_name> <key>=<value>:<Effect>-
    ```
- perform below operations on all blue nodes
    cordon nodes - it will makes nodes unschedulable
     ```
        kubectl cordon <node_name>
     ```
    Drain nodes - evict all pods, terminate them gracefully and reschedule them on available nodes in cluster
    ```
        kubectl drain node <node_name> --delete-emptydir-data --ignore-daemonsets
    ``` 
- Check the cluster and do sanity checks