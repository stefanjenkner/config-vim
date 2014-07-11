execute pathogen#infect()
" To disable plugins...
"runtime! plugin/sensible.vim
"runtime! plugin/vim-xpath

filetype plugin indent on
syntax on
set modeline
set nu

" Line wrapping
"set wrap
"set lbr
"set showbreak=…

" Indent and tabs
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4

set wildmenu
"set wildmode=list:longest

" Leader
let mapleader = ","

" Keep longer history
set history=100

" Highlight search terms
set hlsearch
set incsearch

" https://github.com/plasticboy/vim-markdown
"let g:vim_markdown_folding_disabled=1
"let g:vim_markdown_initial_foldlevel=1

" http://vim.wikia.com/wiki/Using_the_mouse_for_Vim_in_an_xterm
"set ttyfast
"set mouse=a
"set ttymouse=xterm2
"set clipboard=autoselect
if $TERM_PROGRAM == "iTerm.app"
  set mouse=a
  set ttymouse=xterm2
	set clipboard=autoselect
endif
set title

" http://www.vim.org/scripts/script.php?script_id=3645
"let g:GPGExecutable = 'gpg'
"let g:GPGUseAgent = 1
"let g:GPGPreferArmor = 1

" Underline misspelled words
hi clear SpellBad
hi SpellBad cterm=underline

" To spell check all git commit messages
" https://coderwall.com/p/a8akca
au BufNewFile,BufRead COMMIT_EDITMSG set spell spelllang=de,en

" https://github.com/altercation/vim-colors-solarized
set background=dark
"set background=light
if $TERM == "xterm-256color"
  let g:solarized_termcolors=256
endif
"let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

" https://github.com/actionshrimp/vim-xpath
let g:skip_xpath = 1

" Automatically position the cursor when editing email messages
" http://vim.wikia.com/wiki/Automatically_position_the_cursor_when_editing_email_messages
autocmd BufRead mutt* execute 'normal gg/\n\n\n^M2j'

" TaskPaper 
let g:task_paper_date_format = "%Y-%m-%dT%H:%M:%S%z"
let g:task_paper_archive_project = "Archive"
" archive on write
autocmd BufWrite *.taskpaper call taskpaper#archive_done()

" vim: sw=2 ts=2
