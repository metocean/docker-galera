FROM  erkules/galera:basic
MAINTAINER Andre Lobato <andre@metocean.co.nz>

RUN apt-get update && apt-get -y install wget unzip dnsutils

# Install consul
RUN echo "-----------------Install Consul-----------------" &&\
    cd /tmp &&\
    mkdir /consul &&\
    wget https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip &&\
    unzip consul_0.6.4_linux_amd64.zip &&\
    mv consul /usr/bin &&\
    rm -r consul_0.6.4_linux_amd64.zip

COPY mysqld.sh /mysqld.sh
RUN chmod 555 /mysqld.sh

ENTRYPOINT ["/mysqld.sh"] 

EXPOSE 3306 4444 4567 4568