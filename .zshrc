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
# タブによるファイル切り替えをしない
unsetopt auto_menu
# command history setting
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
# zsh間でヒストリを共有する
setopt share_history
# ヒストリファイルに保存する時、重複を古い方から削除
setopt hist_save_nodups
# ヒストリに保存するときに余分なスペースを削除
setopt hist_reduce_blanks
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
# cdしたら自動的にpushdする。(cd -<Tab>でcd履歴が見れる。)
setopt auto_pushd
# 重複したディレクトリを追加しない。
setopt pushd_ignore_dups
# 単語の区切り文字を指定する。(/を区切り文字にすることで<C-w>でディレクトリ１つ分を削除できる)
autoload -U select-word-style
select-word-style bash
# beep無効
setopt no_beep
# <C-y>で上のディレクトリ移動
function cd-up {
	zle push-line && LBUFFER='builtin cd ..' && zle accept-line
}
zle -N cd-up
bindkey '^y' cd-up
# <C-d>でログアウト無効
setopt ignoreeof

# custom prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
  local left='%F{11}[%d]%f'									# カレントディレクトリ, execute result.
  vcs_info													# バージョン管理されてた場合、ブランチ名
  local right="%{\e[38;5;32m%}${vcs_info_msg_0_}%{\e[m%}"
  # スペースの長さを計算
  # テキストを装飾する場合、エスケープシーケンスをカウントしないようにします
  local invisible='%([BSUbfksu]|([FK]|){*})'
  local leftwidth=${#${(S%%)left//$~invisible/}}
  local rightwidth=${#${(S%%)right//$~invisible/}}
  local padwidth=$(($COLUMNS - ($leftwidth + $rightwidth) % $COLUMNS))
  print -P $left${(r:$padwidth:: :)}$right
}
# PROMPT='%F{white}%n@%M %#%f '									# ユーザ名@ホスト名
PROMPT='%F{green}%n@%M %#%f '									# ユーザ名@ホスト名
RPROMPT=$'%F{38}<%?> %{\e[38;5;251m%}%D{%b %d}, %*%{\e[m%}'	# 現在時刻
TMOUT=1
TRAPALRM() {
  zle reset-prompt
}

# .zshrcコンパイル
if [ ! -f ~/.zshrc.zwc ] || [ ~/.dotfiles/.zshrc -nt ~/.zshrc.zwc ]; then
	zcompile ~/.zshrc
fi

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

# improve commands
type rg &> /dev/null \
	&& export RIPGREP_CONFIG_PATH=~/.ripgreprc
type exa &> /dev/null \
	&& alias ls='exa -F' \
	&& alias ll='exa -FlBghm -snew' \
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
