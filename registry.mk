#
# define REGISTRY location based upon Rocks attributes in the kubernetes roll
#
REGISTRY_HOST = $(shell /opt/rocks/bin/rocks report host attr localhost attr=Kickstart_PrivateHostname)
REGISTRY_DNS= $(shell /opt/rocks/bin/rocks report host attr localhost attr=Kickstart_PrivateDNSDomain)
REGISTRY_PORT = $(shell /opt/rocks/bin/rocks report host attr localhost attr=DOCKER_REGISTRY_PORT)
REGISTRY = $(REGISTRY_HOST).$(REGISTRY_DNS):$(REGISTRY_PORT)
NFS_SERVER = $(REGISTRY_HOST)
NFS_SERVER_IP = $(shell /opt/rocks/bin/rocks report host attr localhost attr=Kickstart_PrivateAddress)
