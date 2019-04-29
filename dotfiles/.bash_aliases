# hi
alias hi="echo \"Hi ${USER^}! Nice to see you here.\""

# fzf
alias fzf="fzf --preview '[[ \$(file --mime {}) =~ binary ]] && printf \"BINARY FILE\" || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -500'"

# gimme
alias gimme="brew install -s \"$(brew which-formula $(fc -ln -1))\""