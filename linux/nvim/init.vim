:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a	" enable mouse
set history=1000    " command history
set linebreak
set showbreak=>>	" shows linebreak
set wrap
set ruler
set showcmd
set smartcase ignorecase incsearch	" searching and highlighting

call plug#begin(stdpath('config') . '/plugged')

	Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
	Plug 'https://github.com/preservim/nerdtree' " NerdTree
	Plug 'Xuyuanp/nerdtree-git-plugin' " NerdTree Git Plugin
	Plug 'airblade/vim-gitgutter'	" Gutter Plugin
	Plug 'https://github.com/vim-airline/vim-airline' " Status bar
	Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
	Plug 'preservim/nerdcommenter'		"	For commenting
	Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
	Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
	Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
	Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
	Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
	Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
	Plug 'christoomey/vim-tmux-navigator'  "Tmux navigator for vim
	Plug 'wellle/targets.vim' " Add custom text objects
	Plug 'ggandor/lightspeed.nvim' " Lighspeed.vim for text navigation
	Plug 'folke/which-key.nvim' " Show possible key-bindings
	Plug 'pechorin/any-jump.vim'  " jump to definition/reference
	Plug 'pantharshit00/vim-prisma'		" Syntax highlighting for prisma

	" Lang Plugins {
    Plug 'lervag/vimtex'
	" }

	" Git {
    Plug 'tpope/vim-fugitive'                   " Git inside vim
    Plug 'airblade/vim-gitgutter'               " show changes in signcolumn
	" }

	" Visuals/syntax {
    Plug 'thaerkh/vim-indentguides'
    Plug 'flazz/vim-colorschemes'
    Plug 'luochen1990/rainbow'                  " bracket coloring
    Plug 'sheerun/vim-polyglot'                 " Syntax highlighting
    Plug 'blueyed/vim-diminactive'
    Plug 'stevearc/dressing.nvim'               " prettier boxes like on rename
	" }

	" Quality of Life {
    Plug 'jiangmiao/auto-pairs'                 " autoclose deimiters
    Plug 'alvan/vim-closetag'                   " autoclose html esq tags
    Plug 'tpope/vim-surround'                   " edit tags/delimiters in pairs
    Plug 'mhinz/vim-startify'                   " start screen
    Plug 'ryanoasis/vim-devicons'               " fancy icons
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'ConradIrwin/vim-bracketed-paste'      " autoset paste mode
    Plug 'easymotion/vim-easymotion'            " better movement
    Plug 'tpope/vim-repeat'                     " repeat commands with .
	Plug 'sudormrfbin/cheatsheet.nvim'        " fuzzy cheatsheet
	Plug 'psliwka/vim-smoothie'					" Smooth scroll

	"	Sessions
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-session'	" Save sessions

	" Barbar
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'romgrk/barbar.nvim'

	" Telescope
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
call plug#end()

"-----PLUGIN SETTINGS----------
" NerdComment {
  let g:NERDSpaceDelims = 1                     " add space after comment char
  let g:NERDCompactSexyComs = 1                 " short syntax in comment blocks
" }
" Vim-Session {
  let g:session_autosave = 'yes'                " auto save session periodically
" }
" Rainbow Brackets {
  let g:rainbow_active = 1                      " rainbow brackets
" }
" Indent Guides {
  let g:indentguides_spacechar = '|'            " indent guide chars
  let g:indentguides_tabchar = '|'
" }

"-------EXTRA SETTINGS-------------
" Auto delete trailing whitespace, save cursor position
autocmd BufWritePre * let currPos = getpos(".")
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e
autocmd BufWritePre * cal cursor(currPos[1], currPos[2])

" WSL yank support
if system('uname -r') =~ "microsoft"
  augroup Yank
    autocmd!
    autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
  augroup END
endif

" show function signatures
augroup mygroup
  autocmd!
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')Lq
augroup end

"--------KEY MAPPINGS------------

" NERDTree remapping
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

nmap <F8> :TagbarToggle<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"BARBAR
	" Move to previous/next
	nnoremap <silent>    <A-,> :BufferPrevious<CR>
	nnoremap <silent>    <A-.> :BufferNext<CR>
	" Re-order to previous/next
	nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
	nnoremap <silent>    <A->> :BufferMoveNext<CR>
	" Goto buffer in position...
	nnoremap <silent>    <A-1> :BufferGoto 1<CR>
	nnoremap <silent>    <A-2> :BufferGoto 2<CR>
	nnoremap <silent>    <A-3> :BufferGoto 3<CR>
	nnoremap <silent>    <A-4> :BufferGoto 4<CR>
	nnoremap <silent>    <A-5> :BufferGoto 5<CR>
	nnoremap <silent>    <A-6> :BufferGoto 6<CR>
	nnoremap <silent>    <A-7> :BufferGoto 7<CR>
	nnoremap <silent>    <A-8> :BufferGoto 8<CR>
	nnoremap <silent>    <A-9> :BufferLast<CR>
	" Pin/unpin buffer
	nnoremap <silent>    <A-p> :BufferPin<CR>
	" Close buffer
	nnoremap <silent>    <A-c> :BufferClose<CR>
	" Wipeout buffer
	"                          :BufferWipeout<CR>
	" Close commands
	"                          :BufferCloseAllButCurrent<CR>
	"                          :BufferCloseAllButPinned<CR>
	"                          :BufferCloseBuffersLeft<CR>
	"                          :BufferCloseBuffersRight<CR>
	" Magic buffer-picking mode
	nnoremap <silent> <C-s>    :BufferPick<CR>
	" Sort automatically by...
	nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
	nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
	nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
	nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>

	" Other
	" :BarbarEnable - enables barbar (enabled by default)
	" :BarbarDisable - very bad command, should never be used


:set completeopt-=preview " For No Previews

"------------SET COLORSCHEME--------------
:colorscheme onehalfdark

"---------FUNCTIONS-----------------

function! s:show_documentation()
  if (index(['vim', 'help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" start with auto save on
augroup AutoSave
  autocmd CursorHoldI <buffer>
    \ if &readonly == 0 && filereadable(bufname('%')) | silent write | endif
augroup END

" auto save
function! ToggleAutoSave()
  " Switch the toggle variable
  let g:AutoSaveToggle = !get(g:, 'AutoSaveToggle', 1)
  " Reset group
  augroup AutoSave
    autocmd!
    echo "auto save off"
    let g:airline_detect_modified = 1
    let g:airline_symbols.modified = '+'
  augroup END
  " Enable if toggled on
  if g:AutoSaveToggle
    augroup AutoSave
      autocmd CursorHoldI <buffer>
        \ if &readonly == 0 && filereadable(bufname('%')) | silent write | endif
      echo "auto save on"
      let g:airline_detect_modified = 0
      let g:airline_symbols.modified = ''
    augroup END
  endif
endfunction

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction
Plug 'nvim-telescope/telescope-fzy-native.vim'
Plug 'nvim-telescope/telescope-fzy-native.vim'

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" vim-prettier
"let g:prettier#quickfix_enabled = 0
"let g:prettier#quickfix_auto_focus = 0
" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" run prettier on save
"let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync