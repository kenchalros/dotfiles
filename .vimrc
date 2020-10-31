""" release autogroup in MyAutoCmd
augroup MyAutoCmd
    autocmd!
augroup END

"--------------------------------------------------
" Encoding setting
"--------------------------------------------------
set encoding=utf-8              " 内部エンコーディング
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis " 文字コード自動判別(優先順)
set fileformats=unix,dos,mac    " 改行コード自動判別(優先順)


"--------------------------------------------------
" Screen Setting
"--------------------------------------------------
set t_Co=256                    " ターミナルで256色表示を使用
set number                      " 行番号の表示
"set ruler                       " 右下に行・列番号を表示
set list                        " 不可視文字を表示
" 不可視文字の置き換え設定
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
set noshowmode                  " 最下部のmode表示をoff(pluginで表示するため)
set showcmd                     " 入力中のコマンドを画面の最下部に表示

syntax on                       " シンタックスハイライト
set cursorline                  " カーソル行をハイライト
"set cursorcolumn                " カーソル位置のカラムをハイライト
set colorcolumn=80              " 80行目に色をつける

set nowrap                      " 折り返さない
set textwidth=0                 " 自動的に改行が入るのを無効化

set background=dark
if isdirectory(expand("~/.vim/colors/overflow.vim"))
    "colorscheme overflow            " カラースキーマ
endif

"--------------------------------------------------
" System setting
"--------------------------------------------------
set nobackup                    " backupファイルを作らない
set nowritebackup               "
set noswapfile                  " swapファイルを作らない

set hidden                      " バッファを閉じる代わりに隠す（Undo履歴を残すため）
set switchbuf=useopen           " 新しく開く代わりにすでに開いてあるバッファを開く
set autoread                    " 外部でファイルが変更された場合は再度読む

set noerrorbells                " エラー音抑制
set novisualbell                " ビジュアルベル抑制
set visualbell t_vb=            " ビープ音抑制

set history=100                 " コマンド、検索履歴数

set scrolloff=5                 " 画面に余裕をもたせてスクロール

set infercase                   " 補完時に大文字小文字を区別しない
set wildmenu                    " ファイル名補完有効
set wildmode=list:longest,full  " 補完モード
" 補完モード description
" ""                        最初のマッチのみを補完する
" "full"                    次のマッチを完全に補完する。最後のマッチの次には元の文字列が使われ、その次は再び最初のマッチが補完される
" "longest"                 共通する最長の文字列までが補完される。それ以上長い文字列を補完できないときは、次の候補に移る
" "longest:full"            "longest"と似ているが、'wildmenu'が有効ならばそれを開始する。
" "list"                    複数のマッチがあるときは、すべてのマッチを羅列する。
" "list:full"               複数のマッチがあるときは、すべてのマッチを羅列し、最初のマッチを補完する。
" "list:longest"            複数のマッチがあるときは、すべてのマッチを羅列し、共通する最長の文字列までが補完される。


"set spell                       " スペルチェック (T + sでOn/Offを切り返るため、デフォルトはOffに)
set spelllang+=cjk              " スペルチェック対象から日本語を除外

"T + ? で各種設定をtoggle
nnoremap [toggle] <Nop>
nmap T [toggle]
nnoremap <silent> [toggle]s :setl spell!<CR>:setl spell?<CR>
nnoremap <silent> [toggle]l :setl list!<CR>:setl list?<CR>
nnoremap <silent> [toggle]t :setl expandtab!<CR>:setl expandtab?<CR>
nnoremap <silent> [toggle]w :setl wrap!<CR>:setl wrap?<CR>
nnoremap <silent> [toggle]n :setl number!<CR>:setl number?<CR>


"--------------------------------------------------
" Cursor setting
"--------------------------------------------------
let &t_SI="\e[5 q"
let &t_EI="\e[2 q"
" Other options (\e[?)
" 0 : blinking block.
" 1 : blinking block(default).
" 2 : steady block.
" 3 : blinking underline.
" 4 : steady underline.
" 5 : blinking bar(xterm).
" 6 : steady bar(xterm).
augroup VIMCURSOR
    au!
    autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END


"--------------------------------------------------
" Edit setting
"--------------------------------------------------
set clipboard+=unnamed          " OSクリップボード使用
set backspace=indent,eol,start  " バックスペースでなんでも消せるようにする

set tabstop=4                   " <Tab>幅
set softtabstop=4               " <Tab>幅(編集時)
set shiftwidth=4                " インデント幅

set shiftround                  " インデントを'shiftwidth'の倍数に丸める
set expandtab                   " <Tab>押下時に<Tab>ではなく、ホワイトスペースを挿入する
set autoindent                  " 改行時にインデントを引き継いで改行する
set smartindent                 " 前行の末尾に合わせてインデントを増減する

set matchpairs& matchpairs+=<:> " 対応括弧に'<'と'>'のペアを追加
set showmatch                   " 括弧の対応をハイライトする
set matchtime=1                 " 対応表示時間1秒(~10)

au BufNewFile,BufRead *.yml set shiftwidth=2
au BufNewFile,BufRead *.yml set tabstop=2


"--------------------------------------------------
" Search setting
"--------------------------------------------------
set ignorecase                  " 大/小文字無視
set smartcase                   " ただし大文字を含む検索は区別
set incsearch                   " インクリメンタルサーチ
set hlsearch                    " 検索マッチテキストをハイライト
set wrapscan                    " 検索をファイルの先頭へループ


"--------------------------------------------------
" Key mappings
"--------------------------------------------------
" insertモードで'jk'を押すとEsc
inoremap <silent> jk <ESC>

" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
"nnoremap n nzz
"nnoremap N Nzz
"nnoremap * *zz
"nnoremap # #zz
"nnoremap g* g*zz
"nnoremap g# g#zz

" j,k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap <silent> j gj
nnoremap <silent> k gk

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

" Ctrl + w + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

" タブ間の移動
nnoremap <C-n> gt
nnoremap <C-p> gT


"--------------------------------------------------
" NERDTree
"--------------------------------------------------
" Show hidden files.
let NERDTreeShowHidden=1

" Set files to be hidden.
let NERDTreeIgnore=['\.DS_Store$']

" Toggle by 'Cntl+b'
map <C-b> :NERDTreeToggle<CR>

" Open NERDTree automatically when no files were specified.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close if only NERDTree window exists.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"--------------------------------------------------
" lightline
"--------------------------------------------------
" Display status bar always.
set laststatus=2


"--------------------------------------------------
" vim-indent-guides
"--------------------------------------------------
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_exclude_filetypes=['help','nerdtree','unite']
