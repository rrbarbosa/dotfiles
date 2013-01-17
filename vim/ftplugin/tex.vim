map <silent> <Leader>ls :silent !/Applications/Skim.app/Contents/SharedSupport/displayline
		\ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>" "%:p" <CR>

" use sync tex
"let g:LatexBox_latexmk_options = '-synctex=1'
let g:LatexBox_viewer = 'open -a /Applications/Skim.app/' 
" enable folding...
let g:LatexBox_Folding = 1
" ... but do not fold the preamble
let g:LatexBox_fold_preamble = 0

setlocal tabstop=2
setlocal shiftwidth=2
setlocal spell

"Add vim-surrond for latex command, using char c
let g:surround_{char2nr('c')} = "\\\1command\1{\r}"

"Some text expansions
iab todo %TODO -

" Some functions copyied from vim-latex
let g:Tex_SmartKeyQuote = 1
let g:Tex_SmartKeyBS = 1
let g:Tex_SmartKeyDot = 1


" Tex_GetVarValue: gets the value of the variable {{{
" Description: 
" 	See if a window-local, buffer-local or global variable with the given name
" 	exists and if so, returns the corresponding value. If none exist, return
" 	an empty string.
function! Tex_GetVarValue(varname, ...)
	if exists('w:'.a:varname)
		return w:{a:varname}
	elseif exists('b:'.a:varname)
		return b:{a:varname}
	elseif exists('g:'.a:varname)
		return g:{a:varname}
	elseif a:0 > 0
		return a:1
	else
		return ''
	endif
endfunction " }}}

" ==============================================================================
" Smart key-mappings (adapted from vim-latex)
" ============================================================================== 
" TexQuotes: inserts `` or '' instead of " {{{
if g:Tex_SmartKeyQuote

	" TexQuotes: inserts `` or '' instead of "
	" Taken from texmacro.vim by Benji Fisher <benji@e-math.AMS.org>
	" TODO:  Deal with nested quotes.
	" The :imap that calls this function should insert a ", move the cursor to
	" the left of that character, then call this with <C-R>= .
	function! s:TexQuotes()
		let l = line(".")
		let c = col(".")
		let restore_cursor = l . "G" . virtcol(".") . "|"
		normal! H
		let restore_cursor = "normal!" . line(".") . "Gzt" . restore_cursor
		execute restore_cursor
		" In math mode, or when preceded by a \, just move the cursor past the
		" already-inserted " character.
		if synIDattr(synID(l, c, 1), "name") =~ "^texMath"
			\ || (c > 1 && getline(l)[c-2] == '\')
			return "\<Right>"
		endif
		" Find the appropriate open-quote and close-quote strings.
		if exists("b:Tex_SmartQuoteOpen")
			let open = b:Tex_SmartQuoteOpen
		elseif exists("g:Tex_SmartQuoteOpen")
			let open = g:Tex_SmartQuoteOpen
		else
			let open = "``"
		endif
		if exists("b:Tex_SmartQuoteClose")
			let close = b:Tex_SmartQuoteClose
		elseif exists("g:Tex_SmartQuoteClose")
			let close = g:Tex_SmartQuoteClose
		else
			let close = "''"
		endif
		let boundary = '\|'
		" This code seems to be obsolete, since this script variable is never
		" set. The idea is that some languages use ",," as an open- or
		" close-quote string, and we want to avoid confusing ordinary ","
		" with a quote boundary.
		if exists("s:TeX_strictquote")
			if( s:TeX_strictquote == "open" || s:TeX_strictquote == "both" )
				let boundary = '\<' . boundary
			endif
			if( s:TeX_strictquote == "close" || s:TeX_strictquote == "both" )
				let boundary = boundary . '\>'
			endif
		endif

		" Eventually return q; set it to the default value now.
		let q = open
		let pattern = 
			\ escape(open, '\~') .
			\ boundary .
			\ escape(close, '\~') .
			\ '\|^$\|"'

		while 1	" Look for preceding quote (open or close), ignoring
			" math mode and '\"' .
			call search(pattern, "bw")
			if synIDattr(synID(line("."), col("."), 1), "name") !~ "^texMath"
				\ && strpart(getline('.'), col('.')-2, 2) != '\"'
				break
			endif
		endwhile
		
		" Now, test whether we actually found a _preceding_ quote; if so, is it
		" an open quote?
		if ( line(".") < l || line(".") == l && col(".") < c )
			if strpart(getline("."), col(".")-1) =~ '\V\^' . escape(open, '\')
				if line(".") == l && col(".") + strlen(open) == c
					" Insert "<++>''<++>" instead of just "''".
					let q = IMAP_PutTextWithMovement("<++>".close."<++>")
				else
					let q = close
				endif
			endif
		endif

		" Return to line l, column c:
		execute restore_cursor
		" Start with <Del> to remove the " put in by the :imap .
		return "\<Del>" . q

	endfunction

endif
" }}}
" SmartBS: smart backspacing {{{
if g:Tex_SmartKeyBS 

	" SmartBS: smart backspacing
	" SmartBS lets you treat diacritic characters (those \'{a} thingies) as a
	" single character. This is useful for example in the following situation:
	"
	" \v{s}\v{t}astn\'{y}    ('happy' in Slovak language :-) )
	" If you will delete this normally (without using smartBS() function), you
	" must press <BS> about 19x. With function smartBS() you must press <BS> only
	" 7x. Strings like "\v{s}", "\'{y}" are considered like one character and are
	" deleted with one <BS>.
	let s:smartBS_pat = Tex_GetVarValue('Tex_SmartBSPattern')

	fun! s:SmartBS_pat()
		return s:smartBS_pat
	endfun

	" This function comes from Benji Fisher <benji@e-math.AMS.org>
	" http://vim.sourceforge.net/scripts/download.php?src_id=409 
	" (modified/patched by Lubomir Host 'rajo' <host8 AT keplerDOTfmphDOTuniba.sk>)
	function! s:SmartBS(pat)
		let init = strpart(getline("."), 0, col(".")-1)
		let matchtxt = matchstr(init, a:pat)
		if matchtxt != ''
			let bstxt = substitute(matchtxt, '.', "\<bs>", 'g')
			return bstxt
		else
			return "\<bs>"
		endif
	endfun
	
endif " }}}
" SmartDots: inserts \cdots instead of ... in math mode otherwise \ldots {{{
" if amsmath package is detected then just use \dots and let amsmath take care
" of it.
if g:Tex_SmartKeyDot

	function! <SID>SmartDots()
		"if strpart(getline('.'), col('.')-3, 2) == '..' && 
			"\ g:Tex_package_detected =~ '\<amsmath\|ellipsis\>'
			"return "\<bs>\<bs>\\dots"
		if synIDattr(synID(line('.'),col('.')-1,0),"name") =~ '^texMath'
			\&& strpart(getline('.'), col('.')-3, 2) == '..' 
			return "\<bs>\<bs>\\cdots"
		elseif strpart(getline('.'), col('.')-3, 2) == '..' 
			return "\<bs>\<bs>\\ldots"
		else
			return '.'
		endif
	endfunction 

endif
" }}}

if g:Tex_SmartKeyQuote 
	inoremap <buffer> <silent> " "<Left><C-R>=<SID>TexQuotes()<CR>
endif
if g:Tex_SmartKeyBS
	inoremap <buffer> <silent> <BS> <C-R>=<SID>SmartBS(<SID>SmartBS_pat())<CR>
endif
if g:Tex_SmartKeyDot
	inoremap <buffer> <silent> . <C-R>=<SID>SmartDots()<CR>
endif

