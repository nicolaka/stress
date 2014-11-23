FROM ubuntu:trusty
MAINTAINER Chad Metcalf <chad@docker.com>

# https://gist.github.com/jpetazzo/6127116
# this forces dpkg not to call sync() after package extraction and speeds up install
RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup
# we don't need and apt cache in a container
RUN echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache

RUN apt-get update
RUN apt-get install -y htop stress screen

CMD [ "stress", "--cpu", "8" ]
