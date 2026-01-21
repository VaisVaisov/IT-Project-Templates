FROM ubuntu:22.04

RUN apt update && apt install -y \
    build-essential \
    valgrind \
    linux-tools-common \
    linux-tools-generic \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app