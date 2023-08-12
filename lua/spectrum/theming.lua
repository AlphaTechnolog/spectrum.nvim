local util = require("spectrum.util")

local theming = {}

local function apply_highlights(highlights)
  for highlight, payload in pairs(highlights) do
    vim.api.nvim_set_hl(0, highlight, payload)
  end
end

function theming.create_shortcuts(palette)
  local ret = {}

  for key, value in pairs(palette) do
    ret[key] = value
  end

  local shortcuts = {
    statusline_bg = palette.light_background,
    comments = palette.lighter_black,
    cursorline = palette.black,
    cursor = palette.foreground
  }

  for field, value in pairs(shortcuts) do
    if not ret[field] then
      ret[field] = value
    end
  end

  return ret
end

function theming.set_nvim_colors(palette)
  palette = theming.create_shortcuts(palette)
  apply_highlights {
    Normal = { fg = palette.foreground, bg = palette.background },
    StatusLine = { bg = palette.statusline_bg, fg = palette.foreground },
    StatusLineNC = { bg = palette.statusline_bg, fg = palette.white },
    SignColumn = { bg = palette.background, fg = palette.background },
    MsgArea = { fg = palette.foreground, bg = palette.background },
    ModeMsg = { fg = palette.foreground, bg = palette.background },
    MsgSeparator = { fg = palette.foreground, bg = palette.background },
    SpellBad = { fg = palette.green },
    SpellCap = { fg = palette.cyan },
    SpellLocal = { fg = palette.blue },
    SpellRare = { fg = palette.cyan },
    NormalNC = { fg = palette.foreground, bg = palette.background },
    WildMenu = { fg = palette.white, bg = palette.blue },
    Pmenu = { bg = palette.light_background, fg = palette.foreground }, -- Popup menu: normal item.
    PmenuSel = { bg = palette.black }, -- Popup menu: selected item.
    PmenuSbar = { bg = palette.light_background }, -- Popup menu: scrollbar.
    PmenuThumb = { bg = palette.lighter_black }, -- Popup menu: Thumb of the scrollbar.
    CursorLineNr = { fg = palette.foreground },
    Comment = { fg = palette.comments },
    Folded = { fg = palette.blue, bg = palette.background },
    FoldColumn = { fg = palette.blue, bg = palette.background },
    LineNr = { fg = palette.light_black, bg = palette.background },
    FloatBorder = { fg = palette.background, bg = palette.background },
    Whitespace = { fg = palette.red },
    VertSplit = { bg = palette.background, fg = palette.black },
    CursorLine = { bg = palette.cursorline },
    CursorColumn = { bg = palette.background },
    ColorColumn = { bg = palette.background },
    NormalFloat = { bg = palette.background },
    Visual = { bg = palette.black, fg = palette.foreground },
    VisualNOS = { bg = palette.background },
    WarningMsg = { fg = palette.yellow, bg = palette.background },
    DiffAdd = { bg = palette.background, fg = palette.green },
    DiffChange = { bg = palette.background, fg = palette.blue },
    DiffDelete = { bg = palette.background, fg = palette.red },
    QuickFixLine = { bg = palette.green },
    MatchParen = { fg = palette.blue, bg = palette.background },
    Cursor = { fg = palette.fomeground, bg = palette.cursor },
    lCursor = { fg = palette.foreground, bg = palette.cursor },
    CursorIM = { fg = palette.foreground, bg = palette.cursor },
    TermCursor = { fg = palette.foreground, bg = palette.cursor },
    TermCursorNC = { fg = palette.foreground, bg = palette.cursor },
    Conceal = { fg = palette.blue, bg = palette.background },
    Directory = { fg = palette.blue },
    SpecialKey = { fg = palette.blue },
    Title = { fg = palette.blue },
    ErrorMsg = { fg = palette.red, bg = palette.background },
    Search = { fg = palette.background, bg = palette.blue },
    IncSearch = { fg = palette.background, bg = palette.cyan },
    Substitute = { fg = palette.yellow, bg = palette.cyan },
    MoreMsg = { fg = palette.magenta },
    Question = { fg = palette.magenta },
    EndOfBuffer = { fg = palette.background },
    NonText = { fg = palette.red },
    Variable = { fg = palette.magenta },
    String = { fg = palette.green },
    Character = { fg = palette.light_blue },
    Constant = { fg = palette.magenta },
    Number = { fg = palette.red },
    Boolean = { fg = palette.magenta },
    Float = { fg = palette.magenta },
    Identifier = { fg = palette.magenta },
    Function = { fg = palette.blue },
    Operator = { fg = palette.cyan },
    Type = { fg = palette.magenta },
    StorageClass = { fg = palette.magenta },
    Structure = { fg = palette.cyan },
    Typedef = { fg = palette.cyan },
    Keyword = { fg = palette.magenta },
    Statement = { fg = palette.cyan },
    Conditional = { fg = palette.magenta },
    Repeat = { fg = palette.magenta },
    Label = { fg = palette.red },
    Exception = { fg = palette.light_red },
    Include = { fg = palette.magenta },
    PreProc = { fg = palette.blue },
    Define = { fg = palette.blue },
    Macro = { fg = palette.cyan },
    PreCondit = { fg = palette.cyan },
    Special = { fg = palette.cyan },
    SpecialChar = { fg = palette.foreground },
    Tag = { fg = palette.blue },
    Debug = { fg = palette.red },
    Delimiter = { fg = palette.foreground },
    SpecialComment = { fg = palette.comments },
    Ignore = { fg = palette.white, bg = palette.background },
    Todo = { fg = palette.red, bg = palette.background },
    Error = { fg = palette.red, bg = palette.background },
    TabLine = { fg = palette.green, bg = palette.dark_background },
    TabLineSel = { fg = palette.foreground, bg = palette.background },
    TabLineFill = { fg = palette.foreground, bg = palette.background },

    ["@comment"] = { fg = palette.comments },
    ["@error"] = { fg = palette.red },
    ["@preproc"] = { fg = palette.magenta },
    ["@define"] = { fg = palette.magenta },
    ["@operator"] = { fg = palette.cyan },

    ["@punctuation.delimiter"] = { fg = palette.cyan },
    ["@punctuation.bracket"] = { fg = palette.white },
    ["@punctuation.special"] = { fg = palette.cyan },

    ["@string"] = { fg = palette.green },
    ["@string.regex"] = { fg = palette.yellow },
    ["@string.escape"] = { fg = palette.yellow },
    ["@string.special"] = { fg = palette.green },
    ["@character"] = { fg = palette.blue },
    ["@character.special"] = { fg = palette.blue },
    ["@boolean"] = { fg = palette.magenta },
    ["@number"] = { fg = palette.magenta },
    ["@float"] = { fg = palette.yellow },

    ["@function"] = { fg = palette.cyan },
    ["@function.builtin"] = { fg = palette.cyan },
    ["@function.call"] = { fg = palette.blue },
    ["@function.macro"] = { fg = palette.cyan },
    ["@method"] = { fg = palette.blue },
    ["@method.call"] = { fg = palette.blue },
    ["@constructor"] = { fg = palette.yellow },
    ["@parameter"] = { fg = palette.cyan },

    ["@keyword"] = { fg = palette.magenta },
    ["@keyword.function"] = { fg = palette.magenta },
    ["@keyword.operator"] = { fg = palette.magenta },
    ["@keyword.return"] = { fg = palette.magenta },
    ["@conditional"] = { fg = palette.magenta },
    ["@repeat"] = { fg = palette.magenta },

    ["@label"] = { fg = palette.cyan },
    ["@include"] = { fg = palette.magenta },
    ["@exception"] = { fg = palette.red },


    ["@type"] = { fg = palette.cyan },
    ["@type.builtin"] = { fg = palette.cyan },
    ["@type.definition"] = { fg = palette.cyan },
    ["@type.qualifier"] = { fg = palette.blue },
    ["@storageclass"] = { fg = palette.yellow },
    ["@attribute"] = { fg = palette.blue },
    ["@field"] = { fg = palette.cyan },
    ["@property"] = { fg = palette.red },


    ["@variable"] = { fg = palette.light_white },
    ["@variable.builtin"] = { fg = palette.yellow },
    ["@constant"] = { fg = palette.yellow },
    ["@constant.builtin"] = { fg = palette.yellow },
    ["@constant.macro"] = { fg = palette.red },
    ["@namespace"] = { fg = palette.magenta },
    ["@symbol"] = { fg = palette.magenta },


    ["@text"] = { fg = palette.foreground },
    ["@text.strong"] = { fg = palette.foreground },
    ["@text.emphasis"] = { fg = palette.cyan },
    ["@text.underline"] = { sp = palette.foreground, undercurl = true },
    ["@text.strike"] = { fg = palette.foreground },
    ["@text.title"] = { fg = palette.blue },
    ["@text.literal"] = { fg = palette.cyan },
    ["@text.uri"] = { fg = palette.cyan, undercurl = true },
    ["@text.math"] = { fg = palette.blue },
    ["@text.environment"] = { fg = palette.magenta },
    ["@text.environment.name"] = { fg = palette.blue },
    ["@text.reference"] = { fg = palette.magenta },
    ["@text.todo"] = { bg = palette.yellow },
    ["@text.note"] = { fg = palette.background, bg = palette.magenta },
    ["@text.warning"] = { fg = palette.background, bg = palette.yellow },
    ["@text.danger"] = { fg = palette.background, bg = palette.red },
    ["@text.diff.add"] = { fg = palette.green },
    ["@text.diff.delete"] = { fg = palette.red },

    ["@tag"] = { fg = palette.red },
    ["@tag.attribute"] = { fg = palette.blue },
    ["@tag.delimiter"] = { fg = palette.foreground },



    ["@property.toml"] = { fg = palette.blue },

    ["@label.json"] = { fg = palette.blue },

    ["@field.lua"] = { fg = palette.cyan },
    ["@constructor.lua"] = { fg = palette.blue },

    ["@constructor.typescript"] = { fg = palette.cyan },

    ["@keyword.export"] = { fg = palette.magenta },
    ["@constructor.tsx"] = { fg = palette.yellow },
    ["@tag.attribute.tsx"] = { fg = palette.magenta },

    ["@property.cpp"] = { fg = palette.magenta },

    ["@field.yaml"] = { fg = palette.blue },

    ["@symbol.ruby"] = { fg = palette.red },


    ["@lsp.type.boolean"] = { link = "@boolean" },
    ["@lsp.type.builtinType"] = { link = "@type.builtin" },
    ["@lsp.type.comment"] = { link = "@comment" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.escapeSequence"] = { link = "@string.escape" },
    ["@lsp.type.formatSpecifier"] = { link = "@punctuation.special" },
    ["@lsp.type.interface"] = { fg = palette.cyan or palette.cyan },
    ["@lsp.type.keyword"] = { link = "@keyword" },
    ["@lsp.type.namespace"] = { link = "@namespace" },
    ["@lsp.type.number"] = { link = "@number" },
    ["@lsp.type.function"] = { link = "@function" },
    ["@lsp.type.operator"] = { link = "@operator" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
    ["@lsp.type.string.rust"] = { link = "@string" },
    ["@lsp.type.typeAlias"] = { link = "@type.definition" },
    ["@lsp.type.unresolvedReference"] = { undercurl = true, sp = palette.yellow },
    ["@lsp.type.variable"] = {},
    ["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
    ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
    ["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.operator.injected"] = { link = "@operator" },
    ["@lsp.typemod.string.injected"] = { link = "@string" },
    ["@lsp.typemod.type.defaultLibrary"] = { fg = palette.cyan or palette.cyan },
    ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
    ["@lsp.typemod.variable.injected"] = { link = "@variable" },


    LspTroubleText = { fg = palette.foreground },
    LspTroubleCount = { fg = palette.cyan, bg = palette.foreground },
    LspTroubleNormal = { fg = palette.foreground, bg = palette.background },

    illuminatedWord = { bg = palette.foreground },
    illuminatedCurWord = { bg = palette.foreground },

    diffAdded = { fg = palette.blue },
    diffRemoved = { fg = palette.red },
    diffChanged = { fg = palette.magenta },
    diffOldFile = { fg = palette.magenta },
    diffNewFile = { fg = palette.magenta },
    diffFile = { fg = palette.white },
    diffLine = { fg = palette.red },
    diffIndexLine = { fg = palette.cyan },

    NeogitBranch = { fg = palette.cyan },
    NeogitRemote = { fg = palette.cyan },
    NeogitHunkHeader = { bg = palette.background, fg = palette.foreground },
    NeogitHunkHeaderHighlight = { bg = palette.foreground, fg = palette.white },
    NeogitDiffContextHighlight = { bg = palette.background, fg = palette.foreground },
    NeogitDiffDeleteHighlight = { fg = palette.red, bg = palette.red },
    NeogitDiffAddHighlight = { fg = palette.blue, bg = palette.blue },

    GitGutterAdd = { fg = palette.blue },
    GitGutterChange = { fg = palette.magenta },
    GitGutterDelete = { fg = palette.red },

    GitSignsAdd = { fg = palette.blue },
    GitSignsChange = { fg = palette.magenta },
    GitSignsDelete = { fg = palette.red },

    TelescopeBorder = { fg = palette.blue, bg = palette.background },
    TelescopeNormal = { fg = palette.foreground, bg = palette.background },
    TelescopeSelection = { fg = palette.foregruond, bg = palette.cursorline },

    IndentBlanklineChar = { fg = palette.black, bg = "NONE" },
    IndentBlanklineContextChar = { fg = palette.comments, bg = "NONE" },
    IndentBlanklineContextStart = { sp = palette.comments, underline = true, bg = "NONE" },

    NvimTreeNormal = { fg = palette.foreground, bg = palette.background },
    NvimTreeNormalNC = { fg = palette.foreground, bg = palette.background },
    NvimTreeRootFolder = { fg = palette.red },
    NvimTreeGitDirty = { fg = palette.magenta },
    NvimTreeGitNew = { fg = palette.blue },
    NvimTreeGitDeleted = { fg = palette.red },
    NvimTreeSpecialFile = { fg = palette.cyan },
    NvimTreeIndentMarker = { fg = palette.black },
    NvimTreeImageFile = { fg = palette.foreground },
    NvimTreeSymlink = { fg = palette.white },
    NvimTreeFolderIcon = { fg = palette.blue },
    NvimTreeFolderName = { fg = palette.foreground },
    NvimTreeOpenedFolderName = { fg = palette.blue },
    NvimTreeEmptyFolderName = { fg = palette.green },
    NvimTreeStatusLineNC = { bg = palette.background, fg = palette.background },

    LspSagaCodeActionTitle = { fg = palette.blue },
    LspSagaCodeActionBorder = { fg = palette.light_background },
    LspSagaCodeActionTrunCateLine = { fg = palette.light_background },
    LspSagaCodeActionContent = { fg = palette.foreground },

    LspSagaLspFinderBorder = { fg = palette.light_background },
    LspSagaAutoPreview = { fg = palette.light_background },
    LspSagaFinderSelection = { fg = palette.cursorline },
    TargetFileName = { fg = palette.blue },
    FinderParam = { fg = palette.cyan },
    FinderVirtText = { fg = palette.magenta },
    DefinitionsIcon = { fg = palette.blue },
    Definitions = { fg = palette.blue },
    DefinitionCount = { fg = palette.coolor4 },
    ReferencesIcon = { fg = palette.yellow },
    References = { fg = palette.green },
    ReferencesCount = { fg = palette.green },
    ImplementsIcon = { fg = palette.magenta },
    Implements = { fg = palette.magenta },
    ImplementsCount = { fg = palette.magenta },

    FinderSpinnerBorder = { fg = palette.light_background },
    FinderSpinnerTitle = { fg = palette.blue },
    FinderSpinner = { fg = palette.blue },
    FinderPreviewSearch = { fg = palette.green },

    DefinitionBorder = { fg = palette.light_background },
    DefinitionArrow = { fg = palette.blue },
    DefinitionSearch = { fg = palette.green },
    DefinitionFile = { fg = palette.blue },

    LspSagaHoverBorder = { fg = palette.light_background },
    LspSagaHoverTrunCateLine = { fg = palette.light_background },

    LspSagaRenameBorder = { fg = palette.light_background },
    LspSagaRenameMatch = { fg = palette.black },

    LspSagaDiagnosticSource = { link = "Comment" },
    LspSagaDiagnosticError = { link = "DiagnosticError" },
    LspSagaDiagnosticWarn = { link = "DiagnosticWarn" },
    LspSagaDiagnosticInfo = { link = "DiagnosticInfo" },
    LspSagaDiagnosticHint = { link = "DiagnosticHint" },
    LspSagaErrorTrunCateLine = { link = "DiagnosticError" },
    LspSagaWarnTrunCateLine = { link = "DiagnosticWarn" },
    LspSagaInfoTrunCateLine = { link = "DiagnosticInfo" },
    LspSagaHintTrunCateLine = { link = "DiagnosticHint" },
    LspSagaDiagnosticBorder = { fg = palette.light_background },
    LspSagaDiagnosticHeader = { fg = palette.blue },
    DiagnosticQuickFix = { fg = palette.blue },
    DiagnosticMap = { fg = palette.magenta },
    DiagnosticLineCol = { fg = palette.black },
    LspSagaDiagnosticTruncateLine = { link = "LspSagaDiagnosticBorder" },
    ColInLineDiagnostic = { link = "Comment" },

    LspSagaSignatureHelpBorder = { fg = palette.light_background },
    LspSagaShTrunCateLine = { link = "LspSagaSignatureHelpBorder" },

    LspSagaLightBulb = { link = "DiagnosticSignHint" },

    SagaShadow = { fg = "black" },

    LspSagaBorderTitle = { link = "String" },

    LSOutlinePreviewBorder = { fg = palette.light_background },
    OutlineIndentEvn = { fg = palette.magenta },
    OutlineIndentOdd = { fg = palette.yellow },
    OutlineFoldPrefix = { fg = palette.blue },
    OutlineDetail = { fg = palette.black },

    LspFloatWinNormal = { link = "Normal" },

    healthError = { fg = palette.red },
    healthSuccess = { fg = palette.blue },
    healthWarning = { fg = palette.magenta },

    BufferLineIndicatorSelected = { fg = palette.blue },
    BufferLineFill = { fg = palette.foreground, bg = palette.dark_background },
    BufferLineGroupLabel = { fg = palette.dark_background, bg = palette.blue },
    BufferLineGroupSeparator = { fg = palette.blue, bg = palette.dark_background },

    BufferCurrentSign = { fg = palette.blue },
    BufferInactiveSign = { fg = palette.background, bg = palette.background },
    BufferOffset = { fg = palette.background, bg = palette.background },
    BufferTabpageFill = { fg = palette.background, bg = palette.background },

    DiagnosticError = { fg = palette.red },
    DiagnosticWarn = { fg = palette.yellow },
    DiagnosticInfo = { fg = palette.blue },
    DiagnosticHint = { fg = palette.cyan },
    DiagnosticVirtualTextError = { bg = util.darken(palette.red, 0.1), fg = palette.red },
    DiagnosticVirtualTextWarn = { bg = util.darken(palette.yellow, 0.1), fg = palette.yellow },
    DiagnosticVirtualTextInfo = { bg = util.darken(palette.blue, 0.1), fg = palette.blue },
    DiagnosticVirtualTextHint = { bg = util.darken(palette.cyan, 0.15), fg = palette.cyan },

    DiagnosticUnderlineError = { undercurl = true, sp = palette.red },
    DiagnosticUnderlineWarn = { undercurl = true, sp = palette.yellow },
    DiagnosticUnderlineInfo = { undercurl = true, sp = palette.blue },
    DiagnosticUnderlineHint = { undercurl = true, sp = palette.cyan },
  }
end

return theming
