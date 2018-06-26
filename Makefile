include registry.mk
YAMLPROTOTYPES = bind9-deployment.yaml.in

SEDSPEC = -e "s/@REGISTRY@/$(REGISTRY)/" -e "s/@NFS_SERVER@/$(NFS_SERVER)/" \
-e "s/@NFS_SERVER_IP@/$(NFS_SERVER_IP)/" 

YAMLFILES=$(subst .in,,$(YAMLPROTOTYPES))

default: $(YAMLFILES)

$(YAMLFILES):
	/bin/sed $(SEDSPEC) $@.in > $@

IMAGE = bind9
bind9:
	docker build -t $(IMAGE) . 
	docker tag $(IMAGE)  $(REGISTRY)/$(IMAGE)
	docker push $(REGISTRY)/$(IMAGE)
clean:
	- /bin/rm $(YAMLFILES)

