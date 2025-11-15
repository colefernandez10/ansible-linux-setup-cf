# Dockerfile
FROM ubuntu:20.04

# Install OpenSSH server
RUN apt-get update && apt-get install -y openssh-server

# Create SSH run directory
RUN mkdir /var/run/sshd

# Set root password (for testing; later you’ll use keys)
RUN echo 'root:root' | chpasswd

# Allow root login
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Expose SSH port
EXPOSE 22

# Start SSH daemon
CMD ["/usr/sbin/sshd", "-D"]
