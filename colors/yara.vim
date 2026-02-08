lua << EOF
require("yara").colorscheme()
EOF

augroup yara_background
  autocmd!
  autocmd OptionSet background call <SID>yara_refresh()
augroup END

function! s:yara_refresh() abort
  if g:colors_name ==# 'yara'
    lua require("yara").colorscheme()
  endif
endfunction
