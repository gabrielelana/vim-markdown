if exists('g:markdown_edit_code_blocks_loaded') || &cp || v:version < 700
  finish
endif
let g:markdown_edit_code_blocks_loaded = 1

" TODO: extract search_block_around(up, down, do)
" TODO: locate_html_code_block(starting_from)
" TODO: locate_jekyll_front_matter_code_block(starting_from)


function! s:edit_code_block(mode) range abort
  let code_block = s:locate_range_code_block(a:firstline, a:lastline, a:mode)
  if code_block['from'] == 0 || code_block['to'] == 0
    let code_block = s:locate_fenced_code_block(a:firstline)
  endif
  if code_block['from'] == 0 || code_block['to'] == 0
    echo 'Sorry, I did not find any suitable code block to edit'
    return
  endif

  let code_block['file_extension'] = '.' . code_block['language']
  if has_key(s:known_file_extensions, code_block['language'])
    let code_block['file_extension'] = s:known_file_extensions[code_block['language']]
  endif
  let code_block['file_path'] = tempname() . code_block['file_extension']
  let code_block['content'] = getline(code_block['from'], code_block['to'])

  call writefile(code_block['content'], code_block['file_path'])
  augroup MdReplaceEditedCodeBlock
    autocmd BufEnter <buffer> call s:replace_edited_code_block()
  augroup END

  let b:code_block = code_block
  execute 'split ' . code_block['file_path']
  autocmd BufLeave <buffer> wq
endfunction

function! s:replace_edited_code_block()
  augroup MdReplaceEditedCodeBlock
    autocmd!
  augroup END
  augroup! MdReplaceEditedCodeBlock

  if b:code_block['to'] - b:code_block['from'] >= 0
    execute b:code_block['from'] . ',' b:code_block['to'] . ' delete _'
  endif
  call append(b:code_block['from']-1, readfile(b:code_block['file_path']))
  call setpos('.', b:code_block['back_to_position'])

  execute 'silent bwipeout! ' . b:code_block['file_path']
  call delete(b:code_block['file_path'])
  unlet! b:code_block
endfunction

function! s:locate_range_code_block(from, to, mode)
  let code_block = {'from': 0, 'to': 0, 'language': 'txt'}
  if (a:to > a:from) || (a:mode ==# 'V')
    let code_block['from'] = a:from
    let code_block['to'] = a:to
    let code_block['language'] = 'markdown'
    let code_block['back_to_position'] = getpos('.')
  endif
  return code_block
endfunction

function! s:locate_fenced_code_block(starting_from)
  let code_block = {'from': 0, 'to': 0, 'language': 'txt'}
  let initial_position = getpos('.')
  let search_position = copy(initial_position)
  let search_position[1] = a:starting_from
  let search_position[2] = 0
  cal setpos('.', search_position)
  let code_block['from'] = search('^```\w\+\(\s.*$\|$\)', 'cbnW')
  let code_block['to'] = search('^```$', 'cnW')
  call setpos('.', initial_position)
  if code_block['from'] > 0 && code_block['to'] > 0
    let code_block['language'] = substitute(getline(code_block['from']), '```', '', '')
    let code_block['back_to_position'] = initial_position
    let code_block['back_to_position'][1] = code_block['from']
    let code_block['back_to_position'][2] = 0
    let code_block['from'] = code_block['from'] + 1
    let code_block['to'] = code_block['to'] - 1
  endif
  return code_block
endfunction

command! -buffer -nargs=1 -range MdEditCodeBlock :<line1>,<line2>call s:edit_code_block(<args>)

let s:known_file_extensions = {
  \ 'abap': '.abap',
  \ 'antlr': '.g4',
  \ 'asp': '.asp',
  \ 'ats': '.dats',
  \ 'actionscript': '.as',
  \ 'ada': '.adb',
  \ 'agda': '.agda',
  \ 'apacheconf': '.apacheconf',
  \ 'apex': '.cls',
  \ 'applescript': '.applescript',
  \ 'arc': '.arc',
  \ 'arduino': '.ino',
  \ 'asciidoc': '.asciidoc',
  \ 'assembly': '.asm',
  \ 'augeas': '.aug',
  \ 'autohotkey': '.ahk',
  \ 'autoit': '.au3',
  \ 'awk': '.awk',
  \ 'batchfile': '.bat',
  \ 'befunge': '.befunge',
  \ 'blitzbasic': '.bb',
  \ 'blitzmax': '.bmx',
  \ 'bluespec': '.bsv',
  \ 'boo': '.boo',
  \ 'brainfuck': '.b',
  \ 'brightscript': '.brs',
  \ 'bro': '.bro',
  \ 'c': '.c',
  \ 'c++': '.cpp',
  \ 'cpp': '.cpp',
  \ 'clips': '.clp',
  \ 'cmake': '.cmake',
  \ 'cobol': '.cob',
  \ 'css': '.css',
  \ 'ceylon': '.ceylon',
  \ 'chuck': '.ck',
  \ 'cirru': '.cirru',
  \ 'clean': '.icl',
  \ 'clojure': '.clj',
  \ 'coffeescript': '.coffee',
  \ 'coldfusion': '.cfm',
  \ 'coq': '.coq',
  \ 'creole': '.creole',
  \ 'crystal': '.cr',
  \ 'cucumber': '.feature',
  \ 'cuda': '.cu',
  \ 'cython': '.pyx',
  \ 'd': '.d',
  \ 'dm': '.dm',
  \ 'dot': '.dot',
  \ 'dart': '.dart',
  \ 'diff': '.diff',
  \ 'dylan': '.dylan',
  \ 'ecl': '.ecl',
  \ 'eiffel': '.e',
  \ 'elixir': '.ex',
  \ 'elm': '.elm',
  \ 'erlang': '.erl',
  \ 'flux': '.fx',
  \ 'fortran': '.f90',
  \ 'factor': '.factor',
  \ 'fancy': '.fy',
  \ 'fantom': '.fan',
  \ 'forth': '.fth',
  \ 'gas': '.s',
  \ 'glsl': '.glsl',
  \ 'genshi': '.kid',
  \ 'glyph': '.glf',
  \ 'go': '.go',
  \ 'gosu': '.gs',
  \ 'groff': '.man',
  \ 'groovy': '.groovy',
  \ 'html': '.html',
  \ 'http': '.http',
  \ 'haml': '.haml',
  \ 'handlebars': '.handlebars',
  \ 'harbour': '.hb',
  \ 'haskell': '.hs',
  \ 'haxe': '.hx',
  \ 'hy': '.hy',
  \ 'idl': '.pro',
  \ 'ini': '.ini',
  \ 'idris': '.idr',
  \ 'io': '.io',
  \ 'ioke': '.ik',
  \ 'j': '.ijs',
  \ 'json': '.json',
  \ 'json5': '.json5',
  \ 'jsonld': '.jsonld',
  \ 'jade': '.jade',
  \ 'java': '.java',
  \ 'javascript': '.js',
  \ 'julia': '.jl',
  \ 'krl': '.krl',
  \ 'kotlin': '.kt',
  \ 'lfe': '.lfe',
  \ 'llvm': '.ll',
  \ 'lasso': '.lasso',
  \ 'less': '.less',
  \ 'lilypond': '.ly',
  \ 'livescript': '.ls',
  \ 'logos': '.xm',
  \ 'logtalk': '.lgt',
  \ 'lua': '.lua',
  \ 'm': '.mumps',
  \ 'makefile': '.mak',
  \ 'mako': '.mako',
  \ 'markdown': '.md',
  \ 'mask': '.mask',
  \ 'matlab': '.matlab',
  \ 'max': '.maxpat',
  \ 'mediawiki': '.mediawiki',
  \ 'mirah': '.druby',
  \ 'monkey': '.monkey',
  \ 'moocode': '.moo',
  \ 'moonscript': '.moon',
  \ 'myghty': '.myt',
  \ 'nsis': '.nsi',
  \ 'nemerle': '.n',
  \ 'netlogo': '.nlogo',
  \ 'nginx': '.nginxconf',
  \ 'nimrod': '.nim',
  \ 'nu': '.nu',
  \ 'numpy': '.numpy',
  \ 'ocaml': '.ml',
  \ 'objdump': '.objdump',
  \ 'omgrofl': '.omgrofl',
  \ 'opa': '.opa',
  \ 'opencl': '.cl',
  \ 'org': '.org',
  \ 'oxygene': '.oxygene',
  \ 'pawn': '.pwn',
  \ 'php': '.php',
  \ 'parrot': '.parrot',
  \ 'pascal': '.pas',
  \ 'perl': '.pl',
  \ 'perl6': '.p6',
  \ 'pike': '.pike',
  \ 'pod': '.pod',
  \ 'pogoscript': '.pogo',
  \ 'postscript': '.ps',
  \ 'powershell': '.ps1',
  \ 'processing': '.pde',
  \ 'prolog': '.prolog',
  \ 'puppet': '.pp',
  \ 'python': '.py',
  \ 'qml': '.qml',
  \ 'r': '.r',
  \ 'rdoc': '.rdoc',
  \ 'realbasic': '.rbbas',
  \ 'rhtml': '.rhtml',
  \ 'rmarkdown': '.rmd',
  \ 'racket': '.rkt',
  \ 'rebol': '.rebol',
  \ 'redcode': '.cw',
  \ 'robotframework': '.robot',
  \ 'rouge': '.rg',
  \ 'ruby': '.rb',
  \ 'rust': '.rs',
  \ 'scss': '.scss',
  \ 'sql': '.sql',
  \ 'sage': '.sage',
  \ 'sass': '.sass',
  \ 'scala': '.scala',
  \ 'scaml': '.scaml',
  \ 'scheme': '.scm',
  \ 'scilab': '.sci',
  \ 'self': '.self',
  \ 'shell': '.sh',
  \ 'shen': '.shen',
  \ 'slash': '.sl',
  \ 'smalltalk': '.st',
  \ 'smarty': '.tpl',
  \ 'squirrel': '.nut',
  \ 'stylus': '.styl',
  \ 'supercollider': '.scd',
  \ 'toml': '.toml',
  \ 'txl': '.txl',
  \ 'tcl': '.tcl',
  \ 'tcsh': '.tcsh',
  \ 'tex': '.tex',
  \ 'tea': '.tea',
  \ 'textile': '.textile',
  \ 'turing': '.t',
  \ 'twig': '.twig',
  \ 'typescript': '.ts',
  \ 'unrealscript': '.uc',
  \ 'vhdl': '.vhdl',
  \ 'vala': '.vala',
  \ 'verilog': '.v',
  \ 'viml': '.vim',
  \ 'volt': '.volt',
  \ 'xc': '.xc',
  \ 'xml': '.xml',
  \ 'xproc': '.xpl',
  \ 'xquery': '.xquery',
  \ 'xs': '.xs',
  \ 'xslt': '.xslt',
  \ 'xtend': '.xtend',
  \ 'yaml': '.yml',
  \ 'ec': '.ec',
  \ 'edn': '.edn',
  \ 'fish': '.fish',
  \ 'mupad': '.mu',
  \ 'nesc': '.nc',
  \ 'ooc': '.ooc',
  \ 'restructuredtext': '.rst',
  \ 'wisp': '.wisp',
  \ 'xbase': '.prg',
\ }
