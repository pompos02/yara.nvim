lua << EOF
require("yara").colorscheme()
EOF

augroup yara_background
  autocmd!
  autocmd OptionSet background if g:colors_name ==# 'yara' \| lua require("yara").colorscheme() \| endif
augroup END
