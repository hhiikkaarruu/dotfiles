export EDITOR=nvim

# (N-/)
# 	N:存在しない場合、エラーの代わりに空文字展開
# 	-:シンボリックリンクの実体を追いかけて判定
# 	/:ディレクトリ

# PATHの設定
path=(
	${HOME}/bin(N-/)
	${HOME}/.local/bin(N-/)
# 	${HOME}/.config/composer/vendor/bin
	${HOME}/.composer/vendor/bin
	${HOME}/.cargo/bin
	/usr/local/bin(N-/)
	/usr/local/sbin(N-/)
	/usr/bin(N-/)
	/usr/sbin(N-/)
	/bin(N-/)
	/sbin(N-/)
	.
	${PATH}
)

# CDPATHの設定(どこにいてもCDPATH直下にいるようにcd移動できる)
cdpath=(
)
