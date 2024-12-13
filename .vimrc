" To disable plugins...
let g:pathogen_disabled = []
execute pathogen#infect()

" Leader
let mapleader = ","

" Defaults everyone can agree on - https://github.com/tpope/vim-sensible
filetype plugin indent on
syntax on
set ruler
set number
set wildmenu
set history=1000
set visualbell

" Line wrapping
"set wrap
"set lbr
"set showbreak=…

" Heuristically set buffer options - https://github.com/tpope/vim-sleuth.git
"set smartindent
"set expandtab
"set tabstop=8
"set shiftwidth=8

" Highlight search terms
set hlsearch
set incsearch

" https://github.com/plasticboy/vim-markdown
"let g:vim_markdown_folding_disabled=1
"let g:vim_markdown_initial_foldlevel=1

" http://vim.wikia.com/wiki/Using_the_mouse_for_Vim_in_an_xterm
set title
"set ttyfast
"set mouse=a
"set ttymouse=xterm2
"set clipboard=autoselect
if $TERM_PROGRAM == "iTerm.app"
  set mouse=a
  set ttymouse=xterm2
  set clipboard=autoselect
elseif $TERM_PROGRAM == "Apple_Terminal"
  set mouse=a
  set ttymouse=xterm2
  set clipboard=autoselect
endif

" Underline misspelled words
hi clear SpellBad
hi SpellBad cterm=underline

" To spell check all git commit messages
" https://coderwall.com/p/a8akca
au BufNewFile,BufRead COMMIT_EDITMSG set spell spelllang=de,en

" https://github.com/altercation/vim-colors-solarized
"set background=dark
if has('gui_running')
  set background=light
else
  set background=dark
endif
if $TERM == "xterm-256color"
  let g:solarized_termcolors=256
elseif $TERM == "screen-256color"
  let g:solarized_termcolors=256
elseif $TERM == "tmux-256color"
  let g:solarized_termcolors=256
endif
let g:solarized_contrast="normal"
let g:solarized_visibility="low"
colorscheme solarized

" toggle background dark/white
call togglebg#map("<F5>")

" fix toggled ligthline/solarized status bar
function! s:TogBGlightline()
  execute 'source' globpath(&rtp, 'autoload/lightline/colorscheme/solarized.vim')
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction
if !exists(":ToggleBGlightline")
  command ToggleBGlightline :call s:TogBGlightline()
endif

"" https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }
" no more '-- INSERT --' (which is now displayed in the statusline)
set noshowmode

" Automatically position the cursor when editing email messages
" http://vim.wikia.com/wiki/Automatically_position_the_cursor_when_editing_email_messages
autocmd BufRead mutt* execute 'normal gg/\n\n\n^M2j'

" https://github.com/junegunn/fzf.vim
if isdirectory("/usr/local/opt/fzf")
  set rtp+=/usr/local/opt/fzf
endif

" ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

" https://github.com/inkarkat/vim-VcsMessageRecall?tab=readme-ov-file#configuration
let g:VcsMessageRecall_StoreDirName = 'commit-msgs'
let g:VcsMessageRecall_git_MessageRecallOptions = {
  \   'ignorePattern': "^Merge branch",
  \ }

" vim: sw=2 ts=2
