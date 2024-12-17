" leader
let mapleader = ","

" https://github.com/tpope/vim-sensible - defaults everyone can agree on, plus...
filetype plugin indent on
syntax on
set ruler
set number
set wildmenu
set history=1000
set visualbell
set hlsearch
set incsearch
set noshowmode

" built-in comment plugin
packadd! comment

" http://vim.wikia.com/wiki/Using_the_mouse_for_Vim_in_an_xterm
set title
if $TERM_PROGRAM == "iTerm.app"
  set mouse=a
  set ttymouse=sgr
  set clipboard=autoselect
elseif $TERM_PROGRAM == "Apple_Terminal"
  set mouse=a
  set ttymouse=sgr
  set clipboard=autoselect
elseif $TERM == "xterm-256color"
  set mouse=a
  set ttymouse=sgr
elseif $TERM == "tmux-256color"
  set mouse=a
  set ttymouse=xterm2
endif

" underline misspelled words
hi clear SpellBad
hi SpellBad cterm=underline
" to spell check all git commit messages
au BufNewFile,BufRead COMMIT_EDITMSG set spell spelllang=de,en

" https://github.com/lifepillar/vim-solarized8
if has('gui_running')
  set background=light
else
  set background=dark
endif
let g:solarized_statusline = "normal"
" let g:solarized_statusline = "low"
" let g:solarized_statusline = "flat"
let g:solarized_italics = 1
let g:solarized_visibility = "normal"
" let g:solarized_visibility = "low"
" let g:solarized_visibility = "high"
" autocmd vimenter * ++nested colorscheme solarized8_high
autocmd vimenter * ++nested colorscheme solarized8
" autocmd vimenter * ++nested colorscheme solarized8_low
" autocmd vimenter * ++nested colorscheme solarized8_flat

" toggle background dark/white
function! ToggleBackground()
  if &background == "dark"
    set background=light
  else
    set background=dark
  endif
  execute 'source' globpath(&rtp, 'autoload/lightline/colorscheme/solarized.vim')
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction
map <F5> :call ToggleBackground()<CR>

"" https://github.com/itchyny/lightline.vim
let g:lightline = {
\   'colorscheme': 'solarized',
\}

" https://github.com/preservim/nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$']

" https://github.com/inkarkat/vim-VcsMessageRecall
let g:VcsMessageRecall_StoreDirName = 'commit-msgs'
let g:VcsMessageRecall_git_MessageRecallOptions = {
\   'ignorePattern': "^Merge branch",
\}

" https://github.com/dense-analysis/ale
let g:ale_linters = {
\   'markdown': ['vale'],
\   'python': ['ruff'],
\   'yaml.cloudformation': ['cfn-lint'],
\}
let g:ale_fixers = {
\   'python': ['ruff'],
\}
let g:ale_type_map = {
\   'vale': {'ES': 'WS', 'suggestion': 'I'},
\}
let g:ale_fix_on_save = 0
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

" vim: sw=2 ts=2
