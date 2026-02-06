# yara.nvim

`yara.nvim` is a Neovim colorscheme with two native variants:

- `dark`
- `light`

It automatically follows `:set background=dark` / `:set background=light` when using `:colorscheme yara`.

## Install

### lazy.nvim

```lua
return {
  "pompos02/yara.nvim",
  name = "yara",
  config = function()
    vim.cmd("colorscheme yara")
  end,
}
```

## Configuration

Configure before loading the colorscheme.

```lua
require("yara").setup({
  variant = "auto", -- "auto" | "dark" | "light"

  styles = {
    bold = true,
    italic = true,
    transparency = false,
  },

  palette = {
    -- optional color overrides
  },

  highlight_groups = {
    -- optional highlight overrides
  },
})

vim.cmd("colorscheme yara")
```

## Starter Palette

The initial palette was seeded from:

`#e4e4e4 #f4f4ff #f5f5f5 #ffffff #000000 #101010 #181818 #282828 #453d41 #484848 #52494e #c73c3f #f43841 #ff4f58 #73d936 #ffdd33 #cc8c3c #95a99f #303540 #565f73 #96a6c8 #9e95c7`

## Credits

The theme architecture and highlight coverage are based on the same structure used in `misirlou.nvim`, which itself builds on the excellent Rosé Pine ecosystem.
