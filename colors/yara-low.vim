lua << EOF
require("yara").colorscheme("yara-low")
EOF

augroup yara_low_background
  autocmd!
  autocmd OptionSet background call <SID>yara_low_refresh()
augroup END

function! s:yara_low_refresh() abort
  if g:colors_name ==# 'yara-low'
    lua require("yara").colorscheme("yara-low")
  endif
endfunction
