FROM ubuntu:16.04

# Get dependencies
RUN apt-get update && apt-get install -y \
    libglew-dev \
	libeigen3-dev \
    libopencv-dev \
	cmake git wget \
	&& apt-get clean \ 
	&& rm -rf /var/lib/apt/lists/
	
RUN cd /opt && git clone https://github.com/stevenlovegrove/Pangolin.git \
	&& cd Pangolin && mkdir build && cd build && cmake  .. \
	&& make -j4 && make install

COPY . /opt/ORB_SLAM2

RUN cd /opt/ORB_SLAM2 && chmod +x build.sh && sh build.sh

WORKDIR /opt/ORB_SLAM2