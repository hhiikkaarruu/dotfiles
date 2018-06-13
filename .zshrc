# 自動補完を有効にする
autoload -U compinit; compinit

# cdした先のディレクトリをディレクトリスタックに追加する
# cd +<Tab>でディレクトリの履歴表示
setopt auto_pushd

# pushdしたとき、ディレクトリがすでにスタックに含まれていれば追加しない
setopt pushd_ignore_dups

# 入力したコマンドがすでにコマンド履歴に含まれていれば、古い順に削除する
setopt hist_ignore_all_dups

# # cdした先のディレクトリをディレクトリスタックに追加する
# cd +<Tab>でディレクトリの履歴表示
setopt auto_pushd

# pushdしたとき、ディレクトリがすでにスタックに含まれていれば追加しない
setopt pushd_ignore_dups

# 入力したコマンドがすでにコマンド履歴に含まれていれば、古い順に削除する
setopt hist_ignore_all_dups

# # cdした先のディレクトリをディレクトリスタックに追加する
# cd +<Tab>でディレクトリの履歴表示
setopt auto_pushd

# pushdしたとき、ディレクトリがすでにスタックに含まれていれば追加しない
setopt pushd_ignore_dups

# 入力したコマンドがすでにコマンド履歴に含まれていれば、古い順に削除する
setopt hist_ignore_all_dups

unsetopt auto_menu

# プロンプト設定
PROMPT='%F{red}%~%f
%F{green}[%n@%m]%f %# '

# ls色付け
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
alias ls="ls -GF"
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
