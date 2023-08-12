# Spectrum.nvim

Spectrum.nvim aims to be a lightweight theme manager for nvim which at this moment
is pretty much WIP

# Included themes atm

- refined decay (a new refined version im working for the [decay theme](https://github.com/decaycs))

# Usage

Install fist with lazy.nvim or another package manager of your preference

```lua
{
    'AlphaTechnolog/spectrum.nvim',
    lazy = false,
    priority = 100,
    config = function ()
        require("spectrum").setup({
            theme = "decay", -- theme name
            variant = "refined" -- don't pass if you want the "default" variant
        })
    end
}
```

### Lualine integration

At this moment this plugin has a little lualine integration which can be invoked
**after** calling the `setup` function.

```lua
{
    'nvim-lualine/lualine.nvim',
    config = function ()
        require("lualine").setup({
            options = {
                theme = require("spectrum").get_lualine_theme()
            }
        })
    end
}
```

## Adding more themes

At this moment the only way of adding more themes is by adding a pr in this repo
following the next instructions:

1. Create a new folder at `lua/spectrum/themes/` with the name of the theme,
example is, tokyonight, so the folder is `lua/spectrum/themes/tokyonight`

2. Create the variants of the theme itself, the default one should be called `default.lua`,
example for tokyonight:

    - `lua/spectrum/themes/tokyonight/default.lua`
    - `lua/spectrum/themes/tokyonight/day.lua`
    - `lua/spectrum/themes/tokyonight/storm.lua`
    - `lua/spectrum/themes/tokyonight/moon.lua`

3. Take a look at this and fill the colors in the files:

```lua
return {
  background = '#0e1011',
  dark_background = '#0d0f10',
  light_background = '#181c1e',
  lighter_background = '#23282b',
  black = '#2e3538',
  light_black = '#373f43',
  lighter_black = '#373f43',

  red = '#f04a73',
  green = '#36e0bb',
  yellow = '#e9dd72',
  blue = '#79acf8',
  magenta = '#aa79f8',
  cyan = '#79c5f8',
  white = '#b5b5cd',

  light_red = '#f26588',
  light_green = '#54e4c5',
  light_yellow = '#ece287',
  light_blue = '#8db8f9',
  light_magenta = '#b68df9',
  light_cyan = '#8dcdf9',
  light_white = '#a9a9c5',
}
```

> That's the refined decay colors

4. Test your theme!

```lua
local lualine = require("lualine")
local spectrum = require("spectrum")

spectrum.setup {
    theme = 'tokyonight',
    variant = 'moon'
}

lualine.setup {
    options = {
        theme = spectrum.get_lualine_theme()
    }
}
```

5. Submit a PR! :D (leave at least one screenshot for each variant please)

## Incoming features

There are some nice features i wanna implement over the time for this plugin.

- [x] Palettes support
- [x] Theming system
- [x] Basic highlighting
- [x] Lualine integration
- [ ] Theme switching (functions for next theme and prev themes)
- [ ] Better looking themes
- [ ] Palettes should also be to change highlights if needed to match original themes

## Enjoy

Please if you like this project or my work, give me a star, it will really help me
continue doing these kind of projects :)
