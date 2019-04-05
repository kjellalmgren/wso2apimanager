# Start from Java Open JDK
FROM debian:jessie
MAINTAINER Kjell Almgren, Tetracon, kjell.almgren@tetracon.se

# ENV
ENV VERSION 8
ENV UPDATE 144
ENV BUILD 25

ENV JAVA_HOME /usr/lib/jvm/java-${VERSION}-oracle

# Check to version on WSO2 web site
ARG APIM_VERSION=${APIM_VERSION:-2.6.0}

WORKDIR /opt/wso2am-${APIM_VERSION}

# COPY distribution
COPY wso2am-${APIM_VERSION}.zip /opt

RUN apt-get update && \
    apt-get install -y zip && \
    apt-get clean && \
    apt-get install -y  software-properties-common && \
    echo "===> add webupd8 repository..."  && \
    echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list  && \
    echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list  && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886  && \
    apt-get update  && \
    \
    echo "===> install Java"  && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections  && \
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections  && \
    DEBIAN_FRONTEND=noninteractive  apt-get install -y --force-yes oracle-java8-installer oracle-java8-set-default  && \
    \
    echo "===> clean up..."  && \
    rm -rf /var/cache/oracle-jdk8-installer  && \
    apt-get clean  && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    echo "===> Installing API-Manager 2.6.0" && \
    unzip /opt/wso2am-${APIM_VERSION}.zip -d /opt && \
    rm /opt/wso2am-${APIM_VERSION}.zip && \
    apt-get update && \
    apt-get clean
    
RUN update-alternatives --install "/usr/bin/java" "java" "${JAVA_HOME}/bin/java" 1 && \
    update-alternatives --set java "${JAVA_HOME}/bin/java"

EXPOSE 9443 9763 8243 8280 10397 7711

ENTRYPOINT ["bin/wso2server.sh"]