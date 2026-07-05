# Neovim configuration 

Here is my configuration for [neovim](https://neovim.io/),. It is not based on
any distribution nor it is a copy of some other config; it's a collection of
many things I've found and changed to meet with my preferences or simply came
up with. I try to make a lot comments and check and fix things every now and
then. I use neovim mainly for writing Python, C and LaTeX.


## How my configuration is structured

Main configuration is under `lua/config`, which is sourced by `init.lua`

The configuration for the plugin manager,
[Lazy](https://github.com/folke/lazy.nvim), is `lua/config/plugins.lua`. It
doesn't do much. If Lazy is not already on the system, it doesn't install it
right away; instad, a keymap (`<leader>P`) is defined for that.

Actual plugin specifications and configs are in `lua/plugins/`. I avoid using
too many of them so that it is easier to maintain. All plugin related keymaps
are defined in here.

Inside `lua/data/`, I have less functional things, like icons and colors, that
make up for a lot of text that doesn't really belong in a configuration file or
I just prefer to keep separated.

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

> [!note] I don't like portable package managers, like [mason.nvim](https://github.com/mason-org/mason.nvim).
> I don't think the configuration should be entirely self-contained, it's
> unnecessary complexity and even ends up making things less portable in some
> cases (e.g. NixOS, Termux on Android). I also avoid using
> [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter), but
> mostly for consistency with this _externally managed_ preference.

Here are the dependencies for my config in no particular order.

- [python-lsp-server](https://github.com/python-lsp/python-lsp-server)
- [python-ruff](https://github.com/astral-sh/ruff)
- [texlab](https://github.com/latex-lsp/texlab/)
- [lua-language-server](https://luals.github.io/)
- [clangd](https://clangd.llvm.org/) (typically distributed alongside [clang](https://clang.llvm.org/))
- [python-pynvim](https://github.com/neovim/pynvim) (I don't actually need this)
- [TeX Live](https://tug.org/texlive/)... Well, just part of it. At least something that includes `latexmk` and `xelatex` (in Arch Linux this is probably `texlive-binextra`)
- [Zathura](https://pwmt.org/projects/zathura/) for viewing compiled LaTeX documents


### Tree-sitter

Dealing with [Tree-sitter](https://neovim.io/doc/user/treesitter/) is not so straight forward. Neovim needs both a parser and some editor-specific files (for syntax highlighting and so on) to have Tree-sitter support for a language.

Parsers can be installed with the system package manager (if available) or manually. The latter just means finding the necessary [grammar](https://github.com/tree-sitter-grammars) and building it with
```sh
tree-sitter-cli build
```
Although some prior configuration may be needed.

After installing the parser, Neovim needs to know about it. This means creating a symlink to the shared object in the runtime path. For example, `/usr/lib/tree_sitter/c.so` could go in `~/.local/share/nvim/site/parser/c.so`.

Finally, there are the neovim-specific files which go in `queries/`. A gigantic collection can be found in the [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter/tree/main/runtime/queries) plugin repo. I included a few.

Once everything is set up, running `vim.treesitter.start()` should start highlighting.
