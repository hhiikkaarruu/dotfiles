export EDITOR=nvim

# (N-/)
# 	N:存在しない場合、エラーの代わりに空文字展開
# 	-:シンボリックリンクの実体を追いかけて判定
# 	/:ディレクトリ
#
gopath=${HOME}/.go

path=(
	${HOME}/bin(N-/)

	${HOME}/.local/bin(N-/)
	${HOME}/.composer/vendor/bin
	${HOME}/.cargo/bin
	${GOPATH}/bin

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


