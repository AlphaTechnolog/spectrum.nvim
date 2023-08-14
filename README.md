# Spectrum.nvim

Spectrum.nvim aims to be a lightweight theme manager for nvim which at this moment
is pretty much WIP

# Included themes atm

- rustic decay (a new rustic version im working for the [decay theme](https://github.com/decaycs))

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
            variant = "rustic" -- don't pass if you want the "default" variant
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
  background = '#110f0f',
  dark_background = '#100e0e',
  light_background = '#1d1a1a',
  lighter_background = '#2a2525',
  black = '#373030',
  light_black = '#413939',
  lighter_black = '#746666',

  red = '#f04a73',
  green = '#87dc76',
  yellow = '#fad874',
  blue = '#7dace9',
  magenta = '#847de9',
  cyan = '#7dd3e9',
  white = '#b5b5cd',

  light_red = '#f26588',
  light_green = '#8ddd7c',
  light_yellow = '#fad97a',
  light_blue = '#83b0ea',
  light_magenta = '#8a83ea',
  light_cyan = '#83d5ea',
  light_white = '#a9a9c5',
}
```

> Those are the rustic decay colors

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
