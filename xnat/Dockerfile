FROM tomcat:7-jre8-alpine

ARG XNAT_VER
ARG XNAT_ROOT
ENV XNAT_DATASOURCE_DRIVER=org.postgresql.Driver
ENV XNAT_HIBERNATE_DIALECT=org.hibernate.dialect.PostgreSQL9Dialect
ARG TOMCAT_XNAT_FOLDER=ROOT

RUN apk add --no-cache \
        postgresql-client \
        wget \
    && \
    rm -rf $CATALINA_HOME/webapps/* && \
    mkdir -p \
        $CATALINA_HOME/webapps/${TOMCAT_XNAT_FOLDER} \
        ${XNAT_HOME}/config \
        ${XNAT_HOME}/logs \
        ${XNAT_HOME}/plugins \
        ${XNAT_HOME}/work \
        ${XNAT_ROOT}/archive \
        ${XNAT_ROOT}/build \
        ${XNAT_ROOT}/cache \
        ${XNAT_ROOT}/ftp \
        ${XNAT_ROOT}/pipeline \
        ${XNAT_ROOT}/prearchive \
    && \
    cd $CATALINA_HOME/webapps/ && \
    wget https://api.bitbucket.org/2.0/repositories/xnatdev/xnat-web/downloads/xnat-web-${XNAT_VER}.war && \
    cd ${TOMCAT_XNAT_FOLDER} && \
    unzip -o ../xnat-web-${XNAT_VER}.war && \
    rm -f ../xnat-web-${XNAT_VER}.war && \
    apk del wget


EXPOSE 8080 8104

COPY make-xnat-config.sh /usr/local/bin/make-xnat-config.sh

ENTRYPOINT [ /usr/local/bin/make-xnat-config.sh ]

# CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
