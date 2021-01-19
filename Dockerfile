FROM dkimg/opencv:4.5.1-ubuntu

WORKDIR /opt/nccn/build

RUN set -ex \
    && apt-get -qq update