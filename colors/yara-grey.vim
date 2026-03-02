lua << EOF
require("yara").colorscheme("yara-grey")
EOF

augroup yara_grey_background
  autocmd!
  autocmd OptionSet background call <SID>yara_grey_refresh()
augroup END

function! s:yara_grey_refresh() abort
  if g:colors_name ==# 'yara-grey'
    lua require("yara").colorscheme("yara-grey")
  endif
endfunction
