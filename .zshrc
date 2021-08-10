### ZSH Functions

# load vcs info plugin
autoload -Uz vcs_info
autoload -Uz compinit
compinit

precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '(%b) '
zstyle ':completion:*' list-colors 'exfxcxdxbxegedabagacad'
export CLICOLOR=1;


# info: https://arjanvandergaag.nl/blog/customize-zsh-prompt-with-vcs-info.html 
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST

PROMPT='%F{green}${PWD/#$HOME/~} ${vcs_info_msg_0_}>%f '
#PROMPT="%~ %# "
#PROMPT="%F{green}%~ >%f "

### Programming specific stuff
export GOPATH="$HOME/workspace/go"

# pyenv required stuff
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi


### Security specific stuff

export seclists="$HOME/4tools/SecLists/"
export raftsmall="$seclists/Discovery/Web-Content/raft-small-files.txt"
export raftmed="$seclists/Discovery/Web-Content/raft-medium-files.txt"
export raftbig="$seclists/Discovery/Web-Content/raft-large-words.txt"
export bigtxt="$seclists/Discovery/Web-Content/big.txt"
export naughty="$seclists/Fuzzing/big-list-of-naughty-strings.txt"

insecure_ssh () { ssh -o StrictHostKeyChecking=no -o GlobalKnownHostsFile=/dev/null -o UserKnownHostsFile=/dev/null -v $1 ; } 
crfind () { rg  -p -C 15 -i -F $1  | less -R ; }

export PATH="$HOME/workspace/go/bin:$PATH"

# scroll through history
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

#source <(kubectl completion zsh)
#source <(minikube completion zsh)
#eval $(crc oc-env)
