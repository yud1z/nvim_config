" quickrun: runner: shell
" Author : thinca <thinca+vim@gmail.com>
" License: Creative Commons Attribution 2.1 Japan License
"          <http://creativecommons.org/licenses/by/2.1/jp/deed.en>


let s:save_cpo = &cpo
set cpo&vim

let s:runner = {
\   'config': {
\     'shellcmd': &shell =~? 'cmd\.exe' ? 'silent !%s & pause ' : '!%s',
\   }
\ }

function! s:runner.init(session)
  let a:session.config.outputter = 'null'
endfunction

function! s:runner.run(commands, input, session)
  if a:input !=# ''
    let inputfile = tempname()
    call writefile(split(a:input, "\n", 1), inputfile, 'b')
    let a:session._temp_input = inputfile
  endif

  for cmd in a:commands
    if cmd =~# '^\s*:'
      " A vim command.
      try
        execute cmd
      catch
        break
      endtry
      continue
    endif

    if a:input !=# ''
      let cmd .= ' <' . self.shellescape(inputfile)
    endif

    call s:execute(printf(self.config.shellcmd, cmd))
    if v:shell_error != 0
      break
    endif
  endfor
endfunction

function! s:execute(cmd)
  let is_cmd_exe = &shell =~? 'cmd\.exe'
  try
    if is_cmd_exe
      let sxq = &shellxquote
      let &shellxquote = '"'
    endif
    execute g:quickrun#V.iconv(a:cmd, &encoding, &termencoding)
  finally
    if is_cmd_exe
      let &shellxquote = sxq
    endif
  endtry
endfunction


function! quickrun#runner#shell#new()
  return deepcopy(s:runner)
endfunction

let &cpo = s:save_cpo
