" Keep nocompatible at the top to enable vim specific options
set nocompatible
set noerrorbells
set autoindent
set showmode
set backspace=indent,eol,start
" set backup
set history=50
set ruler
set showcmd
set incsearch

set background=light
syntax on
set hlsearch

set statusline="%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]"
"set laststatus=2
hi statusline ctermfg=grey

set wildmode=list:longest

if has("gui_running")
	set go-=T
endif

if has("gui_macvim")
	set columns=120
	set guifont=Monaco:h12.00	
elseif has("gui_gtk") || has("gui_kde")
	set guifont=Liberation\ Mono\ 9
endif

hi comment ctermfg=darkgreen guifg=darkgreen
hi identifier ctermfg=black guifg=black

hi keyword ctermfg=darkblue guifg=darkblue
hi type ctermfg=darkblue guifg=darkblue
hi preproc ctermfg=darkblue guifg=darkblue
hi statement ctermfg=darkblue guifg=darkblue

hi special ctermfg=red guifg=red

hi constant ctermfg=darkred guifg=darkred
hi string ctermfg=darkred guifg=darkred
hi character ctermfg=darkred guifg=darkred
hi number ctermfg=darkred guifg=darkred
hi float ctermfg=darkred guifg=darkred
hi boolean ctermfg=darkred guifg=darkred

hi search ctermbg=yellow guibg=yellow
hi todo ctermbg=yellow ctermfg=black guibg=yellow guifg=black
hi statusline ctermbg=black guibg=black
hi matchparen ctermbg=yellow ctermfg=black guibg=yellow guifg=black
hi tabline ctermbg=grey ctermfg=black
hi tablinesel ctermbg=black ctermfg=white
hi tablinefill ctermbg=grey ctermfg=white

" File type dependent options
if has("autocmd")
	" Disable visual and audio bell
	autocmd VimEnter * set vb t_vb=
	
	" Enable file type detection, plugins, and indentation rules.
	filetype plugin indent on
	autocmd FileType text setlocal textwidth=80
	" The above doesn't include this.
	autocmd BufNewFile,BufRead *.txt setlocal textwidth=80
	autocmd BufNewFile,BufRead *.tex set filetype=tex
	autocmd BufNewFile,BufRead *.cellgen set filetype=c
	" When editing a file, always jump to the last known cursor position.
	autocmd BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\ 	execute "normal g`\"" |
		\ endif
endif
