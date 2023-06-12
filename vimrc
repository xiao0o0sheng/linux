"                          _                    
"  _ __ ___  _   _  __   _(_)_ __ ___  _ __ ___ 
" | '_ ` _ \| | | | \ \ / / | '_ ` _ \| '__/ __|
" | | | | | | |_| |  \ V /| | | | | | | | | (__ 
" |_| |_| |_|\__, |   \_/ |_|_| |_| |_|_|  \___|
"            |___/                              

" Author: @xiao0o0sheng
" LastModify: 2023/05/25


" >-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<
" >-<>-<                               Read Me                               >-<>-<
" >-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<

"								╭───────────────────────╮
"								│        环境准备       │
"								╰━━━━━━━━━━━━━━━━━━━━━━━╯
"	———————————————————————————————————————————————————————————————————————————————

" 涉及到.nvim 插件，需要准备下列环境：
"	=====>nodejs：建议使用 nvm 包管理器，安装nvm，使用nvm install <version>，不用再安装其他nodejs
"	=====>nvm安装命令：wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
"			yarn:						pm install -g yarn
"			bash-language-server:		npm i -g bash-language-server
"			prettier:					npm install -g prettier
"	=====>coc的python插件
"			python3 路径用	whereis python3  查找后 修正到 coc-settings 中的  python.pythonPath
"			python3 环境建议使用anaconda
"			pip install PyQt5-tools -i https://mirrors.aliyun.com/pypi/simple/
"			pip install 'python-language-server[all]'
"			pip install spyder -i https://mirrors.aliyun.com/pypi/simple/
"			pip install pyright -i https://mirrors.aliyun.com/pypi/simple/
"			pip install bandit -i https://mirrors.aliyun.com/pypi/simple/
"			pip install darker -i https://mirrors.aliyun.com/pypi/simple/
"			pip install mypy -i https://mirrors.aliyun.com/pypi/simple/
"			pip install prospector -i https://mirrors.aliyun.com/pypi/simple/
"			pip install pylama -i https://mirrors.aliyun.com/pypi/simple/
"			pip install ruamel-yaml -i https://mirrors.aliyun.com/pypi/simple/
"			pip install pytype -i https://mirrors.aliyun.com/pypi/simple/
"			pip install ruff -i https://mirrors.aliyun.com/pypi/simple/
"			pip install jedi-language-server -i https://mirrors.aliyun.com/pypi/simple/





" dracula_pro 主题插件(pro是收费软件)
"	=====>将 dracula_pro 主题文件夹下的vim文件夹 copy 到 ~/.vim/pack/themes/start/dracula_pro
"	=====>若没有 dracula_pro 文件，可注释掉 dracula_pro 配置，并启用本配置中的 snazzy 主题配色





"								╭───────────────────────╮
"								│        基本用法       │
"								╰━━━━━━━━━━━━━━━━━━━━━━━╯
"	———————————————————————————————————————————————————————————————————————————————

" <leader>键，就是个前缀键，默认是	/	本配置中，把<leader>键修改为了	<space>



" 写入模式：
"	=====> 小写 i，在当前光标的前一个位置写入
"	=====> 大写 I，在当前光标所在行的行首写入
"	=====> 小写 a，在当前光标的后一个位置写入
"	=====> 大写 A，在当前光标所在行的行尾写入
"	=====> 小写 o，新建下一行，并在下一行进入写入模式
"	=====> 大写 O，新建上一行，并在上一行进入写入模式
"	=====> 小写 s，删掉当前位置字符并进入写入模式
"	=====> 大写 S，删除当前光标所在行并进入写入模式
"	=====> 小写 c，删除并进入写入模式，配合方向键和数字键，还可以配合w/e/b/ 使用
"	=====> 进阶用法：
"			ci + 符号'{' '[' '('，删除符号中的内容并进入写入模式
"			ci"  ==>删除引号中的内容比进入写入模式
"			ciw  ==> 删除当前单词并进入写入模式
"			cb/cw/ce  ==> 从当前光标到  b(上一个单词的开头) /w(下一个单词的开头)  /e(下一个单词的末尾) 位置删除



" 可视模式：
"	=====> 小写 v，在当前光标位置进入可视模式
"	=====> 大写 V，在当前光标所在行进入可视模式
"	=====> Ctrl + v，从当前位置进入可视模式(代码块选择模式)
"	=====> 用法 大写 V + 大写 G，从当前行到最后一行全选中



" 复制
"	=====> 复制键：y
"	=====> 进阶用法：
"			yy	复制一行
"			yw	从当前光标位置复制到下一个词的开头
"			y^	从当前光标位置复制到当前行第一个非空字符
"			y$	从当前光标位置复制到行尾
"			yi + 符号：y 复制，i 在...中  --->  复制（引号/括号...）中的内容
"			yiw	复制当前光标所在词
"			yf + 字符：y 复制，f 查找  --->  从当前位置向后复制到第一个匹配的字符为止



" 粘贴
"	=====> 小写 p	粘贴至光标后(下)， 整行的复制粘贴在游标的下一行，非整行的复制则是粘贴在游标的后面
"	=====> 大写 P	粘贴至光标前(上)， 整行的复制粘贴在游标的上一行，非整行的复制则是粘贴在游标的前面
"	=====> 跟外部共享剪贴板
"			set clipboard=unnamed
"			需要  vim --version | grep clipboard	--->  +clipboard	+xterm_clipboard
"			可以通过	sudo apt install vim-gtk	解决



" 删除/剪切
"	=====> 删除/剪切 键：d	或者	x
"	=====> 进阶用法：
"			dd	直接剪切当前行，可以当删除使用
"			dw	从当前光标位置删除到下一个词的开头
"			d^	从当前光标位置删除到当前行第一个非空字符
"			d$	从当前光标位置删除到行尾
"			di + 符号：d 删除，i 在...中  --->  删除（引号/括号...）中的内容
"			diw	删除当前光标所在词
"			df + 字符：d 删除，f 查找  --->  从当前光标位置向后删除到第一个匹配的字符为止
"	=====> x	--->	删除(剪切)光标当前选中区域



" 撤销
"	=====> u		撤销(普通模式)
"	=====> <C-u>	撤销(写入模式)
"	=====> <C-r>	取消撤销


" 移动
"	=====> 小写 b	光标移动到上一个单词的开头
"	=====> 小写 w	光标移动到下一个单词的开头
"	=====> 小写 e	光标移动到下一个单词的末尾
"	=====> 数字 0	光标移动到行首
"	=====> home键	光标移动到行首
"	=====> ^		光标移动到当前行第一个非空字符
"	=====> $		光标移动到行尾
"	=====> end键	光标移动到行尾
"	=====> 方向键
"     ^				h 光标向左移动 1 个单位		H 光标向左移动 5 个单位
"     k				j 光标向下移动 1 个单位		J 光标向下移动 5 个单位
" < h   l >			k 光标向上移动 1 个单位		K 光标向上移动 5 个单位
"     j				l 光标向右移动 1 个单位		L 光标向右移动 5 个单位
"     v
"	=====> 自然段
"			{		跳转到上一个自然段
"			}		跳转到下一个自然段
"	=====> gg		跳转到第一行行首
"	=====> G		跳转到最后一行行首
"	=====> 翻页
"			<C-u>	Ctrl + u	向上翻页
"			<C-d>	Ctrl + d	向下翻页
"	=====> 跳转到指定行
"			10G		跳转到第10行		也可以用  :10<CR>
"	=====> 指定步长和方向跳转行数
"			number + j/k   	向上(k)下(j)跳转number个行数



" 打开新文件
"	=====> :e + 文件路径



" 搜索
"	=====> 搜索键 /
"			/ + 字符，搜索全文匹配到的字符，会结合下面的set 设置高亮显示 <space><CR> 取消结果高亮





"								╭───────────────────────╮
"								│        高阶用法       │
"								╰━━━━━━━━━━━━━━━━━━━━━━━╯
"	————————————————————————————————————————————————————————————————————————————————

" 	=====> Tips

"	:s/old/new/g	把文档中所有的'old'字符串替换为'new'字符串
"	re	快捷键re(自定义)，执行bash命令并将输出写到vim编辑的文件中
"	:r ! ls			读取并列出当前目录下所有文件名(不包括隐藏文件)

"	===>比较两个文件的差异
"	vim -d file1 file2
"	vimdiff file1 file2


"	vim -o file1 file2		水平分屏，在多个窗口打开多个文件，小写o
"	vim -O file1 file2		垂直分屏，在多个窗口打开多个文件，大写O
"	vim -p file1 file2		在不同的标签页中打开多个文件，小写p

"	vim + file				打开文件，光标在文件末尾行首
"	vim +55 file			打开文件，光标在文件55行首




" 	=====> 录制键盘宏！！！
" 普通模式下   q + <宏键> 进入宏录制，再在普通模式下按  q  退出宏录制





"								╭───────────────────────╮
"								│		自定义按键		│
"								╰━━━━━━━━━━━━━━━━━━━━━━━╯
"	————————————————————————————————————————————————————————————————————————————————

" 	=====> 退出vim
" 	Q		退出vim
" 	E		强制退出vim(不保存)
" 	W		保存修改并退出vim
" 	R		重新引导/加载vimrc



"	<C-a>	全选整个文本
"	re		按键后，输入正常linux指令，会把指令输出添加到vim编辑的文件中



" 	=====> 光标移动
"	H		光标向左移动5个单位
"	J		光标向下移动5个单位
"	K		光标向上移动5个单位
"	L		光标向右移动5个单位



" 	=====> vim分屏
"	sh		向左分屏
"	sj		向下分屏
"	sk		向上分屏
"	sl		向右分屏



" 	=====> vim窗口大小
"	<C-h>	窗口高度增加5单位
"	<C-j>	窗口高度减少5单位
"	<C-k>	窗口高度增加5单位
"	<C-l>	窗口宽度增加5单位



" 	=====> 光标在vim窗口之间切换
"	<C-up>			切到上边的窗口
"	<C-down>		切到下边的窗口
"	<C-left>		切到左边的窗口
"	<C-right>		切到右边的窗口



" 	=====> tabs标签页
"	tn		新建一个标签页
"	tc		关闭当前标签页
"	ta		关闭其他标签页
"	th		切换到上一个标签页
"	tl		切换到下一个标签页



" 	=====> 搜索结果翻查
"	= 				跳转到下一个搜索结果
"	- 				跳转到上一个搜索结果(暂未生效)
"	<space><CR>		搜索结果取消高亮



" 	=====> 多行输入
"	ctrl + 方向键		光标多行启用



" 	=====> 运行代码文件(程序)
"	rr				运行vim编辑的该代码文件





"								╭───────────────────────╮
"								│		vim插件用法		│
"								╰━━━━━━━━━━━━━━━━━━━━━━━╯
"	————————————————————————————————————————————————————————————————————————————————

" 	=====> 代码
"	<space>			展开/折叠	代码
"	<space> + m		coc插件功能，查看函数说明(定义)
"	,,				注释/取消注释	(整行注释，若是多行，则每行都会有注释符号)
"	..				块(多行)注释	(所有行被整个注释，只有一个注释符号)
"	,.				行尾添加注释	(原行代码不会被注释)



" 	=====>	文件树显示
"	tt				打开/关闭 nerdtree
"	I				打开/关闭 隐藏目录
"	T				打开/关闭 操作历史面板



"	=====> fzf	模糊搜索神器
"	ff				当前目录下的文件进行模糊搜索
"	fh				对vim编辑的历史文件目录进行模糊搜索
"	fc				对vim 历史命令 进行模糊搜索
"	fcc				对vim 能用的命令 进行模糊搜索
"	fs				对用 / 搜索的历史进行模糊搜索
"	fw				对vim 的所有窗口 进行模糊搜索
"	fd				对vim Snippets(UltiSnips) 进行模糊搜索
"	fz				对vim 主题配色 进行模糊搜索



"	=====> vim-table-mode
"	tm				写markdown时，快速进入表格模式输入



"	=====> vim-visual-multi 多光标(多行)插件
"	ctrl Up/Down	多行快捷放置光标
"	Esc				退出多光标模式
"	ctrl n			选中当前词组
"					再按 N/n 选中上/下一个一样的词组
"					再按 "[" / "]" 选中上/下一个光标
"					q	跳过当前，选中下一个匹配的代码块
"					Q	跳过当前，选中上一个匹配的代码块
"					shift-arrows(可以是方向键，也可以是vim的方向键 b, e...)


"	=====> wildfire.vim 
"	<Enter>			快速选中pairs里的文本，再按<Enter>会选中更大一级的pairs里的代码块
"	b				wildfire选中后，按b向左选中
"	e				wildfire选中后，按e向右选中
"	<Esc>			退出选中




"	=====> vim-surround
"	S(大写)			可视模式或wildfire选中后，按S(大写)，再键入需要的pairs(', ", [, ], {, }, (, ), )，会直接在代码块两端添加pairs
"	cs old new		改变代码块的pairs，按下cs，然后键入old pairs，然后键入 new pairs，就可以把pairs替换，比如说 cs'" ===> 就会把代码块两端的 ' 替换成 "
"					不要选中代码块！！！直接光标在pairs里的任意一个字符就行





"								╭───────────────────────────╮
"								│		coc 插件自定义		│
"								╰━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
"	————————————————————————————————————————————————————————————————————————————————

"	<C-c>			打开  coc  的命令模式
"	<C-c>			打开  CocList
"	<leader>d		查看诊断信息
"	[g				查找上一个代码报错
"	]g				查找下一个代码报错
"	gd				跳转到光标处函数被定义的位置
"	gy
"	gi
"	gr				跳转到光标处函数被引用的位置
"	rn				重命名当前 函数/变量 名，会修改所有引用这个 函数/变量 的地方
"	<leader>m		查看当前函数定义
"	<leader>f		格式化选中区域代码
"	<leader>r		重命名当前 函数/变量 名，会修改所有引用这个 函数/变量 的地方
"	if				查看当前选中函数的说明文档
"	ic				查看当前选中参数的说明文档
"	af				查看当前选中函数的说明文档
"	ac				查看当前选中参数的说明文档


" >-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<
" >-<>-<                               General                               >-<>-<
" >-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<

autocmd BufWritePost ~/.vim/vimrc source ~/.vim/vimrc	" 让vimrc配置立即生效(vim)
" autocmd BufWritePost $MYVIMRC source $MYVIMRC			" 让vimrc配置立即生效(neovim)
set nocompatible                                 		" 去vi的一致性，关闭兼容模式，必须必须必须第一个设置！！！



" ★☆★☆★☆★ 若未安装vim-plug，则自动安装 ★☆★☆★☆★
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif



" ★☆★☆★☆★ 自动安装未安装的vim扩展 ★☆★☆★☆★
" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif



" 让vim识别不同的文件格式
filetype on												" 检测文件类型
filetype plugin on										" 检测文件类型，并且载入与该类型对应的插件
filetype indent on										" 检测文件类型，并且载入与该类型对应的缩进规则
filetype plugin indent on								" 检测文件类型，并且载入与之对应的规则






" >-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<
" >-<>-<                            set  设置选项                            >-<>-<
" >-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<

set clipboard=unnamed									" 共享剪切板
set wildmenu                                            " 启用增强模式命令行补全，按tab显示可以补全的命令选项
set wildmode=longest:list,full							" 命令模式下，底部操作指令按下 Tab 键自动补全
set number                                              " 显示行号
set norelativenumber									" 不显示相对行号
set encoding=utf-8										" 设置编码格式为utf-8
set updatetime=300										" 设置vim响应时间，单位是ms，默认4000
set signcolumn=yes										" 设置显示标志栏
set showmatch                                    		" 当文本指示符在括号上方时，显示匹配的括号
set mat=2												" 匹配括号是，闪烁的时间（单位0.1s）
set magic												" 设置 magic，除了$.*^[] 外其他元字符都要加反斜杠进行转义
set wrap                                                " 自动换行
set tw=0												" 单词不换行
set autoindent                                   		" 自动对齐/对齐
set smartindent                                  		" 智能缩进
" set indentexpr=
set backspace=eol,start,indent							" 允许退格键正常处理eol,start,indent
set whichwrap+=<,>,h,l									" 允许光标/退格键跨越行边界
set shortmess+=c										" 补全时信息栏少显示没用的信息
set hidden												" 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set t_Co=256											" vim启用256色，很重要，不然有些配色方案不生效
set termguicolors                                       " 开启24bit颜色
set textwidth=150										" 设置每行的字符数n
set history=1500										" 设置VIM 的历史记录行数
set autoread											" 打开文件监视，编辑过程中文件发生外部改变，会发出提示
set lazyredraw											" 延迟重绘
set ffs=unix,dos,mac									" 使用Unix作为标准文件类型
set fileformat=unix                              		" 设置以unix的格式保存文件
set regexpengine=0										" 自动设置正则表达式引擎
set completeopt=preview,menu							" 代码补全
set completeopt=longest,menu							" 代码补全
set guioptions-=r                                		" 隐藏编辑器右侧滚动条
set guioptions-=L                                		" 如果窗口垂直分隔，隐藏编辑器左侧滚动条
set guioptions-=b                                		" 隐藏编辑器底部滚动条
set guioptions =a                                		" 在可视化模式下选中文本,Vim会将所选文本放置到系统的全局寄存器中
set guifont=Hack                                		" 设置字体
set hid													" 缓冲区被禁用时会被隐藏
" set background=dark									" 设置背景色为黑色
" set showtabline=0                                		" 隐藏顶部标签栏，默认为 1，建议默认开



"								╭───────────────────────╮
"								│        启用鼠标       │
"								╰━━━━━━━━━━━━━━━━━━━━━━━╯
"	————————————————————————————————————————————————————————————————————————————————

set mouse=a
set selection=exclusive
set selectmode=mouse,key



" ╭───────────────────────╮
" │         状态行		  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

set laststatus=2										" 设置始终显示状态行
set autochdir											" 设定文件浏览器目录为当前目录
set showcmd												" 显示输入的命令
set formatoptions-=tc
set showmode                                     		" 在底部显示当前的编辑模式



" ╭───────────────────────╮
" │         折叠		  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

set foldenable											" 启用折叠
set foldcolumn=1										" 折叠区域宽度，在左侧多留一点空白(单位bit位)
set foldmethod=indent									" 启用indent折叠
set foldlevel=1											" 设置折叠的层数为 1
set foldlevelstart=99									" 打开文件时默认不折叠代码



" ╭───────────────────────╮
" │        搜索相关		  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

set hlsearch                                            " 搜索结果高亮
" 首次打开时不高亮
exec "nohlsearch"
set incsearch                                           " 实时高亮显示搜索结果
set ignorecase                                          " 忽略大小写搜索
set smartcase                                           " 智能区分大小写搜索



" ╭───────────────────────╮
" │        关闭备份		  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

set nobackup											" 表示不需要备份文件
set nowb
set noswapfile											" 表示不创建临时交换文件
" set noundofile										" 表示不创建撤销文件
" set nowritebackup										" 表示编辑的时候不需要备份文件



" ╭───────────────────────╮
" │        tab/缩进		  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

set expandtab											" 自动将tab转换为空格
set smarttab											" 在使用tab的时候，智能一些
set tabstop=4											" 设置tab缩进长度
set softtabstop=4										" tab转换为多少个空格
set shiftwidth=4										" 设置空白缩进长度
set list												" 显示不可见字符
set listchars=tab:▸\ ,trail:▫							" 使tab和空格显示出来(显示tab为▸，显示空格为▫)
set lbr													" 不在单词中间换行，在单词与单词之间的空白处换行
set ai													" 设置自动缩进，继承前一行的缩进格式，适用于多行注释
set si													" 设置智能缩进，为C程序语音提供自动缩进



" ╭───────────────────────╮
" │        光标位置		  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

" set ruler												" 启用标尺，在状态栏显示光标的当前位置（位于哪一行哪一列）
" set cursorline										" 突出显示当前行
" set cursorcolumn										" 突出显示当前列
set scrolloff=7											" 设置光标居中，舒适视觉，当光标距离上下边框n行时，滚动屏幕



" ╭───────────────────────╮
" │        coc.nvim		  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

set timeoutlen=100
set cmdheight=2											" command bar高度



" ╭───────────────────────╮
" │     关闭错误提示音	  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

set noerrorbells										" 关闭错误信息响铃(出错不发声)
set novisualbell										" 出错时视觉提示关闭
set t_vb=												" 置空错误铃声的终端代码
set tm=500





" >-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<
" >-<>-<                           Custom Function                           >-<>-<
" >-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<

" wildmenu启用时(set wildmenu)，忽略编译文件
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif



" 禁用错误提示音(set t_vb=)打开时，正确禁用MacVim的错误提示音
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif



" 在tmux中启用256调色板
if exists('$TMUX')
  set term=screen-256color
endif





" >-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<
" >-<>-<                            Auto Commands                            >-<>-<
" >-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<

" =====> 打开文件时，返回到最后的编辑位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif



" =====> 创建脚本文件时，自动添加下列语句
autocmd BufNewFile * normal G
" ===> python
autocmd BufNewFile *.py exec ":call SetPythonTitle()"
func SetPythonTitle()
    call append(0,"# -----------------------------------------------------------------")
	call append(1,"# ! /usr/bin/env python3")
    call append(2,"# -*- coding: utf-8 -*-")
    call append(3,"# @Created Time:	".strftime("%Y/%m/%d",localtime()))
	call append(4,"# @File:			".expand("%"))
	call append(5,"# @Software:		vim 9.0")
    call append(6,"# @Author:		    xiao0o0sheng")
    call append(7,"# @Email:		    xiaosheng7@126.com")
    call append(8,"# @Version:				")
    call append(9,"# @Description:			")
	call append(10,"# -----------------------------------------------------------------")
	call append(11,"")
	call append(12,"")
	call append(13,"")
endfunc

" ===> shell
autocmd BufNewFile *.sh exec ":call SetShellTitle()"
func SetShellTitle()
	call setline(1,"# -----------------------------------------------------------------")
	call setline(2,"#!/usr/bin/bash")
    call setline(3,"# -*- coding: utf-8 -*-")
    call setline(4,"# @Created Time:	".strftime("%Y/%m/%d",localtime()))
	call setline(5,"# @File:			".expand("%"))
	call setline(6,"# @Software:		vim 9.0")
    call setline(7,"# @Author:		    xiao0o0sheng")
    call setline(8,"# @Email:		    xiaosheng7@126.com")
    call setline(9,"# @Version:				")
    call setline(10,"# @Description:			")
	call setline(11,"# -----------------------------------------------------------------")
	call setline(12,"")
	call setline(13,"")
	call setline(14,"")
	call setline(15,"")
endfunc




" ╭───────────────────────╮
" │      markdown编辑	  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

" 退出当前特殊编辑，继续普通编辑
autocmd Filetype markdown inoremap <buffer> <c-e> <Esc>/<++><CR>:nohlsearch<CR>"_c4l
" 分割线
autocmd Filetype markdown inoremap <buffer> ,l ---<Enter><Enter>
" table 占位符
autocmd Filetype markdown inoremap <buffer> ,t ---<Enter><Enter>
" 粗体
autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
" 字体横线
autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
" 斜体
autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i
" 引用
autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i
" 代码块
autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
" 高亮
autocmd Filetype markdown inoremap <buffer> ,h ====<Space><++><Esc>F=hi
" 未选中框
autocmd Filetype markdown inoremap <buffer> ,n - [ ] 
" 选中框
autocmd Filetype markdown inoremap <buffer> ,m - [x] 
" 图片
autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
" 超链接
autocmd Filetype markdown inoremap <buffer> ,a [](<++>) <++><Esc>F[a
" 一级标题
autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
" 二级标题
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
" 三级标题
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
" 四级标题
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
" 五级标题
autocmd Filetype markdown inoremap <buffer> ,5 #####<Space><Enter><++><Esc>kA
" 六级标题
autocmd Filetype markdown inoremap <buffer> ,6 ######<Space><Enter><++><Esc>kA



" =====> vimwiki
au BufRead,BufNewFile *.md set filetype=vimwiki





" >-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<
" >-<>-<                              @mapping@                              >-<>-<
" >-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<

map Q :q<CR>											" 按Q 退出vim
map E :q!<CR>											" 按E 强制退出vim(不保存)
map W :wq<CR>											" 按W 保存修改并退出vim
map R :source ~/.vim/vimrc<CR>							" 按R 重新引导/加载vimrc

map <c-a> ggVG											" 全选整个文本

map H 5h												" 按H 光标向左移动5个单位
map J 5j												" 按J 光标向下移动5个单位
map K 5k												" 按K 光标向上移动5个单位
map L 5l												" 按L 光标向右移动5个单位


" 执行bash命令并将输出写到vim编辑的文件中
nnoremap re :r ! 


" ╭───────────────────────╮
" │        vim分屏		  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

map sh :set nosplitright<CR>:vsplit<CR>					" 按sh向左分屏
map sj :set splitbelow<CR>:split<CR>					" 按sj向下分屏
map sk :set nosplitbelow<CR>:split<CR>					" 按sk向上分屏
map sl :set splitright<CR>:vsplit<CR>					" 按sl向右分屏



" ╭───────────────────────╮
" │        窗口大小		  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

map <C-h> :vertical resize-5<CR>						" 使用<C-h> 窗口高度增加5单位
map <C-j> :res -5<CR>									" 使用<C-j> 窗口高度减少5单位
map <C-k> :res +5<CR>									" 使用<C-k> 窗口高度增加5单位
map <C-l> :vertical resize+5<CR>						" 使用<C-l> 窗口宽度增加5单位



" ╭───────────────────────╮
" │    光标在窗口间移动	  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

map <C-up> <C-W>k										" 使用<C-up> 切到上边的窗口
map <C-down> <C-W>j										" 使用<C-down> 切到下边的窗口
map <C-left> <C-W>h										" 使用<C-left> 切到左边的窗口
map <C-right> <C-W>l									" 使用<C-right> 切到右边的窗口



" ╭───────────────────────╮
" │    	 tabs标签页		  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

map tn :tabnew<CR>										" 使用tn 新建一个标签页
map tc :tabclose<CR>									" 使用tc 关闭当前标签页
map ta :tabonly<CR>										" 使用ta 关闭其他标签页
map th :-tabnext<CR>									" 使用th 切换到上一个标签页
map tl :+tabnext<CR>									" 使用tl 切换到下一个标签页



" ╭───────────────────────╮
" │   运行vim编译的文件   │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

map rr :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  endif
endfunc





" ╭───────────────────────╮
" │        搜索相关		  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

noremap = nzz                                           " 按 = 跳转到下一个搜索结果
" noremap - Nzz                                         " 按 - 跳转到上一个搜索结果
noremap <space><CR> :nohlsearch<CR>						" 按 空格+回车，搜索结果取消高亮



" ╭───────────────────────╮
" │         折叠		  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>





" >-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<
" >-<>-<                            vim-plug 插件                            >-<>-<
" >-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<

call plug#begin('~/.vim/plugged')                       " 安装插件
" =====> 安装即用
Plug 'junegunn/vim-plug'								" 插件管理器
Plug 'mhinz/vim-startify'								" funny vim启动界面
Plug 'jiangmiao/auto-pairs'								" 自动添加/删除右括号
Plug 'mg979/vim-visual-multi', {'branch': 'master'}		" 多行(多光标)输入插件
Plug 'tpope/vim-surround'								" 修改选中块两侧的符号
Plug 'arzg/vim-colors-xcode'							" x-code配色主题
Plug 'altercation/vim-colors-solarized'					" solarized配色主题
Plug 'nanotech/jellybeans.vim'							" jellybeans配色主题



" =====> 需要自定义配置的插件
Plug 'vim-airline/vim-airline'                          " 状态栏插件
Plug 'vim-airline/vim-airline-themes'					" airline主题
Plug 'connorholyday/vim-snazzy'							" 主界面配色插件，需要修改colorscheme值
Plug 'crusoexia/vim-monokai'                            " 主界面配色插件，需要修改colorscheme值
Plug 'dracula/vim', { 'as': 'dracula' }					" 主界面配色插件，需要修改colorscheme值
Plug 'itchyny/lightline.vim'							" 底部状态栏美化插件，有airline就够了
Plug 'luochen1990/rainbow'								" 括号高亮，彩虹效果
Plug 'preservim/nerdcommenter' 							" 快速注释
Plug 'preservim/nerdtree'								" 显示文件目录
Plug 'Xuyuanp/nerdtree-git-plugin'						" nerdtree Git支持
Plug 'mbbill/undotree/'									" 可以树型显示文件修改历史，方便回溯到先前节点
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }		" vim的模糊匹配神器
Plug 'junegunn/fzf.vim'									" vim的模糊匹配神器
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }			" markdown文件时，表格模式插件
Plug 'kshenoy/vim-signature'							" 书签插件
Plug 'vimwiki/vimwiki'									" vim笔记插件
Plug 'ntpeters/vim-better-whitespace'					" 空格显示
Plug 'gcmt/wildfire.vim'								" 在视觉模式下，键入k“以选择“”中的所有文本，或键入k）k]k｝kp
Plug 'sainnhe/gruvbox-material'							" gruvbox-material配色主题
Plug 'Exafunction/codeium.vim'							" 智能代码书写提示


" =====> .nvim插件，需要nodejs和yarn 环境
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" 在没node和yarn的情况下可以安装该插件，for语句 语句表示仅在编辑md文件时加载该插件，可以提高vim加载速度
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}



Plug 'neoclide/coc.nvim', {'branch': 'release'}



call plug#end()





" >-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<
" >-<>-<                            let  设置变量                            >-<>-<
" >-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<

" =====> 修改vim前缀键为空格
let mapleader=" "
let &t_ut=''											" 防止不正确的背景渲染，兼容性



" =====> 设置英文模式，避免windows中文视窗报错
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim





" >-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<
" >-<>-<                              插件配置                               >-<>-<
" >-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<

" ╭───────────────────────╮
" │         airline		  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

let g:airline_theme='dark'								" 使用dark主题
let g:airline_powerline_fonts = 1						" 使用powerline打过补丁的字体
let g:airline#extensions#whitespace#enabled = 0			" 不显示airline的缩进格式检查
let g:airline#extensions#tabline#enabled = 1 			" 显示标签页栏(tabline)
let g:airline#extensions#tabline#left_sep = ' '			" tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'   	" tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#buffer_nr_show = 1		" tabline中buffer显示编号
let g:airline#extensions#tabline#fnamemod = ':t'		" tabline只显示名称
let g:airline#extensions#tabline#formatter = 'default'	" tabline显示样式



" ╭───────────────────────╮
" │         rianbow		  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'guis': [''],
\	'cterms': [''],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'markdown': {
\			'parentheses_options': 'containedin=markdownCode contained',
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'haskell': {
\			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'],
\		},
\		'vim': {
\			'parentheses_options': 'containedin=vimFuncBody',
\		},
\		'perl': {
\			'syn_name_prefix': 'perlBlockFoldRainbow',
\		},
\		'stylus': {
\			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'],
\		},
\		'css': 0,
\		'nerdtree': 0,
\	}
\}


" ╭───────────────────────╮
" │       nerdcommenter	  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

map ,, <leader>ci										" 使用,, 注释/取消注释 (整行注释，若是多行，则每行都会有注释符号)
map ,. <leader>cA										" 使用,. 行尾注释
map .. <leader>cm										" 使用.. 块(多行)注释
let g:NERDSpaceDelims = 1								" 默认情况下，在注释分隔符后添加空格
let g:NERDDefaultAlign = 'left'							" 按行对齐注释分隔符左对齐，而不是按代码缩进
" 添加您自己的自定义格式或覆盖默认格式
let g:NERDCustomDelimiters = {  'c': { 'left': '/**','right': '*/' },'php': { 'left': '/*','right': '*/' },'html': { 'left': '<!--','right': '-->' },'py': { 'left': '#' },'sh': { 'left': '#' } }
let g:NERDCommentEmptyLines = 1							" 允许注释和反转空行
let g:NERDTrimTrailingWhitespace = 1					" 取消注释时启用尾随空白的修剪
let g:NERDToggleCheckAllLines = 1						" 启用nerdcommenttoggle检查是否对所有选定行进行了注释



" ╭───────────────────────╮
" │         nerdtree	  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

map tt :NERDTreeToggle<CR>								" 使用tt打开/关闭 nerdtree
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"						" 按i 直接用vim编辑当前选中的文件
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"


" ╭───────────────────────╮
" │      nerdtree-git	  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }


" ╭───────────────────────╮
" │      	undotree	  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

let g:undotree_DiffAutoOpen = 0
map T :UndotreeToggle<CR>								" 使用大写T，切换操作历史面板



" ╭───────────────────────╮
" │          fzf		  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

let g:fzf_preview_window = 'right:50%'					" vim窗格右边框的占幅比例
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }				" vim窗格大小
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" ---> 当前目录下的文件进行模糊搜索
map ff :Files<CR>
" ---> 对vim编辑的历史文件目录进行模糊搜索
map fh :History<CR>
" ---> 对vim 历史命令 进行模糊搜索
map fc :History:<CR>
" ---> 对用 / 搜索的历史进行模糊搜索
map fs :History/<CR>
" ---> 对vim 能用的命令 进行模糊搜索
map fcc :Commands<CR>
" ---> 对vim 的所有窗口 进行模糊搜索
map fw :Windows<CR>
" ---> 对vim Snippets(UltiSnips) 进行模糊搜索
map fd :Snippets<CR>
" ---> 对vim 主题配色 进行模糊搜索
map fz :Colors<CR>



" ╭───────────────────────╮
" │   vim-signature书签   │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "dm/",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }



" ╭───────────────────────╮
" │     MarkdownPreview	  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'chromium'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'



" ╭───────────────────────╮
" │     vim-table-mode	  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

map tm :TableModeToggle<CR>



" ╭───────────────────────╮
" │     	vimwiki		  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

let g:taskwiki_sort_orders={"C": "pri-"}
let g:taskwiki_syntax = 'markdown'
let g:taskwiki_markdown_syntax='markdown'
let g:taskwiki_markup_syntax='markdown'
" 让wiki使用md格式保存文件，保存在~/.vim/vimwiki
let g:vimwiki_list = [{
  \ 'automatic_nested_syntaxes':1,
  \ 'path_html': '~/.vim/vimwiki/wiki_html',
  \ 'path': '~/.vim/vimwiki',
  \ 'syntax': 'markdown',
  \ 'ext':'.md',
\}]



" ╭───────────────────────╮
" │     	wildfire	  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯


let g:wildfire_objects = {
    \ "*" : ["i'", 'i"', "i)", "i]", "i}"],
    \ "html,xml" : ["at", "it"],
\ }



" ╭───────────────────────╮
" │    gruvbox-material	  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

let g:gruvbox_material_background = 'hard'						" 设置背景色方案。可选值为hard（默认值）、medium、soft和none。分别对应不同程度的灰度和透明度
let g:gruvbox_material_palette = 'original'						" 设置配色方案。可选值为 mix：混合配色，original：原始gruvbox配色，material：Google的material design风格配色
let g:gruvbox_material_bold = 1									" 是否使用粗体，默认值 1（启用）
let g:gruvbox_material_italic = 1								" 是否使用斜体，默认值 1（启用）
let g:gruvbox_material_underline = 1							" 是否使用下划线，默认值 1（启用）
let g:gruvbox_material_undercurl = 1							" 是否使用下波浪线，默认值 1（启用）
let g:gruvbox_material_visual = "#fe8019"						" 设置可视块选中颜色,可选值为grey、orange和green
let g:gruvbox_material_visual_select = '83a598'					" 设置可视行选中颜色。可选值为blue（默认值）和red
let g:gruvbox_material_sign_column = '#1d2021'					" 设置标记列的颜色。可选值为bg0、bg1和bg2
let g:gruvbox_material_indent_guides = '#282828'				" 设置缩进指南的颜色。可选值为bg1、bg2和bg3
let g:gruvbox_material_diagnostic_line_highlight = 1			" 是否启用诊断线高亮。默认为 1（启用）
let g:gruvbox_material_diagnostic_text_highlight = 1			" 是否启用诊断文本高亮。默认为 1（启用）
let g:gruvbox_material_diagnostic_virtual_text_highlight = 1	" 是否启用诊断虚拟文本高亮。默认为 1（启用）
let g:gruvbox_material_better_performance = 0					" 是否启用更好的性能模式。默认为 0 如果启用，某些高亮特性将被禁用以提高性能
let g:gruvbox_material_transparent_background = 0				" 是否启用透明背景。默认为0。如果启用，将使用终端窗口的透明度
colorscheme gruvbox-material



" ╭───────────────────────╮
" │     dracula_pro		  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

packadd! dracula_pro
syntax enable											" 启用语法高亮显示
syntax on												" 启用高亮
let g:dracula_colorterm = 0								" 亚克力效果，0 表示不模糊 1 表示模糊
colorscheme dracula_pro_blade



" ╭───────────────────────╮
" │    		snazzy		  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

" 设置颜色主题
" color snazzy
" Snazzy透明配色
let g:SnazzyTransparent=1



" ╭───────────────────────╮
" │ vim-better-whitespace │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

let g:better_whitespace_enabled=0								" 高亮显示行尾空格/制表符，会自动把制表符转换为空格，保持文件的一致性



" ╭───────────────────────╮
" │ 		codeium		  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

let g:codeium_disable_bindings = 1								" 禁用Codeium插件的默认绑定键位
imap <script><silent><nowait><expr> <C-g> codeium#Accept()		" 调用 Codeium 插件的 Accept() 函数
imap <C-;>   <Cmd>call codeium#CycleCompletions(1)<CR>			" 循环选择下一个补全项
imap <C-,>   <Cmd>call codeium#CycleCompletions(-1)<CR>			" 循环选择上一个补全项
imap <C-x>   <Cmd>call codeium#Clear()<CR>						" 清除当前的补全建议
" let g:codeium_enabled = v:false								" 禁用codeium插件
let g:codeium_manual = v:true									" 启用 Codeium 插件的手动模式，配合快捷键使用
let g:airline_section_y = '{…}%3{codeium#GetStatusString()}'	" 在 Airline 插件的状态栏中显示 Codeium 插件的状态信息
set statusline+=\{…\}%3{codeium#GetStatusString()}				" 显示codeium状态栏信息(有logo)
" set statusline+=%3{codeium#GetStatusString()}					" 显示codeium状态栏信息(没logo)
" 设置默认启用codeium插件的文本类型






" >-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<
" >-<>-<                               coc配置                               >-<>-<
" >-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<

" ╭───────────────────────╮
" │        coc 扩展		  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

" 设置全局变量，不用换设备后手动重装 coc扩展
let g:coc_global_extensions = [
        \ 'coc-clangd',
        \ 'coc-css',
        \ 'coc-diagnostic',
        \ 'coc-eslint',
        \ 'coc-explorer',
        \ 'coc-flutter',
        \ 'coc-gitignore',
        \ 'coc-highlight',
        \ 'coc-html',
        \ 'coc-htmldjango',
        \ 'coc-import-cost',
        \ 'coc-java',
        \ 'coc-jedi',
        \ 'coc-jest',
        \ 'coc-json',
        \ 'coc-lists',
        \ 'coc-lightbulb',
        \ 'coc-ltex',
        \ 'coc-markdownlint',
        \ 'coc-markdown-preview-enhanced',
        \ 'coc-marketplace',
        \ 'coc-prettier',
        \ 'coc-pydocstring',
        \ 'coc-pyright',
        \ 'coc-sh',
        \ 'coc-snippets',
        \ 'coc-stylelint',
        \ 'coc-syntax',
        \ 'coc-tailwindcss',
        \ 'coc-texlab',
        \ 'coc-translator',
        \ 'coc-tsserver',
        \ 'coc-vimlsp',
        \ 'coc-xml']



" ╭───────────────────────╮
" │      coc 命令模式	  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

" =====> 使用 ctrl + c 打开 Coc 命令模式
nnoremap <C-c> :CocCommand<CR>

" =====> 使用 ctrl + x 打开 CocList
nnoremap <C-x> :CocList<CR>


" ╭───────────────────────╮
" │      coc 自动补全	  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

" =====> coc-vimlsp  可以让vim有自动补全选项，可以使用tab来补全(没有这个配置时，tab不会自动补全会是个缩进)
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" 回车退出补全不换行
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" <c-space>打开补全项
inoremap <silent><expr> <c-space> coc#refresh()



" ╭───────────────────────╮
" │      coc 代码诊断	  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<cr>		" 查看诊断信息
nmap <silent> [g <Plug>(coc-diagnostic-prev)						" 查看上一个报错
nmap <silent> ]g <Plug>(coc-diagnostic-next)						" 查看下一个报错



" ╭───────────────────────╮
" │     coc 格式化代码	  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

nmap <leader>p :CocCommand prettier.formatFile<CR>					" 绑定快捷键 <leader>p 为格式化当前文件

let g:coc_global_extensions = ['coc-prettier']
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0



" ╭───────────────────────╮
" │      coc 函数关系	  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

" =====> 查看函数是在哪儿被调用
nmap <silent> gd <Plug>(coc-definition)					" 跳转该函数被定义的位置
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)					" 跳转到该函数被引用的位置



" ╭───────────────────────╮
" │      coc 函数说明	  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

" =====> <leader>m 在预览窗口显示当前函数的文档/作用
nnoremap <silent> <leader>m :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction



" ╭───────────────────────╮
" │      coc 变量命名	  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

" =====> <leader>r 重命名当前 函数/变量 名，会修改所有引用这个 函数/变量 的地方
nmap <leader>r <Plug>(coc-rename)



" ╭───────────────────────╮
" │       代码格式化	  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

" =====> 对当前选中区域代码格式化
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" ╭───────────────────────╮
" │       函数文本		  │
" ╰━━━━━━━━━━━━━━━━━━━━━━━╯

" =====> 查看当前参数的文本文档
" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)







