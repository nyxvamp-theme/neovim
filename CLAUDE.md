# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the **Nyxvamp** colorscheme for Neovim - a port of the popular Helix editor theme variants. Nyxvamp offers three distinct variants:
- **Radiance**: Light theme with deep navy text on off-white background
- **Veil**: Dark theme with lavender text on dark purple background  
- **Obsidian**: Very dark theme with muted colors on near-black background

## Development Environment Setup

This project uses Nix flake for development environment management. The flake provides:
- `stylua` for Lua code formatting
- `lua-language-server` for LSP support

The project expects `direnv` with `.envrc` file to set up `XDG_CONFIG_HOME` and `NVIM_APPNAME` environment variables for isolated Neovim configuration testing.

## Common Commands

### Code Formatting
```bash
stylua .
```

### Testing the Colorscheme
The `init.lua` file in the project root contains a complete Neovim configuration for testing the colorscheme. Use:
```bash
nvim -u init.lua
```

### Development Workflow
1. The colorscheme is loaded automatically via `init.lua:333-345`
2. Test with different variants by modifying the `variant` option in `theme.setup()`
3. Use `:so` keybinding (space+space) to reload configuration
4. Test different variants with `:colorscheme nyxvamp-radiance`, `:colorscheme nyxvamp-veil`, or `:colorscheme nyxvamp-obsidian`

## Architecture Overview

### Core Structure
- **Main Entry Point**: `lua/nyxvamp/init.lua` - Main theme module with setup and colorscheme functions
- **Configuration**: `lua/nyxvamp/config.lua` - Default configuration values and variant selection
- **Color Definitions**: `lua/nyxvamp/colorscheme.lua` - All three theme variant color palettes
- **Utilities**: `lua/nyxvamp/utils.lua` - Color mixing and shading functions
- **Colorscheme Files**: 
  - `colors/nyxvamp.lua` - Main colorscheme (uses default variant)
  - `colors/nyxvamp-radiance.lua` - Light variant
  - `colors/nyxvamp-veil.lua` - Dark variant  
  - `colors/nyxvamp-obsidian.lua` - Very dark variant

### Plugin Integrations
- **Lualine**: `lua/lualine/themes/nyxvamp.lua` - Status line theme
- **Bufferline**: `lua/nyxvamp/integrations/bufferline.lua` - Buffer line integration
- **Completion**: `lua/nyxvamp/integrations/cmp.lua` - Completion highlighting

### Syntax Highlighting
- **Treesitter Queries**: `after/queries/{elixir,javascript,typescript}/highlights.scm` - Language-specific highlighting overrides

### Theme Configuration Options
- `variant`: 'radiance' (light), 'veil' (dark), or 'obsidian' (very dark)
- `transparent`: Boolean for transparent background
- `italics`: Object controlling italic rendering for comments, keywords, functions, strings, variables
- `overrides`: Custom highlight group overrides (function or table)

### Color System
The colorscheme uses a variant-based system:
1. **Variant Colors**: Three complete color palettes defined in `colorscheme.lua`
2. **Dynamic Selection**: Variant chosen at runtime based on config
3. **Semantic Mapping**: Colors mapped to semantic roles (functions, keywords, etc.)
4. **Helix Compatibility**: Colors closely match the original Helix theme definitions

### Nyxvamp Color Variants

#### Radiance (Light)
- Background: `#F7F7FF` (off-white)
- Foreground: `#1E1E2E` (deep navy)
- Accent: `#9655FF` (deep purple)
- Optimized for light environments with high contrast

#### Veil (Dark) 
- Background: `#1E1E2E` (dark purple)
- Foreground: `#D9E0EE` (light lavender)
- Accent: `#F5C2E7` (soft pink)
- Balanced dark theme with purple undertones

#### Obsidian (Very Dark)
- Background: `#000A0F` (near black)
- Foreground: `#C0C0CE` (muted gray)
- Accent: `#F28FAD` (pink)
- Very dark theme for minimal distraction

### Key Functions
- `theme.setup(config)`: Configure theme options and variant
- `theme.colorscheme()`: Apply colorscheme to Neovim
- `utils.mix(fg, bg, alpha)`: Blend two colors
- `utils.shade(color, value, base)`: Darken/lighten color based on background mode

## Development Notes

- The colorscheme supports all three variants through the `variant` configuration option
- Transparent mode sets background to 'NONE' instead of solid colors
- Integration modules return highlight tables that get merged into the main theme
- The theme requires Neovim 0.8+ for proper highlight API support
- Colors are faithfully ported from the original Helix nyxvamp theme variants
- Functions and keywords use bold modifiers to match Helix styling
- Semantic highlighting is fully supported for LSP-aware editors