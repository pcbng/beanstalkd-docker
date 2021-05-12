FROM 026842570183.dkr.ecr.us-east-1.amazonaws.com/ubuntu:15.04

ADD install.sh beanstalkd-1.10.tar.gz /install/
RUN cd /install && ./install.sh 1.10 && rm -rf /install

EXPOSE 11300
CMD ["beanstalkd", "-p", "11300"]
