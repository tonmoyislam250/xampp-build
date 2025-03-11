FROM docker.io/centos:7.3.1611
LABEL maintainer "Apache Friends"
ARG IB_VERSION=25.3.0

# Compilation tools
RUN yum install -y \
ca-certificates file m4 gcc gcc-c++ make perl patch unzip bzip2 epel-release \
&& yum install -y p7zip p7zip-plugins \
&& yum clean all

RUN curl > 'tclkit' 'http://kitcreator.rkeene.org/kits/bc1cafff2c3d7f515ffe6bf31f74864b345ec272/tclkit' \
&& chmod 755 tclkit && mv tclkit /usr/local/bin

RUN curl -L > 'installbuilder.run' "https://releases.installbuilder.com/installbuilder/installbuilder-${IB_VERSION}-linux-x64-installer.run" \
&& chmod 755 installbuilder.run && ./installbuilder.run --mode unattended --prefix /opt/installbuilder \
&& rm installbuilder.run && ln -sf /opt/installbuilder /root/installbuilder-${IB_VERSION}

CMD [ "bash" ]
