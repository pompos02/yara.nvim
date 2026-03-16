syn match YaraQuickfixRow "\%(^[^|]*|\)\@<=\d\+" containedin=qfLineNr
syn match YaraQuickfixCol "\<col \d\+\>" containedin=qfLineNr
