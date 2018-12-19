# Dockerfile for apollo quick start
# Build with:
# docker build -t apollo-quick-start .
# Run with:
# docker-compose up

FROM openjdk:8-jre-alpine
MAINTAINER nobodyiam<https://github.com/nobodyiam>

COPY eurekaserver-0.0.1-SNAPSHOT.jar /opt/eurekaserver-0.0.1-SNAPSHOT.jar

EXPOSE 8761

RUN echo "http://mirrors.aliyun.com/alpine/v3.6/main" > /etc/apk/repositories \
    && echo "http://mirrors.aliyun.com/alpine/v3.6/community" >> /etc/apk/repositories \
    && apk update upgrade \
    && apk add --no-cache curl bash \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && sed -i'.bak' '/db_url/s/localhost/apollo-db/g' /apollo-quick-start/demo.sh \
    && sed -i "s/exit 0;/tail -f \/dev\/null/g" /apollo-quick-start/demo.sh

WORKDIR /opt

CMD ["java -jar eurekaserver-0.0.1-SNAPSHOT.jar"]
