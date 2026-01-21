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
        vim \
        neovim \
        sudo \
        wget \
        curl \
        openssh \
        nodejs \
        npm \
        fzf \
        jq \
        man-db \
        unzip \
        zsh \
        zsh-completions \
        github-cli \
        htop \
        mc && \
    pacman -Scc --noconfirm

# Create vscode user with sudo
RUN useradd -m -s /bin/bash vscode && \
    echo "vscode ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/vscode && \
    chmod 0440 /etc/sudoers.d/vscode

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

# Setup npm for user
RUN mkdir -p ~/.npm-global && \
    npm config set prefix ~/.npm-global && \
    echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.bashrc

# Install Claude Code CLI
RUN export PATH=~/.npm-global/bin:$PATH && \
    npm install -g @anthropic-ai/claude-code@latest

# Install oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install Powerlevel10k theme
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

# Configure zsh
RUN sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc && \
    echo '' >> ~/.zshrc && \
    echo '# User configuration' >> ~/.zshrc && \
    echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.zshrc && \
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

CMD ["/bin/zsh"]
