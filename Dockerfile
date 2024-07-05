FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    python3 \
    python3-pip \
    wget \
    curl \
    git \
    libpython3-dev

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
