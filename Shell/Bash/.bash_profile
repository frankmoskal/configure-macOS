# Environment variables
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_EMOJI=1

# bash-completion configuration
if [ -f "/usr/local/share/bash-completion/bash_completion" ]; then . "/usr/local/share/bash-completion/bash_completion"; fi

# command-not-found configuration
if brew command command-not-found-init > /dev/null; then eval "$(brew command-not-found-init)"; fi

export PATH=$PATH":$HOME/bin"
export PATH="/usr/local/sbin:$PATH"

# .bash_aliases configuration
if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi