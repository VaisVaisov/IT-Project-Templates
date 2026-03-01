FROM archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -Sy --noconfirm \
        base-devel \
        valgrind \
        perf \
        linux-tools && \
    pacman -Scc --noconfirm

WORKDIR /app
