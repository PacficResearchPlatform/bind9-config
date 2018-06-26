FROM centos:7
MAINTAINER Philip Papadopoulos <philip.papadopoulos@gmail.com> 
RUN yum -y install bind
EXPOSE 53 
CMD ["named", "-c", "/var/named/named.conf", "-g", "-u", "named"]
#CMD ["sleep", "300"]
