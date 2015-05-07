FROM ubuntu:trusty

RUN apt-get update && apt-get upgrade -y

ADD http://repos.sensuapp.org/apt/pubkey.gpg /sensu_key.gpg
RUN apt-key add sensu_key.gpg
RUN echo "deb     http://repos.sensuapp.org/apt sensu main" >> /etc/apt/sources.list.d/sensu.list
RUN apt-get update && apt-get install -y uchiwa

CMD /opt/uchiwa/bin/uchiwa -c /etc/sensu/conf.d/uchiwa.json -p /opt/uchiwa/src/public
