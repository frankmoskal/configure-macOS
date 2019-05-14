# hi
alias hi="echo \"Hi ${USER^}! Nice to see you here.\""

# custom fzf
alias fzf="fzf --preview '[[ \$(file --mime {}) =~ binary ]] && printf \"BINARY FILE\" || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -500'"

function brewfuck {
    # define variables
	local cmd
	local formula

	# converts the most recent command into a string array
	IFS=" " read -r -a cmd <<< "$(echo -e "$(fc -ln -1)" | xargs)"
	
	# determines the corresponding homebrew formula
	formula="$(brew which-formula "${cmd[0]}")"

	# if the formula doesn't exist
	if [ -z "${formula}" ]; then
		printf "unrecognized formula: %s.\n" "${formula}"
		return 1
	fi

	# if formula was already installed
	if brew list | grep -q "${formula}"; then
	    printf "%s already installed.\n" "${formula}"
	    return 1
	fi

	# install the package
	brew install -s "${formula}"
}