FROM ubuntu:latest

MAINTAINER Harry <harald.urban@weltn24.de>
LABEL vendor="WeltN24 Team Rabbit"
LABEL tools="aws git pip chrome node npm yarn"

# Install deps
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    git \
    python-pip \
    python2.7 \
    python2.7-dev \
    groff-base \
    --no-install-recommends

# Install aws cli
RUN pip install --upgrade pip setuptools
RUN pip install --upgrade awscli

# Get Chrome sources
RUN curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list

# Install Chrome
RUN apt-get update && apt-get install -y \
    google-chrome-stable \
    --no-install-recommends

# Find your desired version here: https://deb.nodesource.com/node_8.x/pool/main/n/nodejs/
# Ubuntu 16.04.3 LTS (Xenial Xerus) (https://wiki.ubuntu.com/Releases)
RUN curl https://deb.nodesource.com/node_8.x/pool/main/n/nodejs/nodejs_8.2.1-2nodesource1~xenial1_amd64.deb > node.deb \
 && dpkg -i node.deb \
 && rm node.deb

RUN npm --global install yarn@0.27.5