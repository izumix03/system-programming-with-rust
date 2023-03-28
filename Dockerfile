# Build and run:
#   docker build -t clion/ubuntu/cpp-env:1.0 -f Dockerfile.cpp-env-ubuntu .

FROM ubuntu:20.04

RUN DEBIAN_FRONTEND="noninteractive" apt-get update && apt-get -y install tzdata

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y build-essential \
      curl \
      git \
      gcc \
  && apt-get clean

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile default --component rls rust-analysis

RUN . "$HOME/.cargo/env"
