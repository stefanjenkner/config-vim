" Leader
let mapleader = ","

" https://github.com/tpope/vim-sensible
" Defaults everyone can agree on, plus...
filetype plugin indent on
syntax on
set ruler
set number
set wildmenu
set history=1000
set visualbell
set hlsearch
set incsearch

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
endif

" Underline misspelled words
hi clear SpellBad
hi SpellBad cterm=underline

" To spell check all git commit messages
" https://coderwall.com/p/a8akca
au BufNewFile,BufRead COMMIT_EDITMSG set spell spelllang=de,en

" https://github.com/altercation/vim-colors-solarized
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
\   'colorscheme': 'solarized',
\}
" no more '-- INSERT --' (which is now displayed in the statusline)
set noshowmode

" Automatically position the cursor when editing email messages
" http://vim.wikia.com/wiki/Automatically_position_the_cursor_when_editing_email_messages
autocmd BufRead mutt* execute 'normal gg/\n\n\n^M2j'

" https://github.com/preservim/nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$']

" https://github.com/inkarkat/vim-VcsMessageRecall
let g:VcsMessageRecall_StoreDirName = 'commit-msgs'
let g:VcsMessageRecall_git_MessageRecallOptions = {
\   'ignorePattern': "^Merge branch",
\}

" https://github.com/dense-analysis/ale
let g:ale_linters = {
\   'yaml.cloudformation': ['cfn-lint'],
\   'python': ['ruff'],
\}
let g:ale_fixers = {
\   'python': ['ruff'],
\}
let g:ale_fix_on_save = 0

" vim: sw=2 ts=2
