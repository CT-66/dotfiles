--[[
-- lualine --
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = '|',
    section_separators = { left = '', right = '' },
    -- 
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = {'branch'},
    -- lualine_c = {'filename'},
    lualine_c = {
       { 'filename', separator = { right = '' }, left_padding = 2 },
    },
    lualine_x =  {
      { 'filetype', separator = { left = '', right = '' }},
    },
    lualine_y = {'diagnostics'},
    lualine_z = {}
  },
  extensions = {}
}
--]]

-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.black },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}

--[[
require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
--]]

-- neoscroll --

-- neoscroll
-- :lua << EOF
-- require('neoscroll').setup({--
--     mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
--                 '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
--     hide_cursor = true,          -- Hide cursor while scrolling
--     stop_eof = true,             -- Stop at <EOF> when scrolling downwards
--     use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
--     respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
--     cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
--     easing_function = nil,        -- Default easing function
--     pre_hook = nil,              -- Function to run before the scrolling animation starts
--     post_hook = nil,              -- Function to run after the scrolling animation ends
-- })
-- EOF

-- barbar.nvim --

-- alt+x -> close buffer
vim.g.bufferline = {
    animation = false,
    auto_hide = false,
    tabpages = false,
    clickable = true,
    icons = 'both',
    icon_separator_active = '',
    icon_separator_inactive = '',
    icon_close_tab = '',
    icon_close_tab_modified = '●',

}

-- nvim-tree.lua
require'nvim-tree'.setup()

-- toggleterm.nvim
require("toggleterm").setup{
    open_mapping = [[<c-\>]],
    direction = 'vertical',
    size = 50,
    border = 'curved',
    insert_mappings = true,
    shade_terminals = true,
    shading_factor = '1',
    close_on_exit = false

}
