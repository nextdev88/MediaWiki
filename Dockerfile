FROM centos

RUN mkdir  /apps
RUN yum -y install initscripts && yum clean all
COPY install.sh /apps/install.sh
CMD /apps/install.sh
