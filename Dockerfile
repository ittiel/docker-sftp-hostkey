FROM atmoz/sftp
MAINTAINER ittiel

#replace the default sftp folder
#replace the whole file
#COPY sshd_config /etc/ssh
#replace the line
RUN sed -i "s/ForceCommand internal-sftp/ForceCommand internal-sftp -d \/sftp-user/" /etc/ssh/sshd_config

#run the default sftp entrypoint
ENTRYPOINT ["/entrypoint"]