# brighter.vim

This is a 16-color, terminal-only colorscheme for vim identical to

    :colorscheme default
    :set background=light

except that it uses the light variants
in place of the dark variants
of the 16 standard terminal colors,
making it suitable for a dark background.
This exists because for some incomprehensible reason,
the *actual* default `background=dark` colorscheme
is something completely different.
(and very pastel...)

## Installation

Install via your favorite vim plugin manager.

To activate it:

    :colorscheme brighter

## Screenshots

**Your mileage may vary!!**

It uses the standard 16 terminal colors,
which may be configurable in your terminal;
hence, these screenshots are only useful as a *comparison*.

* All images are in 256 color mode.
* All images use the default terminal background for Ubuntu 16.04 LTS.
* All images have the `gnome-terminal` theme set to Tango.


| brighter (no overrides) | brighter (with my settings) |
| --- | --- |
| <a href="/doc/img/brighter-yellow.png?raw=true"><img src="/doc/img/brighter-yellow.png?raw=true" width="350" /></a> | <a href="/doc/img/brighter-gold.png?raw=true"><img src="/doc/img/brighter-gold.png?raw=true" width="350" /></a> |

Contrast with the default theme:

| default (set bg=light) | default (set bg=dark) |
| --- | --- |
| <a href="/doc/img/default-bglite.png?raw=true"><img src="/doc/img/default-bglite.png?raw=true" width="350" /></a> | <a href="/doc/img/default-bgdark.png?raw=true"><img src="/doc/img/default-bgdark.png?raw=true" width="350" /></a> |

(note: the colored parentheses/commas are from [`rainbow`](https://github.com/luochen1990/rainbow))

## Compatibility

I did not bother touching the gui colors. (they are retained from `default`)

**Therefore, brighter.vim will not work under any of these conditions:**
* you use GVim
* you have CSApprox installed
* you use `neovim` with `set termguicolors`

## Configuration

If you want a couple of colors to be taken from the default color schemes,
you can specify overrides:

```vim
" prior to setting the colorscheme
let g:brighter_use_dark = ['comment']
let g:brighter_use_light = ['special']
```

Valid names are [the primitive syntax types defined here in syncolor.vim](https://github.com/vim/vim/blob/071d427/runtime/syntax/syncolor.vim#L44-L52). (case-insensitive)

I rather like the "golden"-looking dark yellow in
`gnome-terminal`'s Tango colors, so I override the Statement color:

```vim
let g:brighter_use_light = ['statement']
```

Unfortunately, there is something funny about the
default bg=light Statement color,
which is that it is the *only color in the light theme
that does not map to a 16-color color in 256 color mode*
(instead mapping to an awful brown).

Hence `brighter.vim` has an *additional* option to replace that nasty brown
with the 16-color dark yellow.

```vim
set t_Co=256
let g:brighter_use_light = ['statement']
let g:brighter_brown_16 = 1 "note: no visible impact without the above lines
```
