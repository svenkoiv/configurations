# Setup fzf
# ---------
if [[ ! "$PATH" == */home/skoiv/.fzf/bin* ]]; then
	export PATH="${PATH:+${PATH}:}/home/skoiv/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/skoiv/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/skoiv/.fzf/shell/key-bindings.bash"

is_in_git_repo() {
	git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
	fzf --height 50% "$@" --border
}


gb() {
	is_in_git_repo || return
	git branch -a --color=always | grep -v '/HEAD\s' | sort |
		fzf-down --ansi --multi --tac --preview-window right:70% \
		--preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES |
		sed 's/^..//' | cut -d' ' -f1 |
		sed 's#^remotes/##'
}

bind '"\C-g\C-b": "$(gb)\e\C-e\er"'

export FZF_DEFAULT_OPTS="--color=bg+:#262626,fg+:#ffffff --multi --bind='alt-t:toggle-all'"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
