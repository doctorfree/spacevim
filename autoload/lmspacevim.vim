function! lmspacevim#before() abort
  let wiki_1 = {}
  let wiki_1.path = '~/vimwiki_work_md/'
  let wiki_1.syntax = 'markdown'
  let wiki_1.ext = '.md'
  let wiki_1.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'java': 'java', 'xml':'xml'}

  let wiki_2 = {}
  let wiki_2.path = '~/vimwiki_personal_md/'
  let wiki_2.syntax = 'markdown'
  let wiki_2.ext = '.md'
  let wiki_2.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'java': 'java', 'xml':'xml'}
  let g:vimwiki_list = [wiki_1, wiki_2]
  let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
endfunction

function! lmspacevim#after() abort
  function! InsertHeader()
      :call append(line('.'), '# '.expand('%:t'))
      :normal dd
      :s/.md//
  endfunction
  noremap <silent> <leader>h :execute InsertHeader()<CR>


  set backup
  set backupdir=~/vim_backups
  set dir=~/vim_backups

  let g:ctrlp_map = '<c-p>'

  noremap <Up> <Nop>
  noremap <Down> <Nop>
  noremap <Left> <Nop>
  noremap <Right> <Nop>

  noremap <leader>db :DlvToggleBreakpoint<CR>
  noremap <leader>dc :DlvConnect localhost:2345<CR>
  nnoremap <leader>rd :call GetDate('')<CR>

endfunction
function! GetDate(format)
  let format = empty(a:format) ? '+%d %B %Y' : a:format
  let cmd = 'LANG=en_US /bin/date -u ' . shellescape(format)
  let result = substitute(system(cmd), '[\]\|[[:cntrl:]]', '', 'g')
  " Append space + result to current line without moving cursor.
  call setline(line('.'), getline('.') . ' ' . result)
endfunction
