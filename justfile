# Nyxvamp Theme Development Commands

# Show available commands
default:
    @just --list

# Development & Testing
# =====================

# Launch Neovim with full nyxvamp theme setup
test:
    nix run .#

# Launch minimal Neovim with basic theme
minimal:
    nix run .#minimal

# Enter development shell
dev:
    nix develop

# Code Quality
# ============

# Format all Lua code with stylua
fmt:
    nix develop -c stylua .

# Lint Lua code with luacheck
lint:
    nix develop -c luacheck .

# Format and lint code
check: fmt lint

# Building & Validation
# =====================

# Build the nyxvamp plugin
build:
    nix build .#nyxvamp-plugin

# Build custom Neovim with theme
build-nvim:
    nix build .#nyxvamp-neovim

# Run all flake checks
validate:
    nix flake check

# Test all theme variants
test-variants:
    @echo "Testing Veil (dark) variant..."
    @nix run .# -- -c "lua require('nyxvamp').setup({variant='veil'}); require('nyxvamp').colorscheme(); vim.cmd('sleep 2'); vim.cmd('quit')"
    @echo "Testing Obsidian (very dark) variant..."
    @nix run .# -- -c "lua require('nyxvamp').setup({variant='obsidian'}); require('nyxvamp').colorscheme(); vim.cmd('sleep 2'); vim.cmd('quit')"
    @echo "Testing Radiance (light) variant..."
    @nix run .# -- -c "lua require('nyxvamp').setup({variant='radiance'}); require('nyxvamp').colorscheme(); vim.cmd('sleep 2'); vim.cmd('quit')"
    @echo "All variants tested successfully!"

# Update flake inputs
update:
    nix flake update

# Development Workflow
# ===================

# Quick development cycle: format, lint, build, test
dev-cycle: fmt lint build test

# Release preparation: full check and validation
release-prep: check validate build build-nvim test-variants

# Theme Development Helpers
# =========================

# Open a test file with syntax highlighting to preview theme
preview FILE="lua/nyxvamp/colorscheme.lua":
    nix run .# -- {{FILE}}
