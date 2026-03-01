FROM archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -Sy --noconfirm \
        base-devel \
        valgrind && \
    pacman -Scc --noconfirm

WORKDIR /app
