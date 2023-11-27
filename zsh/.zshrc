# path
# (N-/)
# 	N:存在しない場合、エラーの代わりに空文字展開
# 	-:シンボリックリンクの実体を追いかけて判定
# 	/:ディレクトリ
path=(
	${HOME}/bin(N-/)
	${HOME}/.local/bin(N-/)
	${HOME}/.composer/vendor/bin(N-/)
	${HOME}/.cargo/bin(N-/)
	${GOPATH}/bin(N-/)
	${VOLTA_HOME}/bin(N-/)
	/usr/local/bin(N-/)
	/usr/local/sbin(N-/)
	/usr/bin(N-/)
	/usr/sbin(N-/)
	/bin(N-/)
	/sbin(N-/)
	.
	${PATH}
)
# you can move following by $(cd) in anywhere
cdpath=(
)

# enable color
autoload -Uz colors
colors

# set emacs keybind(default behavior of shell)
bindkey -e

# bindkey -v # vim keybind
# auto complete
autoload -Uz compinit; compinit -i

# ?
zstyle ':completion:*:default' menu select=1

# specify <Tab> bihind
unsetopt auto_menu
# completion for hidden file
setopt globdots

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
autoload -Uz add-zsh-hook
autoload -Uz vcs_info
setopt PROMPT_SUBST
zstyle ':vcs_info:*' formats '%m [%b]'
zstyle ':vcs_info:*' actionformats '%m [%b|%a]'
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
_vcs_precmd () { vcs_info }
add-zsh-hook precmd _vcs_precmd
# left prompt
# user@host in green
PROMPT='%F{green}%n@%M %#%f '
# <execution result> current time
RPROMPT=$'%F{38}<%?> %{\e[38;5;251m%}%D{%b %d}, %*%{\e[m%}'

zstyle ':vcs_info:git+set-message:*' hooks git-config-user
function +vi-git-config-user(){
	hook_com[misc]+=$(git config user.email)
}

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

# expect package contains unbuffer
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
alias ubless=less_with_unbuffer
alias cdp='cd -P'

# use improve commands if exists
type rg &> /dev/null \
	&& export RIPGREP_CONFIG_PATH=~/.ripgreprc \
	&& alias grep='rg'
type fdfind &> /dev/null \
	&& alias fd='fdfind' \
	&& alias find='fdfind'
type exa &> /dev/null \
	&& alias ls='exa -F' \
	&& alias ll='exa -FlBghm -snew --time-style=full-iso' \
	&& chpwd() { exa -a -F }
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

# shortcuts
type trans &> /dev/null \
	&& alias ej='trans en:ja'
type aws &> /dev/null \
	&& alias awslocal='aws --endpoint-url http://localhost:4566'

