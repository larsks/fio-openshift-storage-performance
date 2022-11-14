FROM fedora:36

COPY resources/kubestr /bin/

RUN yum -y install \
	fio \
	curl \
	wget \
	sysbench \
	; \
	yum clean all
