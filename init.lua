local theming = require("spectrum.theming")

local spectrum = {}

function spectrum.error_log(msg)
  print("[spectrum]: " .. tostring(msg))
end

function spectrum.error(msg)
  error("[spectrum]: " .. tostring(msg))
end

function spectrum.check_config()
  local required_fields = {'theme'}
  for _, field in ipairs(required_fields) do
    if not spectrum.config[field] then
      spectrum.error_log("config expects to have a " .. field .. " field, but it wasn't given...")
      break
    end
  end
  return true
end

function spectrum.query_theme(theme)
  return "spectrum.themes." .. theme.theme .. "." .. theme.variant
end

function spectrum.require_theme(theme)
  if not theme.theme and not theme.variant then
    error("[internal spectrum error] invalid given theme!")
  end

  return require(spectrum.query_theme(theme))
end

function spectrum.theme_exists(theme)
  local ok, _ = pcall(spectrum.require_theme, theme)
  return ok
end

function spectrum.load_theme(theme)
  local palette = spectrum.require_theme(theme)
  theming.set_nvim_colors(palette)
  vim.g.spectrum_palette = palette
end

function spectrum.get_lualine_theme()
  if not vim.g.spectrum_palette then
    spectrum.error("Invalid spectrum palette found!")
    return
  end

  local theme = {}
  local colors = vim.g.spectrum_palette

  theme.normal = {
    a = { bg = colors.blue, fg = colors.background },
    b = { bg = colors.black, fg = colors.foreground },
    c = { bg = colors.light_background, fg = colors.light_white }
  }

  theme.insert = {
    a = { bg = colors.magenta, fg = colors.background },
    b = { bg = colors.black, fg = colors.foreground },
  }

  theme.command = {
    a = { bg = colors.red, fg = colors.background },
    b = { bg = colors.black, fg = colors.foreground },
  }

  theme.visual = {
    a = { bg = colors.cyan, fg = colors.background },
    b = { bg = colors.black, fg = colors.foreground },
  }

  theme.replace = {
    a = { bg = colors.red, fg = colors.background },
    b = { bg = colors.black, fg = colors.foreground },
  }

  theme.inactive = {
    a = { bg = colors.background, fg = colors.white },
    b = { bg = colors.black, fg = colors.foreground },
    c = { bg = colors.light_background, fg = colors.foreground },
  }

  return theme
end

function spectrum.setup(config)
  spectrum.config = config

  if not spectrum.check_config() then
    spectrum.error("Detected an invalid config, aborting...")
    return
  end

  local variant = config.variant or "default"

  local theme_exists = spectrum.theme_exists {
    theme = config.theme,
    variant = variant
  }

  if not theme_exists then
    spectrum.error("Theme " .. config.theme .. " (variant " .. variant .. ") cannot be found")
    return
  end

  spectrum.load_theme {
    theme = config.theme,
    variant = variant
  }
end

return spectrum
