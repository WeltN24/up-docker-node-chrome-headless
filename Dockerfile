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

# Add Chrome as a user
RUN groupadd -r chrome && useradd -r -g chrome -G audio,video chrome \
	&& mkdir -p /home/chrome && chown -R chrome:chrome /home/chrome

# Add Jenkins as a user
RUN groupadd -r jenkins && useradd -r -g jenkins -G audio,video,sudo jenkins \
	&& mkdir -p /home/jenkins && chown -R jenkins:jenkins /home/jenkins

# Install node / npm / yarn
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get install -y nodejs
RUN npm --global install yarn@0.27.5