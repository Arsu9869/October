FROM centos
LABEL name=Ramesh
RUN cd /etc/yum.repos.d/
RUN  sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* 
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install nginx -y
COPY ./index.html /usr/share/nginx/html/index.html
COPY ./Script.sh /opt/src/scripts/setup.sh
RUN /opt/src/scripts/setup.sh
ENTRYPOINT nginx -g "daemon off;"
EXPOSE 80
