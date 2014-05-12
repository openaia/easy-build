# ===========================================================================================
# Dockerfile for building the Yocto Project
# 
# References:
#	http://www.yoctoproject.org/docs/1.6/yocto-project-qs/yocto-project-qs.html
# ===========================================================================================

#FROM ubuntu
FROM gmacario/easy-build

MAINTAINER Gianpaolo Macario, gmacario@gmail.com

# Make sure the package repository is up to date
RUN apt-get update
RUN apt-get -y upgrade

# Install packages we cannot leave without...
RUN apt-get install -y git tig
RUN apt-get install -y mc
RUN apt-get install -y openssh-server
# Make sure the directory exists, otherwise sshd will not start
RUN mkdir -p /var/run/sshd
RUN apt-get install -y screen

# Install the following utilities (required by poky)
RUN apt-get install -y gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath libsdl1.2-dev xterm

# NOTE: Uncomment if user "build" is not already created inside the base image
## Create non-root user that will perform the build of the images
#RUN useradd --shell /bin/bash build
#RUN mkdir -p /home/build
#RUN chown -R build /home/build

# TODO: Run as user "build" rather than root
# once Docker supports user-level volumes

# Checkout poky from git

#RUN su -c "mkdir -p ~/yocto" build
#RUN su -c "cd ~ && git clone git://git.yoctoproject.org/poky" build

RUN mkdir -p /opt/yocto
RUN su -c "cd /opt/yocto && git clone git://git.yoctoproject.org/poky" root

# Define container entry point
#ENTRYPOINT ["/bin/su", "-l", "build"]
ENTRYPOINT ["/bin/bash"]

# Expose sshd port
EXPOSE 22

# EOF