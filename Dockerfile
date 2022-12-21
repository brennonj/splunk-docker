FROM debian:jessie

ENV SPLUNK_PRODUCT splunk
ENV SPLUNK_VERSION latest
ENV SPLUNK_BUILD 17e00c557dc1
ENV SPLUNK_FILENAME splunk-${SPLUNK_VERSION}-${SPLUNK_BUILD}-Linux-x86_64.tgz

ENV SPLUNK_HOME /opt/splunk
ENV SPLUNK_GROUP splunk
ENV SPLUNK_USER splunk
ENV SPLUNK_BACKUP_DEFAULT_ETC /var/opt/splunk
ARG DEBIAN_FRONTEND=noninteractive

# add splunk:splunk user
RUN groupadd -r ${SPLUNK_GROUP} \
    && useradd -r -m -g ${SPLUNK_GROUP} ${SPLUNK_USER}

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod +x /sbin/entrypoint.sh

# Copy new license
#COPY ./Splunk_Enterprise_Q3FY17.lic /var/opt/splunk/etc/licenses/download-trial/Splunk_Enterprise_Q3FY17.lic

# Open Splunk Web Port
EXPOSE 8000/tcp

WORKDIR /opt/splunk

# Configurations folder, var folder for everything (indexes, logs, kvstore)
VOLUME [ "/opt/splunk/etc", "/opt/splunk/var" ]

ENTRYPOINT ["/sbin/entrypoint.sh"]
CMD ["start-service"]
