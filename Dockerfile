FROM debian:8

# Base utilities I can't live without
RUN apt-get update && apt-get install -y apt-utils apt-file
RUN apt-get install -y --no-install-recommends \
	ca-certificates \
	wget \
	file \
	exuberant-ctags \
	cscope \
	git \
	vim \
	gdb

# Other handy utilities
RUN apt-get install -y --no-install-recommends aptitude man-db

# Configure git
RUN git config --global user.email "ajuaristi@gmx.es"
RUN git config --global user.name "Ander Juaristi"

# First clone base exVim.
# Second, merge my contributions, not yet in upstream.

WORKDIR /root
ADD .bashrc .bashrc

#RUN wget https://github.com/exvim/main/releases/download/v0.5.0/exvim-v0.5.0.tar.gz
#RUN mkdir exvim && tar -xz -C exvim -f exvim-v0.5.0.tar.gz && rm exvim-v0.5.0.tar.gz
RUN git clone https://github.com/juaristi/main exvim
WORKDIR exvim

RUN chmod u+x unix/*
RUN unix/install.sh

#
#
#
#RUN apt-get install -y --no-install-recommends openjdk-7-jdk
#RUN wget -O eclipse.tar.gz http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/epp/downloads/release/mars/2/eclipse-cpp-mars-2-linux-gtk-x86_64.tar.gz
#RUN tar -xzf eclipse.tar.gz
