FROM debian:latest

WORKDIR /root/
ENV HOME /root

COPY .zshrc .zshrc

RUN apt update
RUN apt install -y --no-install-recommends \
    clang \
    cmake \
    curl \
    git-all \
    golang \
    make \
    python3-venv \
    ripgrep \
    unzip \
    zsh \
    ;

# Neovim
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz && \
    tar -C /opt -xzf nvim-linux64.tar.gz && \
    rm -rf nvim-linux64.tar.gz

# Powerlevel 10k
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
# zsh
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash && \
    zsh -c "source ${HOME}/.zshrc && nvm install node"
# golang
RUN go install golang.org/x/tools/gopls@latest
# rust
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y

COPY . .

CMD ["zsh"]
