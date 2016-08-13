" Vim color file
" Maintainer:	Michael Lamparski <diagonaldevice@gmail.com>
" Last Change:	2016 August 13

" A color scheme which derives its color assigments from the default
" background=light colorscheme, but choses the lighter variants rather
" than the darker variants among the standard 16 terminal colors.

" Initialize to default
colorscheme default
set background=dark

" Summary of default colors defined in syncolor.vim, and my replacements.
let s:colorinfo = {
 \'comment':    {'dark': 'Cyan',       'lite': 'DarkBlue',    'my': 'Blue'},
 \'constant':   {'dark': 'Magenta',    'lite': 'DarkRed',     'my': 'Red'},
 \'special':    {'dark': 'LightRed',   'lite': 'DarkMagenta', 'my': 'Magenta'},
 \'identifier': {'dark': 'Cyan',       'lite': 'DarkCyan',    'my': 'Cyan'},
 \'statement':  {'dark': 'Yellow',     'lite': 'Brown',       'my': 'Yellow'},
 \'preproc':    {'dark': 'LightBlue',  'lite': 'DarkMagenta', 'my': 'Magenta'},
 \'type':       {'dark': 'LightGreen', 'lite': 'DarkGreen',   'my': 'Green'},
 \'underlined': {'dark': 'LightBlue',  'lite': 'DarkMagenta', 'my': 'Magenta'},
 \'ignore':     {'dark': 'black',      'lite': 'white',       'my': 'white'},
 \}

function! s:set_default(var, default, typedesc)
	" HALP GUYS HOW DOES BE DRY IN VIMSCRITP
	execute ''
	 \ .'  if !exists("'.a:var.'")'
	 \ .'|     let '.a:var.' = '.a:default
	 \ .'| elseif type('.a:var.') != type('.a:default.')'
	 \ .'|     echoerr "'.a:var.' should be '.a:typedesc.'"'
	 \ .'|     let '.a:var.' = '.a:default
	 \ .'| endif'
endfunction

function! s:set_config_defaults()
	" Fixes Brown to use one of the terminal's 16 colors even if t_Co=256.
	" Pointless unless g:brighter_use_light contains 'statement'.
	call s:set_default('g:brighter_brown_16', '0', 'a number (0=false)')

	" Override some things to use background=dark colors.
	call s:set_default('g:brighter_use_dark', '[]', 'a list')

	" Override some things to use background=light colors.
	" e.g. let g:brighter_use_light = ['statement']
	call s:set_default('g:brighter_use_light', '[]', 'a list')
endfunction

function! s:get_colors()
	let cfg_use_dark = map(copy(g:brighter_use_dark), 'tolower(v:val)')
	let cfg_use_lite = map(copy(g:brighter_use_light), 'tolower(v:val)')
	let colors = map(copy(s:colorinfo), "v:val['my']")

	let overrides = []
	let overrides += map(copy(cfg_use_dark), "[v:val, 'dark']")
	let overrides += map(copy(cfg_use_lite), "[v:val, 'lite']")

	for [syn_key, src_key] in overrides
		let info = get(s:colorinfo, syn_key, {})
		if info == {}
			echoerr 'brighter.vim: Ignoring unknown key: '.syn_key
		else
			let colors[syn_key] = info[src_key]
		endif
	endfor

	if g:brighter_brown_16
		for [key, clr] in items(colors)
			if tolower(clr) == 'brown'
				" I would put 'darkyellow' here, but humorously,
				"  that's just an alias for 'brown'!
				let colors[key] = '3'
			endif
		endfor
	endif
	return colors
endfunction

call s:set_config_defaults()
for [key, val] in items(s:get_colors())
	execute 'highlight '.key.' ctermfg='.val
endfor
let colors_name = "brighter"

" vim: sw=2
