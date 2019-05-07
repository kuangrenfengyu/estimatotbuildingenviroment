FROM jenkins/ssh-slave
MAINTAINER Lei Zhang <lei.zhang@clustar.ai>

# install bazel
RUN apt update \
    && apt install  -y pkg-config zip g++ zlib1g-dev unzip python \
    python-dev python-pip \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
RUN wget https://github.com/bazelbuild/bazel/releases/download/0.25.0/bazel-0.25.0-installer-linux-x86_64.sh \
    && chmod +x bazel-0.25.0-installer-linux-x86_64.sh \
    && ./bazel-0.25.0-installer-linux-x86_64.sh
# install tensorflow 2.7
RUN pip install --upgrade tensorflow
