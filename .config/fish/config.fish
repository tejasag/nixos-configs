# eval (brew shellenv)
set -x TERM "xterm-kitty"
set -x DENO_INSTALL "/home/tejasagarwal/.deno"
set -x FLYCTL_INSTALL "/home/tejasagarwal/.fly"
set -x JAVA_HOME "/usr/lib/jvm/jdk-15.0.2"
# source $HOME/.cargo/env
set -x NVM_DIR "/home/tejasagarwal/.nvm"
set -x LDFLAGS "-L/home/linuxbrew/.linuxbrew/opt/isl@0.18/lib"
set -x CPPFLAGS "-I/home/linuxbrew/.linuxbrew/opt/isl@0.18/include"
set -x PKG_CONFIG_PATH "/home/linuxbrew/.linuxbrew/opt/isl@0.18/lib/pkgconfig"


alias please="sudo"
alias pls="sudo"
alias iamroot="sudo"
alias prismago='github.com/prisma/prisma-client-go'
alias dev="cd ~/Desktop/development"
alias nls="natls -ls"
alias mkcdir="mkdir $1 && cd $1"
alias ga="git add ."
alias gc="git commit"
alias gp="git push origin"
alias icat="kitty +kitten icat"
alias lx="natls -lgm"

function nvm
  bass source $NVM_DIR/nvm.sh --no-use ';' nvm $argv
end

nvm use default --silent
# direnv hook fish | source

starship init fish | source

### PATHS
# $HOME/go/bin $DENO_INSTALL/bin /snap/emacs/966/usr/bin $HOME/bin $FLYCTL_INSTALL/bin $JAVA_HOME/bin $JAVA_HOME /usr/lib/dart/bin $HOME/.local/bin
