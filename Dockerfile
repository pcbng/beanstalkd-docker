FROM 026842570183.dkr.ecr.us-east-1.amazonaws.com/alpine:3.13

ENV VERSION_BEANSTALKD="1.12"

RUN addgroup -S beanstalkd && adduser -S -G beanstalkd beanstalkd
RUN apk add --no-cache 'su-exec>=0.2'

RUN apk --update add beanstalkd && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/*

RUN mkdir /data && chown beanstalkd:beanstalkd /data

VOLUME ["/data"]

EXPOSE 11300

ENTRYPOINT ["beanstalkd", "-p", "11300", "-u", "beanstalkd"]
CMD ["-b", "/data"]