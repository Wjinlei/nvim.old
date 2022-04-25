" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: fock of @theniceboy with my private modifiactons


" ===
" === Vim plugins manager
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ===
" === Create a _machine_specific.vim
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
    let has_machine_specific_file = 0
    silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim

" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
    exec "e ~/.config/nvim/_machine_specific.vim"
endif

" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"


" ====================
" === Editor Setup ===
" ====================


" ===
" === System
" ===
set clipboard=unnamed
let &t_ut=''
set autochdir


" ===
" === Editor behavior
" ===
set hidden
set number
set relativenumber
"set cursorline
set wrap
set showcmd
set wildmenu
set hlsearch
set incsearch
set ignorecase
set smartcase
set encoding=utf-8
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=30
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
set autoindent
set laststatus=2
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set shortmess+=c
set inccommand=split
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set regexpengine=1
set visualbell
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
    set undofile
    set undodir=~/.config/nvim/tmp/undo,.
endif
"set colorcolumn=80
set updatetime=100
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ===
" === Terminal Behaviors
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'


" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "

" Save & quit
noremap q :q!<CR>
noremap Q :qa!<CR>
noremap w :w!<CR>
noremap W :w!<CR>

" Record Macro
noremap <Leader>q q

" Open file
noremap ff :e 
noremap FF :e 

" Folding
noremap fl zc
noremap fo zo

" Open the vimrc file anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" Search
noremap <LEADER>nl :nohlsearch<CR>

" Back normal mode
inoremap jj <Esc>
inoremap JJ <Esc>


" ===
" === Cursor Movement
" ===
noremap <silent> K 5k
noremap <silent> J 5j
noremap <silent> H b
noremap <silent> L w
noremap <silent> <C-h> ^
noremap <silent> <C-l> $


" ===
" === Window management
" ===
" Disable the default s key
noremap s <nop>
" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap spk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap spj :set splitbelow<CR>:split<CR>
noremap sph :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap spl :set splitright<CR>:vsplit<CR>
noremap smv <C-w>t<C-w>K
noremap smh <C-w>t<C-w>H
" moving the cursor around windows
noremap sk <C-w>k
noremap sj <C-w>j
noremap sh <C-w>h
noremap sl <C-w>l
noremap <Up> :res +5<CR>
noremap <Down> :res -5<CR>
noremap <Left> :vertical resize-5<CR>
noremap <Right> :vertical resize+5<CR>
" tab management
noremap stt :tabe<CR>
noremap sth :-tabnext<CR>
noremap stl :+tabnext<CR>
noremap stmh :-tabmove<CR>
noremap stml :+tabmove<CR>


" ===
" === Other useful stuff
" ===
" Opening a terminal window
noremap <LEADER>/ :term<CR>

" Open up lazygit
noremap <silent> <LEADER>lg :term lazygit<CR>
noremap <silent> <LEADER>LG :term lazygit<CR>

" Open up ranger
noremap <silent> <LEADER>fd :term ranger<CR>
noremap <silent> <LEADER>FD :term ranger<CR>

" find and replace
noremap \s :%s//g<left><left>

" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'html'
        silent! exec "!".g:mkdp_browser." % &"
    elseif &filetype == 'vue'
        set splitright
        :vsp
        :term npm run build
    elseif &filetype == 'rust'
        exec "!cargo run"
        "exec "!rustc % -o %<"
        "exec "!time ./%<"
    elseif &filetype == 'go'
        set splitright
        :vsp
        :term go run %
    endif
endfunc


" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('~/.config/nvim/plugged')

" Theme
Plug 'dracula/vim'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ojroques/vim-scrollstatus'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Completion framework
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Highlight
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'RRethy/vim-illuminate'

" Format
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba' " vim-codefmt dep
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'

" Edit
Plug 'lambdalisue/suda.vim'
Plug 'preservim/nerdcommenter'
Plug 'luochen1990/rainbow' " 彩虹括号
"Plug 'airblade/vim-rooter'
Plug 'SirVer/ultisnips'

" Language
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()
call glaive#Install()

" ===================== Start of Plugin Settings =====================

" ===
" === Dress up my vim
" ===
syntax on
set termguicolors
set background=dark " Setting dark mode
"set background=light " Setting light mode
colorscheme dracula


" ===
" === vim-airline
" ===
" airline theme
"let g:airline_theme='kolor'
let g:airline_theme='dracula'

" enable powerline fonts
let g:airline_powerline_fonts = 1
" enable none extensions for opimization
let g:airline_highlighting_cache = 1
" enable tabline extension
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" cache :hi calls for optimization
let g:airline_extensions = ['tabline','hunks', 'branch']

" customize the section
function! AirlineInit()
  " section a: mode & VCS info; VCS info is provided by vim-fugitive
  let g:airline_section_a = airline#section#create(['mode', ' Git:', 'branch'])
  " section b: hunks info, provided by vim-gitgutter
  let g:airline_section_b = airline#section#create(['hunks'])
  let g:airline_section_z = airline#section#create([''])
endfunction

autocmd User AirlineAfterInit call AirlineInit()

" ===
" === vim-scrollstatus
" ===
let g:scrollstatus_size = 15
let g:airline_section_x = '%{ScrollStatus()} '
let g:airline_section_y = airline#section#create_right(['filetype'])
let g:airline_section_z = airline#section#create([
            \ '%#__accent_bold#%3l%#__restore__#/%L', ' ',
            \ '%#__accent_bold#%3v%#__restore__#/%3{virtcol("$") - 1}',
            \ ])

"Black
"DarkBlue
"DarkGreen
"DarkCyan
"DarkRed
"DarkMagenta
"Brown, DarkYellow
"LightGray, LightGrey, Gray, Grey
"DarkGray, DarkGrey
"Blue, LightBlue
"Green, LightGreen
"Cyan, LightCyan
"Red, LightRed
"Magenta, LightMagenta
"Yellow, LightYellow
"White

"hi PmenuSel guifg=LightGray
"hi PmenuSel guibg=DarkBlue
"hi Pmenu guifg=Gray
"hi Pmenu guibg=Black
"hi TabLine guifg=Black
"hi TabLineSel guibg=DarkBlue
"hi TabLineSel guifg=LightGray
"hi StatusLine guifg=DarkGrey


" ===
" === 背景透明
" ===
"hi Normal     ctermbg=NONE guibg=NONE
"hi LineNr     ctermbg=NONE guibg=NONE
"hi SignColumn ctermbg=NONE guibg=NONE


" ===
" === 灰色注释
" ===
"hi Comment guifg=#5C6370 ctermfg=59


" ===
" === rainbow
" ===
let g:rainbow_active = 1

" ===
" === vim-gitgutter
" ===
nmap gn <Plug>(GitGutterNextHunk)
nmap gp <Plug>(GitGutterPrevHunk)
nmap gf :GitGutterFold<CR>
nmap <LEADER>hs <Plug>(GitGutterStageHunk)
nmap <LEADER>hu <Plug>(GitGutterUndoHunk)
nmap <LEADER>hp <Plug>(GitGutterPreviewHunk)

" ===
" === vim-rooter
" ===
"let g:rooter_patterns = ['.git']
"let g:rooter_change_directory_for_non_project_files = 'current'


" ===
" === vim-illuminate
" ===
hi illuminatedWord cterm=undercurl gui=undercurl

" ===
" === suda.vim
" ===
cnoreabbrev sudow w suda://%

" ===
" === AutoFormat
" ===
Glaive codefmt prettier_options="--print-width=120"
augroup autoformat_settings
  " autocmd FileType bzl AutoFormatBuffer buildifier
  " autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  " autocmd FileType dart AutoFormatBuffer dartfmt
  " autocmd FileType go AutoFormatBuffer gofmt
  " autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json,javascript AutoFormatBuffer js-beautify
  " autocmd FileType java AutoFormatBuffer google-java-format
  " autocmd FileType python AutoFormatBuffer yapf
  " autocmd FileType python AutoFormatBuffer autopep8
  " autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END


" ===
" === Nerdcommenter
" ===
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" ===
" === coc
" ===
"silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
let g:coc_global_extensions = [
  \ 'coc-rust-analyzer',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-tsserver',
  \ 'coc-vetur',
  \ 'coc-snippets',
  \ 'coc-diagnostic',
  \ 'coc-explorer',
  \ 'coc-git',
  \ 'coc-gitignore',
  \ 'coc-pairs']

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use <C-j> and <C-k> to navigate the completion list:
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <alt+/> to trigger completion.
inoremap <silent><expr> <M-/> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `=` and `-` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<cr>
nmap <silent> = <Plug>(coc-diagnostic-prev)
nmap <silent> - <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Useful commands
" CocCommand
nnoremap <C-c> :CocCommand<CR>
" coc-explorer
nnoremap tt :CocCommand explorer<CR>
" coc-snippets
inoremap <silent><expr> <TAB>
    \ pumvisible() ? coc#_select_confirm() :
    \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
let g:coc_snippet_next = '<TAB>' 
let g:coc_snippet_prev = '<S-TAB>'
imap <C-l> <Plug>(coc-snippets-expand)

" ===
" === Ultisnips
" ===
"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/UltiSnips/', 'UltiSnips']
silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>


" ===
" === vim-go
" ===
let g:go_auto_type_info                      = 1
let g:go_highlight_array_whitespace_error    = 1
let g:go_highlight_build_constraints         = 1
let g:go_highlight_chan_whitespace_error     = 1
let g:go_highlight_extra_types               = 1
let g:go_highlight_fields                    = 1
let g:go_highlight_format_strings            = 1
let g:go_highlight_function_calls            = 1
let g:go_highlight_function_parameters       = 1
let g:go_highlight_functions                 = 1
let g:go_highlight_generate_tags             = 1
let g:go_highlight_methods                   = 1
let g:go_highlight_operators                 = 1
let g:go_highlight_space_tab_error           = 1
let g:go_highlight_string_spellcheck         = 1
let g:go_highlight_structs                   = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types                     = 1
let g:go_def_mapping_enabled                 = 0
let g:go_doc_keywordprg_enabled              = 0
let g:go_imports_autosave                    = 1
let g:go_fmt_autosave                        = 1
let g:go_mod_fmt_autosave                    = 1
"let g:go_metalinter_autosave                 = 1
"let g:go_metalinter_autosave_enabled         = ['vet', 'golint']
autocmd FileType go noremap <LEADER>gta :GoTest<CR>
autocmd FileType go noremap <LEADER>gtt :GoTestFunc<CR>

" ===
" === Rust
" ===
syntax enable
filetype plugin indent on
let g:rustfmt_autosave = 0
let g:rust_clip_command = 'xclip -selection clipboard'
let g:rust_fold = 1
autocmd FileType rust noremap <LEADER>rtt :RustTest<CR>
autocmd FileType rust noremap <LEADER>rff :RustFmt<CR>

" ===================== End of Plugin Settings =====================
