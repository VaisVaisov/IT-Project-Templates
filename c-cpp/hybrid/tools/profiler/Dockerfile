FROM archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -Sy --noconfirm \
        base-devel \
        valgrind \
        python \
        python-pip && \
    pip install --break-system-packages snakeviz py-spy && \
    pacman -Scc --noconfirm

WORKDIR /app
