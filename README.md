# bind9-config
Configuration of Bind9 container for Optiputer DNS

Current config (not the way we should really do it)

1.  NFS export on  cluster frontend /export/home/bind9
2.  NFS exports (/etc/exports)  on cluster physical frontend changed to have 
the following so that pods on the local (calico, kubernetes) network can access 
      --  /export 10.1.100.1(rw,async,no_root_squash) 10.1.100.0/255.255.255.0(rw,async) 192.168.0.0/255.255.0.0(rw,async,no_root_squash)

3. Building the docker image (this is based on the standard CentOS 7 container
on DockerHub (the one managed/published by the CentOS team).

	make bind9


4. Making the yaml files 

	make yaml


5. Create the bind9 service (only one time per Kubernetes cluster, unless
you delete it)

	kubectl create -f bind9-service


6. Create the bind9 deployment to start the pod

	kubectl create -f bind9-deployment


NOTES:
Docker registry is setup by the Kubernetes roll and is on port 5443.
See https://docs.docker.com/registry/ for details on registry
test
