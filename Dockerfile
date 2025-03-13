# FROM ubuntu:24.04
FROM python:3.9-slim

# Update and install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    vim \
    ssh \
    iputils-ping 

# Set Python 3.9 as default
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1

# Install pip (remove old pip if exists)
# RUN apt-get remove -y python3-pip && \
#     curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
#     python3 get-pip.py && \
#     rm get-pip.py

CMD ["python3", "main.py"]
