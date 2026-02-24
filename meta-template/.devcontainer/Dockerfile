# Base Dev Container - Arch Linux
# Minimal setup for general development

FROM archlinux:latest

# Fix pacman.conf and init keyring
RUN sed -i '/NoExtract/d' /etc/pacman.conf && \
    pacman-key --init && \
    pacman-key --populate archlinux && \
    pacman -Sy --noconfirm archlinux-keyring && \
    pacman -Syu --noconfirm

# Install base packages
RUN pacman -S --noconfirm \
        base-devel \
        git \
        git-delta \
        neovim \
        sudo \
        wget \
        curl \
        openssh \
        nodejs \
        npm \
        fzf \
        unzip \
        zsh \
        zsh-completions \
        github-cli \
        docker \
        docker-buildx \
        lazydocker && \
    pacman -Scc --noconfirm

# TODO: Add language-specific packages here
# Example:
# RUN pacman -S --noconfirm clang cmake ninja && pacman -Scc --noconfirm

# Create vscode user with sudo
RUN useradd -m -s /bin/bash vscode && \
    echo "vscode ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/vscode && \
    chmod 0440 /etc/sudoers.d/vscode

# Add vscode to docker group
RUN usermod -aG docker vscode

# Setup bash history persistence
RUN mkdir -p /commandhistory && \
    touch /commandhistory/.bash_history && \
    chown -R vscode:vscode /commandhistory

# Setup workspace and claude config
RUN mkdir -p /workspaces /home/vscode/.claude && \
    chown -R vscode:vscode /workspaces /home/vscode/.claude

# Switch to vscode user
USER vscode

# Setup bash
RUN echo 'export HISTFILE=/commandhistory/.bash_history' >> ~/.bashrc && \
    echo 'export HISTSIZE=10000' >> ~/.bashrc && \
    echo 'export HISTFILESIZE=10000' >> ~/.bashrc && \
    echo 'export PROMPT_COMMAND="history -a"' >> ~/.bashrc

# Install yay-bin
RUN git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin && \
    cd /tmp/yay-bin && makepkg -si --noconfirm && \
    rm -rf /tmp/yay-bin

# Install Claude Code and Qwen Code from AUR
RUN yay -S --noconfirm claude-code qwen-code

# Install oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install Powerlevel10k theme
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

# Configure zsh
RUN sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc && \
    echo '' >> ~/.zshrc && \
    echo '# User configuration' >> ~/.zshrc && \
    echo 'export HISTFILE=/commandhistory/.bash_history' >> ~/.zshrc && \
    echo 'export HISTSIZE=10000' >> ~/.zshrc && \
    echo 'export SAVEHIST=10000' >> ~/.zshrc && \
    echo 'setopt SHARE_HISTORY' >> ~/.zshrc && \
    echo 'POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true' >> ~/.zshrc

# Set default shell to zsh
USER root
RUN usermod -s /bin/zsh vscode
USER vscode

# Environment variables
ENV DEVCONTAINER=true
ENV SHELL=/bin/zsh
ENV EDITOR=nvim
ENV VISUAL=nvim

WORKDIR /workspaces

# Start Docker daemon and then launch shell
ENTRYPOINT ["/bin/sh", "-c", "dockerd &>/dev/null & sleep 2 && exec /bin/zsh"]
