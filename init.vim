set number
:set relativenumber
:set autoindent
:set tabstop=5
:set shiftwidth=5
:set smarttab
:set softtabstop=5
:set mouse=a
:set splitright

" set true color
:set termguicolors


"Remaping movement from hjkl to jkl;
nnoremap j h
nnoremap k jzz
nnoremap l kzz
nnoremap ; l

vnoremap j h
vnoremap k j
vnoremap l k
vnoremap ; l

onoremap j h
onoremap k j
onoremap l k
onoremap ; l
 
" Move line up or down
nnoremap mk <cmd> move +1 <cr>
nnoremap ml <cmd> move -2 <cr>

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'github/copilot.vim'
Plug 'rust-lang/rust.vim'
Plug 'https://github.com/rust-lang/rust-analyzer'
Plug 'https://github.com/fannheyward/coc-rust-analyzer'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'
Plug 'tmsvg/pear-tree'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '1.1.5' }
Plug 'https://github.com/nvim-telescope/telescope.nvim'
Plug 'tribela/vim-transparent'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ThePrimeagen/harpoon'
call plug#end()

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.') =~# '^\s*$'
endfunction


inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#confirm() :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()


let g:LanguageClient_serverCommands = {
\ 'rust': ['rust-analyzer'],
\ }

"hi Normal guibg=NONE ctermbg=NONE
inoremap <silent><expr> <CR>
      \ coc#pum#visible() ? coc#pum#confirm() :
	  \ CheckBackspace() ? "\<CR>" :
      \ coc#refresh()

" SAVE
noremap <C-s> :w <cr>


" JUMP AND CENTER 
nnoremap <C-K> <C-d>zz
nnoremap <C-L> <C-u>zz




nnoremap n nzzzv
nnoremap N Nzzzv
" GO BACK TO FILE TREE
nmap <leader>pv :Ex <CR>

nmap <leader>a <Plug>(coc-codeaction)
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-cursor)


" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" HARPOON
nnoremap h <cmd>lua require("harpoon.mark").add_file()<cr><cr>:redraw!<cr>
nnoremap <leader>h <cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>
nnoremap <leader>1 <cmd>lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>2 <cmd>lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>3 <cmd>lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>4 <cmd>lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader>5 <cmd>lua require("harpoon.ui").nav_file(5)<CR>
nnoremap <leader>6 <cmd>lua require("harpoon.ui").nav_file(6)<CR>
nnoremap <leader>7 <cmd>lua require("harpoon.ui").nav_file(7)<CR>
nnoremap <leader>8 <cmd>lua require("harpoon.ui").nav_file(8)<CR>
nnoremap <leader>9 <cmd>lua require("harpoon.ui").nav_file(9)<CR>

lua require("harpoon").setup({ tabline = true, tabline_prefix="   ", tabline_suffix="   " })

highlight! HarpoonInactive guibg=NONE guifg=NONE
highlight! HarpoonActive guibg=NONE guifg=NONE gui=bold
highlight! HarpoonNumberActive guibg=NONE guifg=NONE
highlight! HarpoonNumberInactive guibg=NONE guifg=NONE
highlight! TabLineFill guibg=NONE guifg=NONE


" TELESCOPE
" Basic Telescope mappings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <C-f> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <C-g> <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" When I press enter in telescope i want to navigate to the file
" and close telescope


" Colorscheme
:colorscheme one


" Copilot
autocmd VimEnter * Copilot disable

" For local replace
nnoremap rp *Ncgn
" For global replace
nnoremap grp gD:%s/<C-R>///gc<left><left><left>

" Rust hover intellicence
" Use K to show documentation in preview window
nnoremap <leader>d  :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


" TS highlighting

" Clear search
nnoremap <leader>c <cmd>noh<cr>


" Yank scope 
nnoremap ys [{yi{

