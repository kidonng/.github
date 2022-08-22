lua <<EOS
_G.InitPacker = function()
    require 'packer'.startup(function()
        use {
            'folke/tokyonight.nvim',
            config = function()
                if vim.env.BAT_THEME == 'Tokyo Night Day' then
                    vim.o.background = 'light'
                end

                vim.cmd 'colorscheme tokyonight'
            end
        }
        use {
            'neoclide/coc.nvim',
            branch = 'release',
            config = function()
                vim.o.signcolumn = 'yes'
                vim.g.coc_global_extensions = {
                    'coc-css',
                    'coc-deno',
                    'coc-explorer',
                    'coc-git',
                    'coc-highlight',
                    'coc-html',
                    'coc-json',
                    'coc-lists',
                    'coc-pairs',
                    'coc-tabnine',
                    'coc-tsserver',
                }
            end
        }
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            config = function()
                require'nvim-treesitter.configs'.setup {
                    ensure_installed = 'all',
                    highlight = { enable = true },
                    incremental_selection = { enable = true },
                    indent = { enable = true }
                }
            end
        }
        use {
            'sheerun/vim-polyglot',
            config = function()
                vim.g.vim_markdown_fenced_languages = {
                    'css',
                    'html',
                    'js=javascript',
                    'ts=typescript',
                    'tsx=typescriptreact',
                }
            end
        }
        use {
            'numToStr/Comment.nvim',
            config = function()
                require 'Comment'.setup()
            end
        }
        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true },
            config = function()
                require 'lualine'.setup()
                vim.o.shortmess = vim.o.shortmess .. "c"
                vim.o.showmode = false
            end
        }
        use 'wakatime/vim-wakatime'
        use { 'wbthomason/packer.nvim', opt = true }
    end)
end
EOS

com! PackerSync packadd packer.nvim | call v:lua.InitPacker() | PackerSync

augroup cursorline
    autocmd!
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline
augroup END

set cursorline
set tabstop=4
set ignorecase smartcase
set mouse=a
set nowrap

autocmd BufNewFile,BufRead *.astro setfiletype html 
autocmd BufNewFile,BufRead *.njk setfiletype html 
autocmd FileType fish set wrap expandtab
autocmd FileType markdown set wrap
autocmd FileType mdx set wrap

inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gt <Plug>(coc-type-definition)

nmap <Leader>a <Plug>(coc-codeaction-selected)
xmap <Leader>a <Plug>(coc-codeaction-selected)
nmap <Leader>r <Plug>(coc-rename)

nnoremap <silent><nowait> <Space>b :CocList buffers<CR>
nnoremap <silent><nowait> <Space>c :CocList commands<CR>
nnoremap <silent><nowait> <Space>d :CocList diagnostics<CR>
nnoremap <silent><nowait> <Space>e :CocCommand explorer<CR>
nnoremap <silent><nowait> <Space>f :CocList files<CR>
nnoremap <silent><nowait> <Space>g :CocList grep<CR>
nnoremap <silent><nowait> <Space>l :CocList -I --ignore-case lines<CR>
nnoremap <silent><nowait> <Space>o :CocList outline<CR>
nnoremap <silent><nowait> <Space>r :CocListResume<CR>
nnoremap <silent><nowait> <Space>s :CocList symbols<CR>

nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(0)\<CR>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(1)\<CR>" : "\<Right>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
nnoremap <silent> K :call ShowDocumentation()<CR>

autocmd CursorHold * silent call CocActionAsync('highlight')
highlight link CocHighlightText Visual

