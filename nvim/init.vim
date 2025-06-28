""""""""""""""""""""""""""""""""""""""""
""" My shortcuts

" let mapleader = ","
let g:mapleader = ","

nnoremap <leader>n      :tabn<cr>
inoremap <leader>n <ESC>:tabn<cr>

nnoremap <leader>p      :tabp<cr>
inoremap <leader>p <ESC>:tabp<cr>

nnoremap <leader>q      :q<cr>
inoremap <leader>q <ESC>:q<cr>

nnoremap <leader>w      :wa!<cr>
inoremap <leader>w <ESC>:wa!<cr>

nnoremap <leader>s :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>v :tabe ~/.config/nvim/init.vim<cr>

noremap <leader>f :noh<cr>

vmap <leader>s :sort<cr>

map B ^
map E $
map F ?
map f /

" Map <leader>t to insert a timestamp in HH:MM format
nnoremap <leader>t :r!date "+\%H:\%M"<CR>
" inoremap <leader>t <C-O>:let @a=strftime('%H:%M')<CR>p<C-O>
" not really working

""""""""""""""""""""""""""""""""""""""""
""" Sensible defaults
""" From https://www.rogin.xyz/blog/sensible-neovim

" Allows you to change buffers even if the current on has unsaved changes
set hidden

" Intuit the indentation of new lines when creating them
set smartindent

" Return to last edit position when opening files
" It's some magic I picked up somewhere, no idea how it works
" or what alternatives are out there
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Who wants .swap files??
set noswapfile

" Enable mouse support
set mouse=a

" Turn persistent undo on
" means that you can undo even when you close a buffer/VIM
set undodir=~/.vim_runtime/temp_dirs/undodir
set undofile


""""""""""""""""""""""""""""""""""""""""
""" My settings

set expandtab        " spaces for tabs
set ffs=unix,mac,dos " line endings
set ignorecase       " for search
set number           " line numbers
set smartindent      " adjust indent level based on code (think python)
set smarttab         " tabs in new lines
set tabstop=2        " spaces per tab
set shiftwidth=2     " spaces per level of indent
set softtabstop=2    " ?? not sure diff w/ previous one
set wrap lbr         " wrap without breaking words

set showbreak=↳\ " shown at the start of a wrapped line
set listchars=tab:↹·,extends:⇉,precedes:⇇,nbsp:␠,trail:␠,nbsp:␣
set breakindent      " Indent wrapped lines up to the same level

""""""""""""""""""""""""""""""""""""""""
""" Clipboard

" apparently i can make vim use the system's clipboard by default
" On Windows or mac set:
" set clipboard=unnamed
" On Linux set (vim 7.3.74+):
set clipboard=unnamedplus
" from https://stackoverflow.com/a/10979533


""""""""""""""""""""""""""""""""""""""""
""" Package manager
""" See https://github.com/folke/lazy.nvim

"""" lua <<EOF
""""
"""" local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
"""" if not vim.loop.fs_stat(lazypath) then
""""   vim.fn.system({
""""     "git",
""""     "clone",
""""     "--filter=blob:none",
""""     "https://github.com/folke/lazy.nvim.git",
""""     "--branch=stable", -- latest stable release
""""     lazypath,
""""   })
"""" end
""""
"""" vim.opt.rtp:prepend(lazypath)
""""
"""" require("lazy").setup({
""""   'airblade/vim-gitgutter',
""""   'ctrlpvim/ctrlp.vim',
""""   'rstacruz/taskpaper.vim',
""""   'junegunn/goyo.vim',
""""   'hjson/vim-hjson',
""""
""""   -- themes
""""   'junegunn/seoul256.vim',
""""   'plan9-for-vimspace/acme-colors',
""""   'mhartington/oceanic-next',
""""   'jnurmine/Zenburn',
""""   'karoliskoncevicius/oldbook-vim',
""""   'rost/vim-lesser',
""""   'eihigh/vim-aomi-grayscale',
""""   'robertmeta/nofrils',
""""
""""   -- some light themes
""""   'AlessandroYorba/Breve',
""""   'lifepillar/vim-solarized8',
""""   'arcticicestudio/nord-vim',
""""   'easymotion/vim-easymotion',
""""
""""   -- LSPs
""""   'williamboman/mason.nvim',
""""   'williamboman/mason-lspconfig.nvim',
""""   -- 'neovim/nvim-lspconfig.nvim',
"""" })
""""
"""" EOF

""""""
""" Install Dein

let $CACHE = expand('~/.cache')
if !($CACHE->isdirectory())
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dir = 'dein.vim'->fnamemodify(':p')
  if !(s:dir->isdirectory())
    let s:dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !(s:dir->isdirectory())
      execute '!git clone https://github.com/Shougo/dein.vim' s:dir
    endif
  endif
  execute 'set runtimepath^='
        \ .. s:dir->fnamemodify(':p')->substitute('[/\\]$', '', '')
endif

""""""""""""""""""""""""""""""""""""""""
""" Dein

" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Set dein base and source paths (required)
let s:dein_base = '~/.cache/dein/'
let s:dein_src = '~/.cache/dein/repos/github.com/Shougo/dein.vim'

" Set dein runtime path (required)
execute 'set runtimepath+=' .. s:dein_src

" Call dein initialization (required)
call dein#begin(s:dein_base)

call dein#add(s:dein_src)

" Your plugins go here:

call dein#add('airblade/vim-gitgutter')
call dein#add('nvim-lua/plenary.nvim') " Required dependency of zenmode
call dein#add('folke/zen-mode.nvim')
call dein#add('ctrlpvim/ctrlp.vim')
"" call dein#add('junegunn/goyo.vim')
call dein#add('rstacruz/taskpaper.vim')
call dein#add('hjson/vim-hjson')

" themes
call dein#add('junegunn/seoul256.vim')
call dein#add('plan9-for-vimspace/acme-colors')
call dein#add('robertmeta/nofrils')
call dein#add('mhartington/oceanic-next')
call dein#add('jnurmine/Zenburn')
call dein#add('karoliskoncevicius/oldbook-vim')
call dein#add('rost/vim-lesser')
call dein#add('eihigh/vim-aomi-grayscale')

" some light themes
call dein#add('AlessandroYorba/Breve')
call dein#add('lifepillar/vim-solarized8')
call dein#add('arcticicestudio/nord-vim')
call dein#add('easymotion/vim-easymotion')

" LSPs
"" call dein#add('williamboman/mason.nvim')
"" call dein#add('williamboman/mason-lspconfig.nvim')
"" call dein#add('neovim/nvim-lspconfig.nvim')
"" call dein#add('hrsh7th/nvim-cmp')                  " Autocomplete engine
"" call dein#add('hrsh7th/cmp-nvim-lsp')              " Completion source for LSP

" Finish dein initialization (required)
call dein#end()

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

" Uncomment if you want to install not-installed plugins on startup.
if dein#check_install()
  call dein#install()
endif


"""""""""""""""""""""""""""""""""""""""
""" Zen mode settings
lua << EOF
require("zen-mode").setup {
  window = {
    width = 100,         -- width of the writing area
    options = {
      number = false,   -- turn off line numbers
      relativenumber = false,
      cursorline = false,
    },
  },
}
EOF

nnoremap <Leader>z :ZenMode<CR>

""""""""""""""""""""""""""""""""""""""""
""" LSP setup


:



""""""""""""""""""""""""""""""""""""""""
""" Theme

"" set background=dark
" colorscheme nord
" colorscheme nofrils-dark " ultra minimal
" other cool themes
" - seoul256 cool
" - lesser too much
" ... breve vanilla-cake solarized8_high solarized8 solarized8_low solarized8_flat black_and_white nord acme


""""""""""""""""""""""""""""""""""""""""
""" Configure Bottom UI
" set all of these to 0 to have an ultra minimal look.

set cmdheight=1
set laststatus=2 " For some reason this doesnt work
autocmd BufRead,BufNewFile * set laststatus=2 " This will work instead


""""""""""""""""""""""""""""""""""""""""
""" Movement through wrapped lines

map <silent> j gj
map <silent> k gk


""""""""""""""""""""""""""""""""""""""""
""" Ctrl P

let g:ctrlp_by_filename = 1 " only filename and not the full path
let g:ctrlp_working_path_mode='rw' " this makes it look from the root and not the current file's directory
let g:ctrlp_custom_ignore = '\v[\/]*node_modules*$'
