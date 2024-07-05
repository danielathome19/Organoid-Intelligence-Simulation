FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    python3 \
    python3-pip \
    wget \
    curl \
    git \
    libpython3-dev \
    bsdmainutils

RUN apt-get remove -y cmake
RUN wget https://github.com/Kitware/CMake/releases/download/v3.21.3/cmake-3.21.3-linux-x86_64.sh
RUN chmod +x cmake-3.21.3-linux-x86_64.sh
RUN ./cmake-3.21.3-linux-x86_64.sh --skip-license --prefix=/usr/local
RUN rm cmake-3.21.3-linux-x86_64.sh

COPY install_biodynamo.sh /install_biodynamo.sh

RUN bash /install_biodynamo.sh

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install tensorflow pybind11

WORKDIR /usr/src/app

COPY . .

RUN mkdir -p build
WORKDIR /usr/src/app/build
RUN cmake ..
RUN make

WORKDIR /usr/src/app

ENTRYPOINT ["./run.sh"]
