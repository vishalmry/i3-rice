call plug#begin('~/.config/nvim/bundle')
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'rakr/vim-one'
Plug 'dylanaraps/wal.vim'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'yuttie/comfortable-motion.vim'

"the below plugins for nova-color scheme
Plug 'trevordmiller/nova-vim'
Plug 'lifepillar/vim-solarized8'
Plug 'chriskempson/base16-vim'

Plug 'NLKNguyen/papercolor-theme'
Plug 'gabrielsimoes/cfparser.vim'
Plug 'scrooloose/nerdtree'
Plug 'joshdick/onedark.vim'
Plug 'sonph/onehalf'
" Plug 'chriskempson/tomorrow-theme'
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
Plug 'rhysd/vim-clang-format'
Plug 'morhetz/gruvbox'
" Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'ayu-theme/ayu-vim' 
Plug 'drewtempelmeyer/palenight.vim'
Plug 'hzchirs/vim-material'
call plug#end()

let g:deoplete#enable_at_startup = 1
noremap <Leader><space> :noh<cr>
set number relativenumber autochdir autoindent cursorline
set mouse=a
highlight Comment cterm=italic
syntax enable
set t_Co=256

" clang format for autoformatting cpp code
" autocmd VimEnter * ClangFormatAutoEnable
set formatoptions-=ro

let g:onedark_termcolors=16


if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
 " let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 > "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
 set termguicolors
endif

set background=dark
" colo pablo
" set background=light
" colorscheme palenight
" let ayucolor="dark"
" colo ayu
" let g:gruvbox_contrast_dark='hard'
" colo cobalt
" colo dracula
" colo Tomorrow
" colo PaperColor
" colo base16-atelier-lakeside
colo gruvbox
let g:palenight_terminal_italics=1
" let g:lightline = { 'colorscheme' : 'palenight' }


" Open multiple lines (insert empty lines) before or after current line,
" and position cursor in the new space, with at least one blank line
" before and after the cursor.
function! OpenLines(nrlines, dir)
  let nrlines = a:nrlines < 3 ? 3 : a:nrlines
  let start = line('.') + a:dir
  call append(start, repeat([''], nrlines))
  if a:dir < 0
    normal! 2k
  else
    normal! 2j
  endif
endfunction
" Mappings to open multiple lines and enter insert mode.
nnoremap <Leader><Leader>o :<C-u>call OpenLines(v:count, 0)<CR>S
nnoremap <Leader><Leader>O :<C-u>call OpenLines(v:count, -1)<CR>S
set foldmethod=manual
" Quickly insert an empty new line without entering insert mode
    nnoremap <Leader>o o<Esc>
    nnoremap <Leader>O O<Esc>

" some vim config
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
let $BASH_ENV = "~/.bash_aliases"

" colo PaperColor

" if (strftime("%H") > 7 && strftime("%H") < 18)
"   colo solarized8_high
" else
"   colo solarized8_high
" endif


function CPP14()
  :read ~/.config/nvim/templates/cpp14.sh
endfunction

" for commentry plugin set cpp comment to //
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s

" for terminal mapping
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    tnoremap <M-[> <Esc>
endif


if has('nvim')
    " Terminal mode:
    tnoremap <M-h> <c-\><c-n><c-w>h
    tnoremap <M-j> <c-\><c-n><c-w>j
    tnoremap <M-k> <c-\><c-n><c-w>k
    tnoremap <M-l> <c-\><c-n><c-w>l
    " Insert mode:
    inoremap <M-h> <Esc><c-w>h
    inoremap <M-j> <Esc><c-w>j
    inoremap <M-k> <Esc><c-w>k
    inoremap <M-l> <Esc><c-w>l
    " Visual mode:
    vnoremap <M-h> <Esc><c-w>h
    vnoremap <M-j> <Esc><c-w>j
    vnoremap <M-k> <Esc><c-w>k
    vnoremap <M-l> <Esc><c-w>l
    " Normal mode:
    nnoremap <M-h> <c-w>h
    nnoremap <M-j> <c-w>j
    nnoremap <M-k> <c-w>k
    nnoremap <M-l> <c-w>l
endif

" faster arrow navigation, up and down.
nnoremap <C-k> :-5<CR>
inoremap <C-k> <Esc>:-5<CR> i
nnoremap <C-j> :+5<CR>
inoremap <C-j> <Esc>:+5<CR> i

nnoremap <C-Up> :-5<CR>
inoremap <C-Up> <Esc>:-5<CR> i
nnoremap <C-Down> :+5<CR>
inoremap <C-Down> <Esc>:+5<CR> i

