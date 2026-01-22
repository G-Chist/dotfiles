return {

  -- Icons
  { "nvim-tree/nvim-web-devicons", lazy = false },
  { "ryanoasis/vim-devicons", lazy = false },

  -- Smooth scrolling
  {'psliwka/vim-smoothie'},

  -- LSP and completion
  {
    'neoclide/coc.nvim',
    branch = 'release', -- recommended for stability
    config = function()
      vim.cmd([[
        function! CheckBackspace() abort
          let col = col('.') - 1
          return !col || getline('.')[col - 1]  =~# '\s'
        endfunction

        inoremap <silent><expr> <Tab>
              \ coc#pum#visible() ? coc#pum#next(1) :
              \ CheckBackspace() ? "\<Tab>" :
              \ coc#refresh()

        inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

        " Highlighting
        hi CocFloating ctermbg=DarkGrey
        hi CocMenuSel ctermbg=Blue
        hi CocSearch ctermfg=Cyan
      ]])
    end,
  },

  -- File explorer
{
  'preservim/nerdtree',
  dependencies = { 'ryanoasis/vim-devicons' },
  config = function()
    vim.g.NERDTreeShowHidden = 1
    vim.g.NERDTreeShowLineNumbers = 1

    vim.api.nvim_create_autocmd("VimEnter", {
      pattern = "*",
      command = "NERDTree",
    })

    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "NERD_tree_*", -- This pattern matches NERDTree buffers
      callback = function()
        vim.opt_local.relativenumber = false
        vim.opt_local.number = true
      end,
    })
  end,
},

  -- Image previewer
  {
      "3rd/image.nvim",
      build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
      opts = {
          processor = "magick_cli",
      }
  },
  -- Tree Sitter
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate'
  },

  -- Color Scheme
{
  "metalelf0/black-metal-theme-neovim",
  lazy = false,
  priority = 1000,
  config = function()
    require("black-metal").setup({
      theme = "nile",
      variant = "dark"
    })
    require("black-metal").load()
  end,
},

  -- Git integration
  'airblade/vim-gitgutter',
  'tpope/vim-fugitive',

  -- UI enhancements
  {
    'Yggdroot/indentLine',
    config = function()
      vim.g.indentLine_char = '¦'
      vim.g.indentLine_leadingSpaceEnabled = 1
      vim.g.indentLine_leadingSpaceChar = '·'
      vim.g.indentLine_color_term = 239
    end,
  },
  'terryma/vim-smooth-scroll',
  'ap/vim-css-color',

  -- Editor utilities
  'andymass/vim-matchup', -- Replaced MatchTagAlways, as config options suggest this is intended
  'kqito/vim-easy-replace',
  {
    'numToStr/Comment.nvim',
    opts = {},
    config = function()
      require('Comment').setup()
      vim.keymap.set('v', '<C-1>', function()
          require('Comment.api').comment.linewise(vim.fn.visualmode())
      end, { desc = 'Comment selected lines' })
      vim.keymap.set('v', '<C-3>', function()
          require('Comment.api').uncomment.linewise(vim.fn.visualmode())
      end, { desc = 'Uncomment selected lines' })
    end
  },

  -- Disassemble: view ASM instruction of the current C line
  'mdedonno1337/disassemble.nvim',

  -- Neoterm: use the terminal from Neovim
  'kassio/neoterm'
}
