# Neovim configuration 

Here is my configuration for [neovim](https://neovim.io/), which I use mostly
for writing Python, C and LaTeX, among many other things. It is not based on
any distribution or someone else's config. It's a collection of many things
that I found or created and tweaked over the years. I try my best to keep
everything clean.

## How my configuration is structured

Main configuration is under `lua/config`, which is sourced by `init.lua`

The configuration for the plugin manager,
[Lazy](https://github.com/folke/lazy.nvim), is `lua/config/plugins.lua`. It
doesn't do much. If Lazy is not already on the system, it doesn't install it
right away; instad, a keymap (`<leader>P`) is defined for that.

Actual plugin specifications and configs are in `lua/plugins/`. I avoid using
too many of them so that it is easier to maintain. All plugin-related keymaps
are defined in here.

`lua/data/` contains less functional things that make up for a lot of text that
either don't really belong in a configuration file or I just prefer to keep
separated.

There is also `lua/snippets/`, which is is sourced by
[LuaSnip](https://github.com/L3MON4D3/LuaSnip), a powerful snippet engine. I
did this with A LOT of help from [TJ videos](https://youtu.be/Dn800rlPIho).
There is more information about LuaSnip in `plugins/cmp.lua` I've tried to not
abstract it too much so that it is direct and understandable with reasonable
knowledge of the plugin.

Files in `after/ftplugin` are overrules for global ftplugins. You can read more
about this in `:help ftplugin-overrule`.

Each file is basically an autocommand that runs _after_ the corresponding
global ftplugin, so it doesn't replace it. This is really useful.

There is also `after/lsp`, which holds custom configuration for LSP servers.


## Dependencies

> [!NOTE]
> I don't like portable package managers, like
> [mason.nvim](https://github.com/mason-org/mason.nvim). I don't think the
> configuration should be entirely self-contained, it's unnecessary complexity
> and even ends up making things less portable in some cases (e.g. NixOS,
> Termux on Android). I also avoid using
> [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter), but
> mostly for consistency with this _externally managed_ preference.

Here are the dependencies for my config in no particular order.

- [python-lsp-server](https://github.com/python-lsp/python-lsp-server)
- [python-ruff](https://github.com/astral-sh/ruff)
- [texlab](https://github.com/latex-lsp/texlab/)
- [lua-language-server](https://luals.github.io/)
- [clangd](https://clangd.llvm.org/) (typically distributed alongside [clang](https://clang.llvm.org/))
- [python-pynvim](https://github.com/neovim/pynvim) (I don't actually need this)
- [Latexmk](https://ctan.org/pkg/latexmk/) and [LuaTeX](https://www.luatex.org/)
- [TeX Live](https://tug.org/texlive/)... Well, just part of it. At least something that includes `latexmk` and `xelatex` (in Arch Linux this is `texlive-binextra`)
- [Zathura](https://pwmt.org/projects/zathura/) for viewing compiled LaTeX documents
- Necessary Tree-sitter parsers, see below.


### Tree-sitter

[Tree-sitter](https://neovim.io/doc/user/treesitter/) is not so
straightforward. Here are some notes on how to deal with it.

Neovim needs both a parser _and_ some editor-specific files to have Tree-sitter
support for a language. The latter are just runtime files, for which an
enormous collection exists in the
[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter/tree/main/runtime/queries)
repository. These files can simply be copied somewhere like
`~/.local/share/nvim/site/queries`.

Parsers can be installed using the system package manager if a package exists
for them. This the most simple way to do it and it also should handle
compatibility with Neovim. They are typically named `tree-sitter-<language>`.
On NixOS they are under `tree-sitter-grammars`.

> [!WARNING]
> On Arch Linux, some AUR packages may not work with Neovim. In my experience
> this is the case with `tree-sitter-make`, the parser for Makefiles. So I had
> to install it manually.

They can also be installed manually. This requires `tree-sitter-cli` and can be
done following these two steps.
1. Download the language [grammar](https://github.com/tree-sitter-grammars) and
   build it with, typically with
```sh
tree-sitter-cli build
```
2. Let Neovim know about the parser by creating a symlink to it in `parser/`
   anywhere in the runtime path. For example, `libtree-sitter-python.so` could
   go in `/usr/share/nvim/runtime/parser/python.so` or
   `~/.local/share/nvim/site/parser/python.so`
