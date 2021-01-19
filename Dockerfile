FROM dkimg/opencv:4.5.1-ubuntu

WORKDIR /opt/nccn/build

RUN set -ex \
    && apt-get -qq update \
    && apt-get install git \
    && git clone https://github.com/Tencent/ncnn.git  \
    && cd ncnn  \
    && git submodule init && git submodule update  \
    && mkdir -p build && cd build \
    && cmake -DCMAKE_BUILD_TYPE=Release -DNCNN_VULKAN=OFF -DNCNN_PYTHON=ON -DNCNN_SYSTEM_GLSLANG=ON -DNCNN_BUILD_EXAMPLES=ON .. \
    && make -j$(nproc)