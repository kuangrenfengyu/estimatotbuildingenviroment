FROM jenkins/ssh-slave

RUN apt update
# install bazel
RUN apt install pkg-config zip g++ zlib1g-dev unzip python -y
RUN wget https://github.com/bazelbuild/bazel/releases/download/0.25.0/bazel-0.25.0-installer-linux-x86_64.sh
RUN chmod +x bazel-0.25.0-installer-linux-x86_64.sh
RUN ./bazel-0.25.0-installer-linux-x86_64.sh
# install tensorflow 2.7
RUN apt install python-dev python-pip
RUN pip install --upgrade tensorflow
