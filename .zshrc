# 色を使用できるようにする。(意味不明)
autoload -Uz colors
colors
# emacsのキーバインドに設定(通常のシェルの動作)
bindkey -e
# bindkey -v # vimのキーバインド
# auto complete
autoload -U compinit; compinit
# ?
zstyle ':completion:*:default' menu select=1
# タブによるファイル切り替えをしない
unsetopt auto_menu
# コマンド履歴設定
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
PROMPT='%F{9}%n@%M %#%f '									# ユーザ名@ホスト名
RPROMPT=$'%F{38}<%?> %{\e[38;5;251m%}%D{%b %d}, %*%{\e[m%}'	# 現在時刻
TMOUT=1
TRAPALRM() {
  zle reset-prompt
}
# .zshrcコンパイル
if [ ! -f ~/.zshrc.zwc ] || [ ~/.dotfiles/.zshrc -nt ~/.zshrc.zwc ]; then
	zcompile ~/.zshrc
fi

# コマンドカラー表示
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# blueが見づらすぎるためnone化
ZSH_HIGHLIGHT_STYLES[globbing]='fg=none'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=none'

