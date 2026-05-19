# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Structure

Personal dotfiles for a CachyOS (Arch-based) Linux system running the Hyprland Wayland compositor. Each top-level directory is a **GNU Stow package** — the subdirectory tree mirrors the target filesystem from `$HOME`.

**Remote:** https://github.com/maraal/dotfiles — main branch is `main`.

### Deployment

```bash
# Deploy a single package (run from dotfiles root)
stow <package>          # e.g., stow nvim

# Remove a package
stow -D <package>

# Restow (re-link) after structural changes
stow -R <package>
```

`vim.opt.backupcopy = "yes"` is set in Neovim to preserve symlinks when files are written.

## Hyprland Config (`hyprland/`)

Hyprland is configured in **Lua** via the `hyprland-lua` integration. The `hl` global is the API entry point, with stubs at `/usr/share/hypr/stubs/` (referenced in `.luarc.json`).

- `hyprland.lua` — entry point, loads modules
- `modules/env.lua` — Nvidia/Wayland environment variables
- `modules/autostart.lua` — services started on `hyprland.start` event
- `modules/keybinds.lua` — keybindings using `hl.bind()`

Services started at login: `hyprpaper`, `waybar`, `cliphist`, `mako`, `hypridle`.

## Neovim Config (`nvim/`)

Based on **kickstart.nvim**, all configuration lives in a single `init.lua` organized into numbered sections. Uses **`vim.pack`** — Neovim's built-in plugin manager (not lazy.nvim). Plugin `PackChanged` autocmds handle post-install build steps for telescope-fzf-native and LuaSnip.

### Plugin sections

| Section | Purpose |
|---------|---------|
| C1 | `codecompanion.nvim` — AI chat/inline via Ollama |
| C2 | `minuet-ai.nvim` — FIM autocomplete via Ollama |
| 3 | UI: gitsigns, which-key, tokyonight, mini.nvim |
| 4 | Search: Telescope + fzf-native |
| 5 | LSP: mason + mason-lspconfig + fidget |
| 6 | Formatting: conform.nvim |
| 7 | Completion: blink.cmp + LuaSnip |
| 8 | Syntax: nvim-treesitter (auto-installs parsers on demand) |

### LSP / tooling (managed by Mason)

`gopls`, `ts_ls`, `ruff`, `basedpyright`, `lua_ls`, `stylua`. Lua formatting is handled by `stylua` (lua_ls formatting is disabled). Format on save is opt-in per filetype in the `conform` setup.

### AI completions

Both `codecompanion` and `minuet` require **Ollama running locally** with the `qwen2.5-coder:7b` model:

```bash
ollama serve          # start Ollama daemon
ollama pull qwen2.5-coder:7b
```

`minuet` is wired as a `blink.cmp` source (score_offset 8, async). `codecompanion` provides chat and inline rewrite via `:CodeCompanion`.

## Shell Config (`zsh/`)

- `.zshenv` — adds `~/.local/bin` to `PATH` (for uv-installed tools)
- `.zshrc` — loads CachyOS base config, Powerlevel10k, nvm, and uv shell completions

## Other Components

| Package | Tool | Notes |
|---------|------|-------|
| `foot/` | Foot terminal | Catppuccin Mocha theme, 60% opacity |
| `waybar/` | Status bar | Workspaces, clock, battery, network, volume |
| `mako/` | Notifications | 5s timeout, sorted by recency |
| `hyprlock/` | Lock screen | Blur background, clock label, input field |
| `hypridle/` | Idle daemon | Dim at 2.5 min, lock at 5 min, DPMS off at 5.5 min |
| `wireplumber/` | Audio | Bluetooth auto-connect enabled |
