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
export GOPATH="$HOME/w/go"

# pyenv required stuff
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

#go/bin in path
export PATH="$HOME/w/go/bin:$PATH"

## shell specific stuff

export MANPAGER="less -X";
export HISTSIZE=50000000;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredups;

export VISUAL=vim
export EDITOR=vim

# scroll through history
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

#source <(kubectl completion zsh)
#source <(minikube completion zsh)
#eval $(crc oc-env)

# misc


# yubikey
#export GPG_TTY="$(tty)"
#export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
#gpgconf --launch gpg-agent
###export SSH_AUTH_SOCKET=$HOME/.gnupg/S.gpg-agent.ssh
###gpg-connect-agent updatestartuptty /bye >/dev/null
alias swap_yubikey='gpg-connect-agent "scd serialno" "learn --force" /bye'



# stop semgrep from snitching
export SEMGREP_SEND_METRICS=off


alias get_semgrep_agent_results="cat .semgrep_logs/semgrep_agent_output | jq '.[].results[].check_id' | sort | uniq -c | sort"


# shortcuts!
nullssh () { ssh -o StrictHostKeyChecking=no -o GlobalKnownHostsFile=/dev/null -o UserKnownHostsFile=/dev/null -v $@ ; }

crfind () { rg  -p -C 15 -i -F $1  | less -R ; }

alias pubip='dig +short myip.opendns.com @resolver1.opendns.com'



source ~/.dotfiles/.zsh_tricks_mac
