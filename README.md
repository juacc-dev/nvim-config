# Neovim configuration 

Here is my configuration for neovim. It is not based on any distribution nor it
is a copy of some other config; it's instead a collection of many things I've
found and changed to my liking or simply came up with. I try to make a lot
comments and check and fix things every now and then. 

I use neovim mainly for writing Python, C and LaTeX.

## Structure

This configuration is structured as follows.

### `init.lua`

There's not much to say about this. It sources all files from `lua/config/`.

All files under this directory are written in lua and are available to the
neovim Lua engine, they can be passed to `require()`.

### Plugins

The configuration for the plugin manager,
[Lazy](https://github.com/folke/lazy.nvim), is `lua/config/plugins.lua`. It
doesn't do much. If Lazy is not already on the system, it doesn't install it
right away; instad, a keymap (`<leader>P`) is defined for that.

Actual plugin specifications and configs are in `lua/plugins/`. I avoid using
too many of them so that it is easier to maintain. All plugin related keymaps
are defined in here.

Inside `lua/data/`, I have less functional things, like icons and colors, that
make up for a lot of text that doesn't really belong in a configuration file or
I just prefer to keep separated

There is also `lua/snippets/`, which is is sourced by
[LuaSnip](https://github.com/L3MON4D3/LuaSnip), a powerful snippet engine. I
did this with A LOT of help from [TJ videos](https://youtu.be/Dn800rlPIho).
There is more information about LuaSnip in `plugins/cmp.lua` I've tried to not
abstract it too much so that it is direct and understandable with reasonable
knowledge of the plugin.

### Filetype plugins

Files in here are overrules for global ftplugins. You can read more about this
in `:help ftplugin-overrule`.

Each file is basically an autocommand that runs _after_ the corresponding global
ftplugin, so it doesn't replace it. This is really useful.
