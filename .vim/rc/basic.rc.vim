set nocompatible
set ambiwidth=single				" doubleだとpowerline使えない
set noexpandtab						" tabを挿入する(スペースに置き換えない)
set tabstop=4						" タブを４文字分にする
set shiftwidth=4					" 自動インデントで挿入されるタブを４文字分にする
set softtabstop=0
set autoindent						" 改行時に半角スペースを自動挿入
set showmatch						" 対応する括弧を表示
set ignorecase						" 検索時大文字小文字を区別しない
set smartcase						" 検索時大文字での検索は大文字小文字を区別する
set ruler							" カーソルが何行目の何列目に置かれているかを表示する
set showmode						" 現在のモードを表示する
set incsearch						" 検索時マッチしたものすべてをインクリメンタルにハイライトする
" set guifontset=-*-fixed-medium-r-normal--16-*-*-*-c-*,*-r-*	" 使用されるフォントのリスト
set laststatus=2					" ステータスバー位置
set nobk							" バックアップファイルを自動生成しない
set backspace=2						" バックスペースの設定
set cindent							" インデントの設定
set nf=alpha						" VIMのインクリメントでアルファベットをインクリメントできるようにする
set wildmode=list:longest:full		" ファイル名の補完をbashと同じ設定にする
"set list							" 隠し文字表示
"set listchars=tab:\|-,trail:-
set list lcs=tab:\|\ 
set t_Co=256						" スクリーン上で２５６色使用する
set mouse=a							" マウス利用に設定する
set nowrap							" 折り返さない
set number							" 行番号表示
set cinoptions=(0					" else if文のインデントをいい感じにする
set foldmethod=marker
set foldlevel=0
set fileencodings=utf-8,euc-jp,iso-2022-jp,cp932,sjis,utf-16le	" ファイルのエンコードを自動判定する
set nowrapscan						" 検索時終端から始端に戻らない
set textwidth=0						" 自動改行の抑制
set dictionary=~/.vim/c.dict		" 辞書ファイルパス
set tags=.vimtags;					" タグファイルの指定(階層)
set formatoptions-=ro				" 勝手にコメントアウトを無効にする
set display=lastline				" ウィンドウの最後の行をできる限りまで表示する(収まらない場合@)
set modeline						" モードラインを有効にする
set modelines=3						" モードラインの検索行数を設定する
set hlsearch						" 検索ハイライト
if has('nvim')
	set inccommand=split
endif
set autochdir						" 開いているファイルのディレクトリをカレントディレクトリに
set sh=zsh
set hidden							" 未保存でのバッファ切替有効
if has('nvim')
       set inccommand=split
endif
set cmdheight=2                                        " 邪魔だけどこれでgrepで聞かれない。
set splitright                                         " quickrunの結果表示位置変更
set splitbelow                                         " quickrunの結果表示位置変更
