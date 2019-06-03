export EDITOR=nvim

# (N-/)
# 	N:存在しない場合、エラーの代わりに空文字展開
# 	-:シンボリックリンクの実体を追いかけて判定
# 	/:ディレクトリ

# PATHの設定
path=(
	${HOME}/bin(N-/)
	${HOME}/.local/bin(N-/)
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

# zshenvに書くとvimでも使える。set shell=/usr/bin/zsh
# aliases
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias ls='exa -F'
alias ll='exa -FlBghm -snew'
alias nv='nvim'
alias top='htop -d 10'
alias df='dfc'
alias cat='bat'
alias ping='prettyping'
alias du='ncdu --color dark -rr'
# alias rgは~/.ripgreprcに記述
less_with_unbuffer() {
	unbuffer "$@" |& less -SR
}
alias ub=less_with_unbuffer
