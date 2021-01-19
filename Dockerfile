FROM dkimg/opencv:4.5.1-ubuntu

WORKDIR /opt

RUN set -ex \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
        build-essential git cmake python3-dev\
    && git clone https://github.com/Tencent/ncnn.git  \
    && cd ncnn  \
    && git submodule init && git submodule update  \
    && mkdir -p build && cd build \
    && cmake -DCMAKE_BUILD_TYPE=Release -DNCNN_VULKAN=OFF -DNCNN_PYTHON=ON -DNCNN_SYSTEM_GLSLANG=ON -DNCNN_BUILD_EXAMPLES=ON .. \
    && make -j$(nproc)