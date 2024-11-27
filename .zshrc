# Ensure standard directories are in PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# load zsh-completions
autoload -U compinit && compinit

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=/opt/homebrew/bin:$PATH
export PATH="/usr/local/opt/openjdk@17/bin:$PATH"
export PATH="$HOME/.rd/bin:$PATH"
# export PATH="/Users/pburlacuopus2.com/Development/personal/aerospace/bin/aerospace"
export namespace=pburlacu
export Platform_env=aws
export JAVA_HOME="/Users/pburlacuopus2.com/Library/Java/JavaVirtualMachines/corretto-21.0.4/Contents/Home/"

export QEMU_EXECUTABLE=$(which qemu-system-x86_64)




# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"


fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

plugins=(
    git
    zsh-completions
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# get machine's ip address
alias ip="ipconfig getifaddr en0"
# edit global zsh configuration
alias zshconfig="vim ~/.zshrc"
# reload zsh configuration
alias zshsource="source ~/.zshrc"
# reload zsh configuration
alias ohmyzsh="cd ~/.oh-my-zsh"

# navigate to global ssh directory
alias sshhome="cd ~/.ssh"
# edit global ssh configuration
alias sshconfig="vim ~/.ssh/config"

# navigate to global git directory
alias githome=""
# edit global git configuration
alias gitconfig="vim ~/.gitconfig"
# git aliases
alias gitfa="git fetch --all"
alias gits="git status"
alias gitd="git diff"
alias gitl="git lg"
alias gita="git add ."
alias gitc="cz commit"

# utility
alias ll="exa -lah"
alias ..="cd .."

alias j8="export JAVA_HOME=`/usr/libexec/java_home -v 1.8`; java -version"
alias j17="export JAVA_HOME=`/usr/libexec/java_home -v 17`; java -version"

gardenRun() {
  echo "Running garden dev mode --env=aws"
  cd ~/development/git/garden-dev
  garden --env=aws dev db-mongo,mq-rabbit,storage-api-prebuilt,user-manager-api-prebuilt,storage-minio,smtp,db-elastic
}

getWeather() {
    ansiweather -l $1 -f 3
}

forwardPorts() {
  stopForwardPorts
  echo "Forwarding ports for: [db-mongo, mq-rabbit, storage-minio, smtp]"
  kubectl port-forward services/db-mongo 27017:27017 --namespace=platform-pburlacu & \
  kubectl port-forward services/mq-rabbit 5672:5672 --namespace=platform-pburlacu & \
  kubectl port-forward services/storage-minio 9000:9000 --namespace=platform-pburlacu & \
  kubectl port-forward services/smtp 33885:25 --namespace=platform-pburlacu
}

stopForwardPorts() {
  pkill kubectl -9
}

function pcurl() {
  curl "$1" | python -m json.tool
}

# load zsh-completions
autoload -U compinit && compinit

# use nvm
source /opt/homebrew/opt/nvm/nvm.sh

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi


eval "$(starship init zsh)"
source /Users/pburlacuopus2.com/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/opt/nvm/nvm.sh

export PATH="$HOME/.rye/env:$PATH"
source "$HOME/.rye/env"
#

