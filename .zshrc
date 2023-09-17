# enable color
autoload -Uz colors
colors

# set emacs keybind(default behavior of shell)
bindkey -e

# bindkey -v # vim keybind
# auto complete
autoload -U compinit; compinit

# ?
zstyle ':completion:*:default' menu select=1

# specify <Tab> bihind
unsetopt auto_menu

# command history setting
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000

# unique history
setopt hist_ignore_all_dups
# share history
setopt share_history
# unique history's setting (fifo)
setopt hist_save_nodups
# history space deletion
setopt hist_reduce_blanks

# history search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# auto pushd (can be viewed on cd -<Tab>)
setopt auto_pushd
# unique pushd
setopt pushd_ignore_dups

# specify word delimiter (useful in <C-w>)
autoload -U select-word-style
select-word-style bash

# disable beep
setopt no_beep

# move to parent directory on <C-y>
function cd-up {
	zle push-line && LBUFFER='builtin cd ..' && zle accept-line
}
zle -N cd-up
bindkey '^y' cd-up

# disable <C-d> (disable logout shortcut)
setopt ignoreeof

# custom prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
# right prompt
precmd () {
	# current directory in yallow
	local left='%F{11}[%d]%f'
	# branch name when versioned
	vcs_info
	local right="%{\e[38;5;32m%}${vcs_info_msg_0_}%{\e[m%}"
	# caluculate space length
	local invisible='%([BSUbfksu]|([FK]|){*})'
	local leftwidth=${#${(S%%)left//$~invisible/}}
	local rightwidth=${#${(S%%)right//$~invisible/}}
	local padwidth=$(($COLUMNS - ($leftwidth + $rightwidth) % $COLUMNS))
	print -P $left${(r:$padwidth:: :)}$right
}
# left prompt
# user@host in green
PROMPT='%F{green}%n@%M %#%f '
# <execution result> current time
RPROMPT=$'%F{38}<%?> %{\e[38;5;251m%}%D{%b %d}, %*%{\e[m%}'

TMOUT=1
TRAPALRM() {
  zle reset-prompt
}

# compile .zshrc for loading
if [ ! -f ~/.zshrc.zwc ] || [ ~/.dotfiles/.zshrc -nt ~/.zshrc.zwc ]; then
	zcompile ~/.zshrc
fi

# load private zshrc setting
. ~/.zshrc_local &> /dev/null

less_with_unbuffer() {
	unbuffer "$@" |& less -SR
}
result_open_neovim() {
	nvim <("$@")
}

# aliases
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias ub=less_with_unbuffer
alias cdp='cd -P'
alias tree='tree -C | more'

# use improve commands if exists
type rg &> /dev/null \
	&& export RIPGREP_CONFIG_PATH=~/.ripgreprc
type exa &> /dev/null \
	&& alias ls='exa -F' \
	&& alias ll='exa -FlBghm -snew --time-style=full-iso' \
	&& chpwd() { exa -F }
type nvim &> /dev/null \
	&& alias nv='nvim' \
	&& alias nvc=result_open_neovim
type htop &> /dev/null \
	&& alias top='htop -d 10'
type dfc &> /dev/null \
	&& alias df='dfc'
type bat &> /dev/null \
	&& alias cat='bat'
type prettyping &> /dev/null \
	&& alias ping='prettyping'
type ncdu &> /dev/null \
	&& alias du='ncdu --color dark -rr'
type trans &> /dev/null \
	&& alias ej='trans en:ja'

