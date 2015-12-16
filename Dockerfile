FROM ubuntu:15.04
MAINTAINER Peter Bakhirev "peter@pcb.ng"

ADD install.sh beanstalkd-1.10.tar.gz /install/
RUN cd /install && ./install.sh 1.10 && rm -rf /install

EXPOSE 11300
CMD ["beanstalkd", "-p", "11300"]
