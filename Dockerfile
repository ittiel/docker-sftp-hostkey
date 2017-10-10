FROM atmoz/sftp
MAINTAINER ittiel


RUN apt-get update && apt-get install -y \
    vim\
    rsyslog

#add rsyslog
COPY rsyslog.conf /etc/rsyslog.d/sftp.conf

#replace the line
RUN sed -i "s/ForceCommand internal-sftp/ForceCommand internal-sftp -d \/taykey -l INFO/" /etc/ssh/sshd_config

#enable auditing
RUN sed -i "s/#LogLevel VERBOSE/LogLevel DEBUG/" /etc/ssh/sshd_config
RUN echo "SyslogFacility AUTH" >> /etc/ssh/sshd_config

#run the default sftp entrypoint
#override original file with rsyslog service
COPY entrypoint /entrypoint
RUN chmod 775 /entrypoint

ENTRYPOINT ["/entrypoint"]

