vim.cmd([[
    if executable('tfdoc')
        command! -nargs=* Tfdoc :call system('tfdoc' . ' ' . <q-args>)
    endif
    nnoremap <silent> <Leader><Leader>r :Tfdoc <C-R><C-W><CR>
    nnoremap <silent> <Leader><Leader>d :Tfdoc -d <C-R><C-W><CR>
    xnoremap <silent> <Leader><Leader>r y:Tfdoc <C-R>"<CR>
    xnoremap <silent> <Leader><Leader>d y:Tfdoc -d <C-R>"<CR>

]])

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd([[
  function! TerraformFolds()
  let thisline = getline(v:lnum)
  if match(thisline, '^resource') >= 0
    return ">1"
  elseif match(thisline, '^provider') >= 0
    return ">1"
  elseif match(thisline, '^module') >= 0
    return ">1"
  elseif match(thisline, '^variable') >= 0
    return ">1"
  elseif match(thisline, '^output') >= 0
    return ">1"
  elseif match(thisline, '^data') >= 0
    return ">1"
  elseif match(thisline, '^locals') >= 0
    return ">1"
  elseif match(thisline, '^terraform') >= 0
    return ">1"
  else
    return "="
  endif
endfunction
setlocal foldmethod=expr
setlocal foldexpr=TerraformFolds()
setlocal foldlevel=0

function! TerraformFoldText()
  let foldsize = (v:foldend-v:foldstart)
  return getline(v:foldstart).' ('.foldsize.' lines)'
endfunction
setlocal foldtext=TerraformFoldText()

"inoremap <space> <C-O>za
" nnoremap <space> za
" onoremap <space> <C-C>za
" vnoremap <space> zf
]])
	end,
})
