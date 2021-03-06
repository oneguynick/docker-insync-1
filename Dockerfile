FROM tiredofit/debian:jessie
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

### Install Insync
	RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C && \
	    echo deb http://apt.insynchq.com/debian jessie non-free contrib >>/etc/apt/sources.list.d/insync.list && \
	    apt-get update && \
	    apt-get install -y insync-headless && \
	    apt-get clean && \
	    rm -rf /var/lib/apt/lists/* 

### Add Files
	ADD install /    

### Entrypoint Configuration
    ENTRYPOINT ["/init"]
