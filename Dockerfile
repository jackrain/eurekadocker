# Dockerfile for apollo quick start
# Build with:
# docker build -t apollo-quick-start .
# Run with:
# docker-compose up

FROM registry.acs.aliyun.com/open/java8:4.0.0
MAINTAINER nobodyiam<https://github.com/nobodyiam>

COPY eurekaserver-0.0.1-SNAPSHOT.jar /opt/eurekaserver-0.0.1-SNAPSHOT.jar

EXPOSE 8761

WORKDIR /opt

CMD ["java -jar eurekaserver-0.0.1-SNAPSHOT.jar"]
