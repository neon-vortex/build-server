FROM ubuntu:18.04
RUN apt-get -y update
RUN apt-get install -y default-jdk
RUN apt-get -y upgrade
RUN apt-get install -y build-essential
RUN apt-get install -y cmake
RUN apt-get install -y gdbserver
RUN apt-get install -y git
RUN apt-get install -y curl
RUN apt-get install -y wget
RUN apt-get install -y vim
RUN apt-get install -y nano
RUN apt-get install -y python
RUN apt-get install -y python3
ENV NODE_VERSION=8.12.0
ENV NODE_INSTALLATION_FILE_NAME="node-v${NODE_VERSION}-linux-x64.tar.xz"
RUN wget https://nodejs.org/dist/v${NODE_VERSION}/${NODE_INSTALLATION_FILE_NAME} -O /tmp/${NODE_INSTALLATION_FILE_NAME}
RUN tar -xf /tmp/${NODE_INSTALLATION_FILE_NAME} -C /tmp/
RUN cp -r /tmp/node-v${NODE_VERSION}-linux-x64/bin/* /usr/local/bin/
RUN cp -r /tmp/node-v${NODE_VERSION}-linux-x64/lib/* /usr/local/lib/
RUN apt-get install -y unzip
RUN apt-get install -y nginx
RUN apt-get install -y libevent-dev
RUN mkdir -p /tmp
RUN rm -rf /tmp/libv8-artifacts
RUN (git clone https://github.com/neon-vortex/libv8-artifacts.git /tmp/libv8-artifacts && cd /tmp/libv8-artifacts && git checkout 7.2.461)
RUN cp /tmp/libv8-artifacts/lib/Linux@x86_64/libv8_monolith.a /usr/local/lib/
RUN rm -rf /tmp/libv8-artifcacts
RUN apt-get update && apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y libpoco-dev
RUN apt-get install -y libboost-all-dev
RUN apt-get install -y libcpprest-dev
RUN apt-get install -y autoconf automake libtool curl make g++ unzip
RUN git clone https://github.com/protocolbuffers/protobuf.git
RUN (cd protobuf && autoreconf --install && git checkout v3.6.1 && git submodule update --init --recursive && ./autogen.sh && ./configure && make && make install)
RUN ldconfig
