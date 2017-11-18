# Start from Java Open JDK
FROM openjdk:8-jre-alpine
MAINTAINER Kjell Almgren, Tetracon, kjell.almgren@tetracon.se

# ARG VCS_REF
#LABEL org.label-schema.vcs-ref=$VCS_REF \
#      org.label-schema.vcs-url="https://github.com/ihcsim/docker-wso2apim"

ARG APIM_VERSION=${APIM_VERSION:-2.1.0}

WORKDIR /opt/wso2am-${APIM_VERSION}

# COPY distribution
COPY wso2am-${APIM_VERSION}.zip /opt

RUN apt-get update && \
    apt-get install -y zip && \
    apt-get clean && \
    unzip /opt/wso2am-${APIM_VERSION}.zip -d /opt && \
    rm /opt/wso2am-${APIM_VERSION}.zip

EXPOSE 9443 9763 8243 8280 10397 7711

# ENTRYPOINT ["bin/wso2server.sh"]