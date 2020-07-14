" show the clojure command prompt
nmap <Leader>, cqp

" special clojure forms
let g:clojure_fuzzy_indent_patterns = [
      \ '^with',
      \ '^def',
      \ '^let' ]

" don't limit how far back clojure-static can search
let g:clojure_maxlines = 10000
