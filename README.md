### brighter

This is a 16-color, terminal-only colorscheme for vim identical to

    :colorscheme default
    :set background=light

except that it uses the lighter versions instead of the darker versions
of the 16 standard terminal colors.  This makes it suitable for a dark
background.

This exists because for some incomprehensible reason, the *actual* default
`background=dark` colorscheme is something completely different.
(and very pastel...)

### Installation

Install via your favorite vim plugin manager.

To activate it:

    :colorscheme brighter

### Configuration

If you want a couple of colors to be taken from the default color schemes,
you can specify overrides:

    ```vim
    " prior to setting the colorscheme
    let g:brighter_use_dark = ['comment']
    let g:brighter_use_light = ['special']
    ```

Personally, I don't like my default yellow, and so I make it dark yellow:

    ```vim
    let g:brighter_use_light = ['statement']
    ```

However, 16-color mode is too limiting for most plugins,
so I like to set `t_Co = 256`.
Unfortunately, there is something funny about "DarkYellow"/"Brown" in vim
(the default light Statement color),
which is that it is the only color used by the default "background=light"
theme that does not map to a 16-color color in 256 color mode!

Hence, for this exceedingly specific issue,
`brighter.vim` has an *additional* option to force Brown into submission.

    ```vim
    set t_Co=256
    let g:brighter_use_light = ['statement']
    let g:brighter_brown_16 = 1
    ```

