# Neovim Configuration

**Files:** `init.lua`, `lazy-lock.json`, `lua/*.lua`

Vim-based editor config using **lazy.nvim** plugin manager. Modular Lua structure.

## Structure

```
nvim/
  init.lua                  -- Entry point, bootstrap lazy.nvim
  lazy-lock.json            -- Pinned plugin commits
  lua/
    options.lua             -- Global Neovim options
    keymaps.lua             -- Core keybindings
    autocmds.lua            -- General autocommands
    terminal.lua            -- Custom multi-terminal manager
    recent_files.lua        -- Session-based recent files (Telescope UI)
    plugins/
      ui.lua                -- tokyonight, todo-comments, mini.surround, nvim-ufo
      treesitter.lua        -- nvim-treesitter
      telescope.lua         -- Telescope.nvim + recent files
      lsp.lua               -- Mason, lspconfig, lazydev, fidget
      completion.lua        -- blink.cmp + LuaSnip
      conform.lua           -- conform.nvim (formatting)
      render-markdown.lua   -- render-markdown.nvim
      core.lua              -- gitsigns, which-key, grug-far
      undotree.lua          -- undotree + vim-fubitive
      comment.lua           -- Comment.nvim
      terminal.lua          -- Lazy spec for the custom terminal module
```

## Options

| Setting | Value |
|---------|-------|
| Line numbers | Absolute + relative |
| Indent | 2 spaces, expand tabs |
| Clipboard | System (`unnamedplus`) |
| Undo | Persistent (`undofile`) |
| Search | Case-insensitive, smart case |
| Cursorline | Enabled |
| Scrolloff | 10 |
| Fold level | 99 (open by default) |
| Shell | PowerShell 7 (`pwsh`) |
| Invisible chars | Tab=`»`, trailing=`·`, nbsp=`␣` |

## Keybindings

| Action | Binding |
|--------|---------|
| Clear search highlight | `<Esc>` |
| Exit insert mode | `jj` |
| Save file | `<C-s>` |
| Toggle last buffer | `fj` |
| Close buffer | `<leader>w` |
| File explorer (netrw) | `<leader>e` |
| Vertical split | `<leader>v` |
| Horizontal split | `<leader>d` |
| Navigate split | `<leader>h/j/k/l` |
| Close split | `<leader>x` |
| Move line up/down (visual) | `K` / `J` |

### LSP

| Action | Binding |
|--------|---------|
| Go to declaration | `gD` |
| Go to definition | `gd` |
| Hover docs | `K` |
| Implementations | `gi` |
| Type definitions | `<leader>D` |
| References | `gr` |
| Rename | `<leader>rn` |
| Code actions | `<leader>ca` |
| Signature help | `<C-k>` |
| Floating diagnostic | `gl` |
| Next/prev diagnostic | `]d` / `[d` |
| Diagnostic quickfix | `<leader>q` |

### Telescope

| Action | Binding |
|--------|---------|
| Find files | `<leader>sf` |
| Live grep | `<leader>sg` |
| Buffers | `<leader>sb` |
| Help tags | `<leader>sh` |
| Recent files | `<leader>so` |
| Keymaps | `<leader>sk` |
| Diagnostics | `<leader>sd` |
| Document symbols | `<leader>ss` |
| Resume last picker | `<leader>sr` |

### Terminal

| Action | Binding |
|--------|---------|
| Toggle terminal (split) | `<C-S-j>` |
| Toggle terminal (full) | `<C-S-n>` |
| Next terminal | `<C-S-]>` |
| Prev terminal | `<C-S-[>` |
| Increase terminal height | `<C-S-i>` |
| Decrease terminal height | `<C-S-d>` |
| List terminals | `<leader>tt` / `<leader><leader>` |
| Exit terminal mode | `EE` |

### Markdown

| Action | Binding |
|--------|---------|
| Toggle render | `<leader>md` |

### Other

| Action | Binding |
|--------|---------|
| Format buffer | `<leader>f` |
| Toggle undotree | `<leader>u` |
| Toggle comment | `gc` |

## Plugins

| Plugin | Purpose |
|--------|---------|
| **tokyonight.nvim** | Colorscheme (storm, transparent) |
| **nvim-treesitter** | Syntax highlighting & indentation |
| **telescope.nvim** | Fuzzy finder |
| **blink.cmp** | Autocompletion |
| **LuaSnip** | Snippet engine |
| **conform.nvim** | Auto-format on save |
| **nvim-lspconfig** | LSP client (clangd, lua_ls, ts_ls, cmake) |
| **mason.nvim** | LSP/formatter installer |
| **render-markdown.nvim** | Inline markdown rendering |
| **gitsigns.nvim** | Git decorations |
| **which-key.nvim** | Keybinding popup help |
| **todo-comments.nvim** | Highlight TODO/FIXME |
| **grug-far.nvim** | Search & replace UI |
| **nvim-ufo** | Code folding |
| **mini.surround** | Paired delimiter ops (`ys`/`cs`/`ds`) |
| **undotree** | Visual undo history |
| **Comment.nvim** | Toggle comments |

## Install

```powershell
Copy-Item -Path ".\nvim\*" -Destination "$env:LOCALAPPDATA\nvim" -Recurse -Force
```

Then restart Neovim or run `:Lazy! sync`.
