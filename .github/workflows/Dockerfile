FROM fedora:36

RUN yum -y install \
	fio \
	curl \
	sysbench \
	; \
	yum clean all

RUN wget https://github.com/kastenhq/kubestr/releases/download/v0.4.35/kubestr_0.4.35_Linux_amd64.tar.gz

