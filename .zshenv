export EDITOR=nvim

# (N-/)
# 	N:存在しない場合、エラーの代わりに空文字展開
# 	-:シンボリックリンクの実体を追いかけて判定
# 	/:ディレクトリ

# PATHの設定
path=(
	${HOME}/bin(N-/)
	${HOME}/.local/bin(N-/)
	${HOME}/.cargo/bin(N-/)
	/usr/local/bin(N-/)
	/usr/local/sbin(N-/)
	/usr/bin(N-/)
	/usr/sbin(N-/)
	/bin(N-/)
	/sbin(N-/)
	.
)

# CDPATHの設定(どこにいてもCDPATH直下にいるようにcd移動できる)
cdpath=(
)

# /etc/profileを読み込まない
# setopt no_global_rcs

# zshenvに書くとvimでも使える。set shell=/usr/bin/zsh
# aliases
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias ls='exa -F'
alias nv='nvim'
alias top='htop'
alias df='dfc'

# global aliases
alias -g L='| less'

