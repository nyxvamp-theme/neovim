local bufferline = require 'nyxvamp.integrations.bufferline'
local cmp = require 'nyxvamp.integrations.cmp'
local colorscheme = require 'nyxvamp.colorscheme'
local config = require 'nyxvamp.config'
local utils = require 'nyxvamp.utils'
local theme = {}

local function set_terminal_colors()
  vim.g.terminal_color_0 = colorscheme.editorBackground
  vim.g.terminal_color_1 = colorscheme.syntaxError
  vim.g.terminal_color_2 = colorscheme.successText
  vim.g.terminal_color_3 = colorscheme.warningEmphasis
  vim.g.terminal_color_4 = colorscheme.syntaxFunction
  vim.g.terminal_color_5 = colorscheme.syntaxKeyword
  vim.g.terminal_color_6 = colorscheme.linkText
  vim.g.terminal_color_7 = colorscheme.mainText
  vim.g.terminal_color_8 = colorscheme.inactiveText
  vim.g.terminal_color_9 = colorscheme.errorText
  vim.g.terminal_color_10 = colorscheme.stringText
  vim.g.terminal_color_11 = colorscheme.warningText
  vim.g.terminal_color_12 = colorscheme.syntaxOperator
  vim.g.terminal_color_13 = colorscheme.syntaxError
  vim.g.terminal_color_14 = colorscheme.stringText
  vim.g.terminal_color_15 = colorscheme.commentText
  vim.g.terminal_color_background = colorscheme.editorBackground
  vim.g.terminal_color_foreground = colorscheme.mainText
end

local function set_groups()
  local bg = config.transparent and 'NONE' or colorscheme.editorBackground

  local groups = {
    -- Base UI elements
    Normal = { fg = colorscheme.mainText, bg = bg },
    LineNr = { fg = colorscheme.lineNumberText },
    CursorLineNr = { fg = colorscheme.selectedText, bold = true },
    ColorColumn = { bg = colorscheme.selection },
    Conceal = {},
    Cursor = { fg = colorscheme.cursorFg, bg = colorscheme.cursorBg },
    lCursor = { link = 'Cursor' },
    CursorIM = { link = 'Cursor' },
    CursorLine = { bg = colorscheme.cursorLine },
    CursorColumn = { link = 'CursorLine' },
    Directory = { fg = colorscheme.syntaxFunction, bold = true },
    DiffAdd = { fg = colorscheme.diffAdd },
    DiffChange = { fg = colorscheme.diffChange },
    DiffDelete = { fg = colorscheme.diffDelete },
    DiffText = { fg = colorscheme.diffChange, bold = true },
    EndOfBuffer = { fg = colorscheme.commentText },
    TermCursor = { link = 'Cursor' },
    TermCursorNC = { link = 'Cursor' },
    ErrorMsg = { fg = colorscheme.errorText },
    VertSplit = { fg = colorscheme.windowBorder, bg = bg },
    Winseparator = { link = 'VertSplit' },
    SignColumn = { link = 'Normal' },
    Folded = { fg = colorscheme.commentText, bg = colorscheme.popupBackground },
    FoldColumn = { link = 'SignColumn' },
    IncSearch = { fg = bg, bg = colorscheme.emphasisText },
    Substitute = { link = 'IncSearch' },
    MatchParen = { fg = colorscheme.matchParen, bg = bg, bold = true },
    ModeMsg = { link = 'Normal' },
    MsgArea = { link = 'Normal' },
    MoreMsg = { fg = colorscheme.info },
    NonText = { fg = colorscheme.commentText },
    NormalFloat = {
      fg = colorscheme.mainText,
      bg = colorscheme.floatingWindowBackground,
    },
    NormalNC = { link = 'Normal' },
    Pmenu = { fg = colorscheme.mainText, bg = colorscheme.popupBackground },
    PmenuSel = { fg = bg, bg = colorscheme.emphasisText },
    PmenuSbar = { bg = colorscheme.selection },
    PmenuThumb = { bg = colorscheme.commentText },
    Question = { fg = colorscheme.info },
    QuickFixLine = { fg = colorscheme.emphasisText },
    SpecialKey = { fg = colorscheme.syntaxOperator },
    StatusLine = {
      fg = colorscheme.mainText,
      bg = colorscheme.sidebarBackground,
    },
    StatusLineNC = {
      fg = colorscheme.inactiveText,
      bg = colorscheme.sidebarBackground,
    },
    TabLine = {
      fg = colorscheme.inactiveText,
      bg = colorscheme.sidebarBackground,
    },
    TabLineFill = { link = 'TabLine' },
    TabLineSel = { fg = colorscheme.emphasisText, bg = bg },
    Search = { fg = bg, bg = colorscheme.warningText },
    SpellBad = { undercurl = true, sp = colorscheme.errorText },
    SpellCap = { undercurl = true, sp = colorscheme.warningText },
    SpellLocal = { undercurl = true, sp = colorscheme.info },
    SpellRare = { undercurl = true, sp = colorscheme.hint },
    Title = { fg = colorscheme.emphasisText, bold = true },
    Visual = { bg = colorscheme.selection },
    VisualNOS = { link = 'Visual' },
    WarningMsg = { fg = colorscheme.warningText },
    Whitespace = { fg = colorscheme.commentText },
    WildMenu = { fg = bg, bg = colorscheme.emphasisText },

    -- Syntax highlighting using nyxvamp colors
    Comment = {
      fg = colorscheme.commentText,
      italic = config.italics.comments or false,
    },

    Constant = { fg = colorscheme.constant },
    String = {
      fg = colorscheme.stringText,
      italic = config.italics.strings or false,
    },
    Character = { fg = colorscheme.stringText },
    Number = { fg = colorscheme.number },
    Boolean = { fg = colorscheme.boolean },
    Float = { link = 'Number' },

    Identifier = { fg = colorscheme.variable },
    Function = {
      fg = colorscheme.syntaxFunction,
      bold = true,
      italic = config.italics.functions or false,
    },
    Method = { link = 'Function' },
    Property = { fg = colorscheme.variable },
    Field = { link = 'Property' },
    Parameter = { fg = colorscheme.variable },

    Statement = { fg = colorscheme.syntaxKeyword, bold = true },
    Conditional = { fg = colorscheme.keywordControl, bold = true },
    Repeat = { fg = colorscheme.keywordControl, bold = true },
    Label = { fg = colorscheme.syntaxKeyword },
    Operator = { fg = colorscheme.syntaxOperator },
    Keyword = {
      fg = colorscheme.syntaxKeyword,
      bold = true,
      italic = config.italics.keywords or false,
    },
    Exception = { fg = colorscheme.syntaxKeyword, bold = true },

    PreProc = { fg = colorscheme.syntaxKeyword },
    Include = { fg = colorscheme.syntaxKeyword },
    Define = { fg = colorscheme.syntaxKeyword },
    Macro = { fg = colorscheme.syntaxKeyword },
    PreCondit = { fg = colorscheme.syntaxKeyword },

    Type = { fg = colorscheme.type, italic = config.italics.variables or false },
    StorageClass = { fg = colorscheme.syntaxKeyword },
    Structure = { fg = colorscheme.type },
    Typedef = { fg = colorscheme.type },

    Special = { fg = colorscheme.stringSpecial },
    SpecialChar = { fg = colorscheme.stringSpecial },
    Tag = { fg = colorscheme.syntaxKeyword },
    Delimiter = { fg = colorscheme.punctuation },
    SpecialComment = { fg = colorscheme.commentText, bold = true },
    Debug = { fg = colorscheme.errorText },

    Underlined = { underline = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Ignore = { fg = colorscheme.commentText },
    Error = { fg = colorscheme.errorText },
    Todo = { fg = colorscheme.warningText, bold = true },

    -- LSP Diagnostics
    DiagnosticError = { fg = colorscheme.errorText },
    DiagnosticWarn = { fg = colorscheme.warningText },
    DiagnosticInfo = { fg = colorscheme.info },
    DiagnosticHint = { fg = colorscheme.hint },
    DiagnosticVirtualTextError = { fg = colorscheme.errorText },
    DiagnosticVirtualTextWarn = { fg = colorscheme.warningText },
    DiagnosticVirtualTextInfo = { fg = colorscheme.info },
    DiagnosticVirtualTextHint = { fg = colorscheme.hint },
    DiagnosticUnderlineError = { undercurl = true, sp = colorscheme.errorText },
    DiagnosticUnderlineWarn = { undercurl = true, sp = colorscheme.warningText },
    DiagnosticUnderlineInfo = { undercurl = true, sp = colorscheme.info },
    DiagnosticUnderlineHint = { undercurl = true, sp = colorscheme.hint },

    -- Treesitter
    ['@text'] = { fg = colorscheme.mainText },
    ['@text.literal'] = { fg = colorscheme.stringText },
    ['@text.strong'] = { bold = true },
    ['@text.italic'] = { italic = true },
    ['@text.title'] = { fg = colorscheme.emphasisText, bold = true },
    ['@text.uri'] = { fg = colorscheme.linkText, underline = true },
    ['@text.underline'] = { underline = true },
    ['@text.todo'] = { fg = colorscheme.warningText, bold = true },

    ['@comment'] = { link = 'Comment' },
    ['@punctuation'] = { fg = colorscheme.punctuation },
    ['@punctuation.bracket'] = { fg = colorscheme.punctuation },
    ['@punctuation.delimiter'] = { fg = colorscheme.punctuation },
    ['@punctuation.special'] = { fg = colorscheme.stringSpecial },

    ['@constant'] = { fg = colorscheme.constant },
    ['@constant.builtin'] = { fg = colorscheme.constantBuiltin },
    ['@string'] = {
      fg = colorscheme.stringText,
      italic = config.italics.strings or false,
    },
    ['@string.escape'] = { fg = colorscheme.stringSpecial },
    ['@string.special'] = { fg = colorscheme.stringSpecial },
    ['@character'] = { fg = colorscheme.stringText },
    ['@number'] = { fg = colorscheme.number },
    ['@boolean'] = { fg = colorscheme.boolean },
    ['@float'] = { fg = colorscheme.number },

    ['@function'] = {
      fg = colorscheme.syntaxFunction,
      bold = true,
      italic = config.italics.functions or false,
    },
    ['@function.call'] = { fg = colorscheme.syntaxFunction, bold = true },
    ['@function.builtin'] = { fg = colorscheme.functionBuiltin, bold = true },
    ['@parameter'] = {
      fg = colorscheme.variable,
      italic = config.italics.variables or false,
    },
    ['@method'] = { fg = colorscheme.syntaxFunction, bold = true },
    ['@field'] = { fg = colorscheme.variable },
    ['@property'] = { fg = colorscheme.variable },
    ['@constructor'] = { fg = colorscheme.type },

    ['@conditional'] = { fg = colorscheme.keywordControl, bold = true },
    ['@repeat'] = { fg = colorscheme.keywordControl, bold = true },
    ['@label'] = { fg = colorscheme.syntaxKeyword },
    ['@operator'] = { fg = colorscheme.syntaxOperator },
    ['@keyword'] = {
      fg = colorscheme.syntaxKeyword,
      bold = true,
      italic = config.italics.keywords or false,
    },
    ['@exception'] = { fg = colorscheme.syntaxKeyword, bold = true },

    ['@variable'] = {
      fg = colorscheme.variable,
      italic = config.italics.variables or false,
    },
    ['@variable.builtin'] = { fg = colorscheme.variableBuiltin, italic = true },
    ['@variable.parameter'] = {
      fg = colorscheme.variable,
      italic = config.italics.variables or false,
    },

    ['@type'] = { fg = colorscheme.type, italic = true },
    ['@type.builtin'] = { fg = colorscheme.typeBuiltin, italic = true },
    ['@type.definition'] = { fg = colorscheme.type },

    ['@namespace'] = { fg = colorscheme.namespace },
    ['@symbol'] = { fg = colorscheme.symbol, italic = true },
    ['@attribute'] = { fg = colorscheme.attribute },

    ['@tag'] = { fg = colorscheme.syntaxKeyword },
    ['@tag.attribute'] = { fg = colorscheme.attribute },
    ['@tag.delimiter'] = { fg = colorscheme.punctuation },

    -- LSP semantic tokens
    ['@lsp.type.namespace'] = { fg = colorscheme.namespace },
    ['@lsp.type.type'] = { fg = colorscheme.type },
    ['@lsp.type.class'] = { fg = colorscheme.type },
    ['@lsp.type.enum'] = { fg = colorscheme.type },
    ['@lsp.type.interface'] = { fg = colorscheme.type },
    ['@lsp.type.struct'] = { fg = colorscheme.type },
    ['@lsp.type.parameter'] = { fg = colorscheme.variable },
    ['@lsp.type.property'] = { fg = colorscheme.variable },
    ['@lsp.type.enumMember'] = { fg = colorscheme.constant },
    ['@lsp.type.function'] = { fg = colorscheme.syntaxFunction },
    ['@lsp.type.method'] = { fg = colorscheme.syntaxFunction },
    ['@lsp.type.macro'] = { fg = colorscheme.syntaxKeyword },
    ['@lsp.type.decorator'] = { fg = colorscheme.attribute },
  }

  -- integrations
  groups = vim.tbl_extend('force', groups, cmp.highlights())

  -- overrides
  groups = vim.tbl_extend(
    'force',
    groups,
    type(config.overrides) == 'function' and config.overrides()
      or config.overrides
  )

  for group, parameters in pairs(groups) do
    vim.api.nvim_set_hl(0, group, parameters)
  end
end

function theme.setup(values)
  setmetatable(
    config,
    { __index = vim.tbl_extend('force', config.defaults, values) }
  )

  -- Reload colorscheme colors for the new variant
  colorscheme.load_variant()

  theme.bufferline = { highlights = {} }
  theme.bufferline.highlights = bufferline.highlights(config)
end

function theme.load()
  if vim.version().minor < 8 then
    vim.notify(
      'Neovim 0.8+ is required for nyxvamp colorscheme',
      vim.log.levels.ERROR,
      { title = 'Nyxvamp Theme' }
    )
    return
  end

  vim.api.nvim_command 'hi clear'
  if vim.fn.exists 'syntax_on' then
    vim.api.nvim_command 'syntax reset'
  end

  vim.g.VM_theme_set_by_colorscheme = true
  vim.o.termguicolors = true

  -- Set the correct colorscheme name based on variant
  local variant_name = config.variant or 'veil'
  vim.g.colors_name = 'nyxvamp-' .. variant_name

  colorscheme.load_variant()
  set_terminal_colors()

  -- Apply basic syntax highlighting groups
  local syntax_groups = {
    Comment = { fg = colorscheme.commentText, italic = true },
    Constant = { fg = colorscheme.constant },
    String = { fg = colorscheme.stringText },
    Character = { fg = colorscheme.stringText },
    Number = { fg = colorscheme.number },
    Boolean = { fg = colorscheme.boolean },
    Float = { fg = colorscheme.number },

    Identifier = { fg = colorscheme.variable },
    Function = { fg = colorscheme.syntaxFunction, bold = true },

    Statement = { fg = colorscheme.syntaxKeyword, bold = true },
    Conditional = { fg = colorscheme.keywordControl, bold = true },
    Repeat = { fg = colorscheme.keywordControl, bold = true },
    Label = { fg = colorscheme.syntaxKeyword },
    Operator = { fg = colorscheme.syntaxOperator },
    Keyword = { fg = colorscheme.syntaxKeyword, bold = true },
    Exception = { fg = colorscheme.syntaxKeyword, bold = true },

    PreProc = { fg = colorscheme.syntaxKeyword },
    Include = { fg = colorscheme.syntaxKeyword },
    Define = { fg = colorscheme.syntaxKeyword },
    Macro = { fg = colorscheme.syntaxKeyword },
    PreCondit = { fg = colorscheme.syntaxKeyword },

    Type = { fg = colorscheme.type },
    StorageClass = { fg = colorscheme.syntaxKeyword },
    Structure = { fg = colorscheme.type },
    Typedef = { fg = colorscheme.type },

    Special = { fg = colorscheme.stringSpecial },
    SpecialChar = { fg = colorscheme.stringSpecial },
    Tag = { fg = colorscheme.syntaxKeyword, bold = true },
    Delimiter = { fg = colorscheme.punctuation },
    SpecialComment = { fg = colorscheme.commentText, bold = true },
    Debug = { fg = colorscheme.errorText },

    Underlined = { underline = true },
    Bold = { bold = true },
    Italic = { italic = true },

    Error = { fg = colorscheme.errorText },
    Todo = { fg = colorscheme.warningText, bold = true },
  }

  for group, parameters in pairs(syntax_groups) do
    vim.api.nvim_set_hl(0, group, parameters)
  end

  set_groups()
end

function theme.colorscheme()
  theme.load()
end

return theme
