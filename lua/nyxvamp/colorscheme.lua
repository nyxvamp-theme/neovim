local config = require 'nyxvamp.config'

local colorscheme = {
  standardWhite = '#ffffff',
  standardBlack = '#1e1e1e',
}

-- Base colors for different variants
local variants = {
  radiance = {
    -- Light theme (radiance)
    editorBackground = '#F7F7FF',
    sidebarBackground = '#E8E8F0',
    popupBackground = '#E8E8F0',
    floatingWindowBackground = '#E8E8F0',
    menuOptionBackground = '#E8D5FF',
    
    mainText = '#1E1E2E',
    emphasisText = '#9655FF',
    commandText = '#1E1E2E',
    inactiveText = '#5A5570',
    disabledText = '#5A5570',
    lineNumberText = '#5A5570',
    selectedText = '#1E1E2E',
    inactiveSelectionText = '#5A5570',
    
    windowBorder = '#E8E8F0',
    focusedBorder = '#9655FF',
    emphasizedBorder = '#E8D5FF',
    
    syntaxFunction = '#005F87',
    syntaxError = '#9F1239',
    syntaxKeyword = '#9655FF',
    errorText = '#E78284',
    warningText = '#E5C890',
    linkText = '#005F87',
    commentText = '#5A5570',
    stringText = '#B8860B',
    successText = '#A6DA95',
    warningEmphasis = '#E5C890',
    specialKeyword = '#9655FF',
    syntaxOperator = '#4A4560',
    foregroundEmphasis = '#1E1E2E',
    terminalGray = '#5A5570',
    
    -- Additional nyxvamp-specific colors
    cursorFg = '#F7F7FF',
    cursorBg = '#9655FF',
    cursorLine = '#E8E8F0',
    selection = '#E8D5FF',
    stringSpecial = '#9F1239',
    constant = '#9F1239',
    constantBuiltin = '#9F1239',
    number = '#C2410C',
    boolean = '#9F1239',
    functionBuiltin = '#005F87',
    keywordControl = '#9655FF',
    variable = '#1E1E2E',
    variableBuiltin = '#9F1239',
    type = '#6B46C1',
    typeBuiltin = '#6B46C1',
    attribute = '#9655FF',
    namespace = '#9655FF',
    punctuation = '#1E1E2E',
    symbol = '#9F1239',
    matchParen = '#9655FF',
    info = '#8CAAEE',
    hint = '#8BD5CA',
    diffAdd = '#A6DA95',
    diffDelete = '#E78284',
    diffChange = '#E5C890',
  },
  
  veil = {
    -- Dark theme (veil)
    editorBackground = '#1E1E2E',
    sidebarBackground = '#302D41',
    popupBackground = '#1E1E2E',
    floatingWindowBackground = '#1E1E2E',
    menuOptionBackground = '#494D64',
    
    mainText = '#D9E0EE',
    emphasisText = '#F5C2E7',
    commandText = '#D9E0EE',
    inactiveText = '#6E6A86',
    disabledText = '#6E6A86',
    lineNumberText = '#6E6A86',
    selectedText = '#D9E0EE',
    inactiveSelectionText = '#6E6A86',
    
    windowBorder = '#2E2E3E',
    focusedBorder = '#F5C2E7',
    emphasizedBorder = '#494D64',
    
    syntaxFunction = '#96CDFB',
    syntaxError = '#F28FAD',
    syntaxKeyword = '#F5C2E7',
    errorText = '#E78284',
    warningText = '#E5C890',
    linkText = '#96CDFB',
    commentText = '#6E6A86',
    stringText = '#ABE9B3',
    successText = '#A6DA95',
    warningEmphasis = '#E5C890',
    specialKeyword = '#F5C2E7',
    syntaxOperator = '#D9E0EE',
    foregroundEmphasis = '#D9E0EE',
    terminalGray = '#6E6A86',
    
    -- Additional nyxvamp-specific colors
    cursorFg = '#1E1E2E',
    cursorBg = '#F5C2E7',
    cursorLine = '#2E2E3E',
    selection = '#494D64',
    stringSpecial = '#F28FAD',
    constant = '#F28FAD',
    constantBuiltin = '#F28FAD',
    number = '#F8BD96',
    boolean = '#F28FAD',
    functionBuiltin = '#96CDFB',
    keywordControl = '#F5C2E7',
    variable = '#D9E0EE',
    variableBuiltin = '#F28FAD',
    type = '#C9CBFF',
    typeBuiltin = '#C9CBFF',
    attribute = '#F5C2E7',
    namespace = '#DDB6F2',
    punctuation = '#D9E0EE',
    symbol = '#F28FAD',
    matchParen = '#F28FAD',
    info = '#8CAAEE',
    hint = '#8BD5CA',
    diffAdd = '#A6DA95',
    diffDelete = '#E78284',
    diffChange = '#E5C890',
  },
  
  obsidian = {
    -- Very dark theme (obsidian)
    editorBackground = '#000A0F',
    sidebarBackground = '#0E0E10',
    popupBackground = '#0E0E10',
    floatingWindowBackground = '#0E0E10',
    menuOptionBackground = '#2E2E30',
    
    mainText = '#C0C0CE',
    emphasisText = '#F28FAD',
    commandText = '#C0C0CE',
    inactiveText = '#5E5A76',
    disabledText = '#5E5A76',
    lineNumberText = '#5E5A76',
    selectedText = '#C0C0CE',
    inactiveSelectionText = '#5E5A76',
    
    windowBorder = '#1E1E20',
    focusedBorder = '#F28FAD',
    emphasizedBorder = '#2E2E30',
    
    syntaxFunction = '#7FAFD7',
    syntaxError = '#F28FAD',
    syntaxKeyword = '#F5C2E7',
    errorText = '#D78284',
    warningText = '#D5B880',
    linkText = '#7FAFD7',
    commentText = '#5E5A76',
    stringText = '#8FBF8F',
    successText = '#86BA75',
    warningEmphasis = '#D5B880',
    specialKeyword = '#F5C2E7',
    syntaxOperator = '#C0C0CE',
    foregroundEmphasis = '#C0C0CE',
    terminalGray = '#5E5A76',
    
    -- Additional nyxvamp-specific colors
    cursorFg = '#0E0E10',
    cursorBg = '#F28FAD',
    cursorLine = '#1E1E20',
    selection = '#2E2E30',
    stringSpecial = '#F28FAD',
    constant = '#F28FAD',
    constantBuiltin = '#F28FAD',
    number = '#D8A080',
    boolean = '#F28FAD',
    functionBuiltin = '#7FAFD7',
    keywordControl = '#F5C2E7',
    variable = '#C0C0CE',
    variableBuiltin = '#F28FAD',
    type = '#A0A0D0',
    typeBuiltin = '#A0A0D0',
    attribute = '#F5C2E7',
    namespace = '#A090C0',
    punctuation = '#C0C0CE',
    symbol = '#F28FAD',
    matchParen = '#F28FAD',
    info = '#7A9CCC',
    hint = '#7BB5A8',
    diffAdd = '#86BA75',
    diffDelete = '#D78284',
    diffChange = '#D5B880',
  }
}

-- Select the appropriate variant based on config
local variant_name = config.variant or 'veil'
local selected_variant = variants[variant_name] or variants.veil

-- Apply transparency if enabled
if config.transparent then
  selected_variant.editorBackground = 'none'
end

-- Copy all colors to the main colorscheme table
for key, value in pairs(selected_variant) do
  colorscheme[key] = value
end

return colorscheme
