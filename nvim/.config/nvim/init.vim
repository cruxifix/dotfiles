"-----------Keywords----------"
"<C-^>      Toggle between buffers
"gt         Navigate to next tab
":bd        Delete buffer (tab)
":tabe      Open new tab
":ls        View list of buffers
"<C-w>|     Expand split to full width/height
"<C-w>=     Change splits back to default width/height
"<C-]>      Go to function definition (only if ctags is enabled)
"<C-o>      Go to next jump list
"<C-i>      Go to prev jump list
"mM         Save mark and assign as M (this applies to all buffers)
"`M         Navigate to mark M with position (with first row, use ' instead)
"d'M        Delete until postion mark M
"v'M        Visual select until position mark M
"'0         Navigate to last position, saved under mark 0
"'qp        Paste macro saved from q

"-----------Settings----------"
set nocompatible
set number
set relativenumber
set encoding=utf-8
set nobackup
set hlsearch
set laststatus=2
" Hides buffers instead of closing them
set hidden
" Spaces instead of tabs
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Indentation
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType vue setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Apply indentation to next line
set autoindent

set t_CO=256
set termguicolors

" Default split position
set splitbelow
set splitright

" No error bells
set noerrorbells visualbell t_vb=

" Visuals
highlight CursorLine cterm=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline

"-----------Mappings----------"
let mapleader = "\<space>"
map <C-n> :NERDTreeToggle<CR>

" Easier access to config file
nmap <leader>ev :tabedit $MYVIMRC<CR>

" Do not let NERDTree override Vinegar commands
let NERDTreeHijackNetrw = 0

" Paste replace visual selection without copying it
vnoremap <leader>p "_dP

" Better window navigation
map <C-h> <C-w><C-h>
map <C-j> <C-w><C-j>
map <C-k> <C-w><C-k>
map <C-l> <C-w><C-l>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Remove search keyword removal
map <leader><space> :nohlsearch<CR>

" Save as sudo
cmap w!! %!sudo tee > /dev/null %

" Open non-existent files
map gf :edit <cfile><CR>

"-----------Plugins----------"
source ~/.config/nvim/plugins.vim

"-----------Auto-Commands----------"

" set to gruvbox
autocmd vimenter * ++nested colorscheme gruvbox

" Automatically source config file upon save
augroup autosourcing
    autocmd!
    autocmd BufWritePost init.vim source %
augroup end

" Set blade files to html for better indenting
autocmd BufNewFile,BufRead *.blade.php set syntax=html
autocmd BufNewFile,BufRead *.blade.php set filetype=html
autocmd BufNewFile,BufRead *.jsx set filetype=html
" autocmd BufNewFile,BufRead *.vue set filetype=html

" Set // comments
autocmd FileType php setlocal commentstring=/\/\ %s

" Ultisnips
let g:pdv_template_dir = $HOME ."/.local/share/nvim/plugged/pdv/templates_snip"
nnoremap <leader>pd :call pdv#DocumentWithSnip()<CR>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Maximizer maximize current split or return to previous
noremap <C-w>m :MaximizerToggle<CR>

" vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>A :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" FZF
set rtp+=/opt/homebrew/opt/fzf
nmap <C-p> :Files<CR>
" let $FZF_DEFAULT_OPTS="--preview-window 'right:57%' --preview 'bat --style=numbers --line-range :300 {}'
" \ --bind ctrl-y:preview-up,ctrl-e:preview-down,
" \ctrl-b:preview-page-up,ctrl-f:preview-page-down,
" \ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,
" \shift-up:preview-top,shift-down:preview-bottom,
" \alt-up:half-page-up,alt-down:half-page-down"

" COC
source ~/.config/nvim/coc.vim

" Mappings for COC
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" CoC Code navigation for COC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" vim-airline to support patched fonts
let g:airline_powerline_fonts=1

" Prettier formatting command shortcut with :F
command! -nargs=0 F :CocCommand prettier.forceFormatDocument
