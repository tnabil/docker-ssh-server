FROM ubuntu

RUN apt-get update && apt-get install -y openssh-server curl; \
  mkdir /var/run/sshd; \
  mkdir /root/.ssh && chmod 700 /root/.ssh

COPY authorized_keys /root/.ssh/authorized_keys

RUN chmod 600 /root/.ssh/authorized_keys

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]