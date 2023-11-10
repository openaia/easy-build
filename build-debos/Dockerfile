FROM debian:bullseye

LABEL maintainer="Jagan Teki <jagan@edgeble.ai>"
LABEL release="bullseye"

# Set up the non-interactive container build
ARG DEBIAN_FRONTEND=noninteractive

# Set up locales
RUN apt-get update && apt-get install -y \
    locales sudo && \
    dpkg-reconfigure locales && \
    locale-gen en_US.UTF-8 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV LANG en_US.utf8

# Install packages listed in Debos documentation as esential
RUN apt-get update && apt-get install -y \
    git \
    debos \
    dosfstools \
    python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install gdown

# Install and update ca-certificates
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    update-ca-certificates

RUN useradd -ms /bin/bash build
RUN usermod -aG sudo build
RUN echo "build ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/build

USER build
WORKDIR /home/build
