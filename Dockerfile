FROM ubuntu:24.04

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    software-properties-common \
    curl \
    git \
    vim \
    ssh \
    build-essential \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update && apt-get install -y \
    python3.9 \
    python3.9-dev \
    python3.9-distutils

# Set Python 3.9 as default
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1

# Install pip (remove old pip if exists)
RUN apt-get remove -y python3-pip && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py
