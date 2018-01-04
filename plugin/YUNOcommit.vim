" ==============================================================================
"  FILE: YUNOcommit.vim
"  AUTHOR: Clay Dunston <dunstontc@gmail.com>
"  Created By: Dario Sneidermanis
"  License: MIT license
"  Last Modified: 2018-01-02
" ==============================================================================
scriptencoding utf-8

" let s:max_writes = get(g:, 'YUNOcommit_after', 20)

if !exists('g:YUNOcommit_after')
""
" @setting(g:YUNOcommit_after)
" How many writes is too many.
  let g:YUNOcommit_after = 10
endif

let s:max_writes = g:YUNOcommit_after

let s:branch = ''
let s:commit = ''
let s:writes = 0

function! s:checkCommits()

    let branch = system('git rev-parse --abbrev-ref HEAD')
    let commit = system('git rev-parse --verify HEAD')

    if s:branch !=# branch || s:commit !=# commit
        let s:writes = 0
    endif

    let s:branch = branch
    let s:commit = commit

    if s:writes >= s:max_writes
        echohl Error
        redraw
        " echo 'ლ(ಠ_ಠლ) Y U NO commit?????'
        echo 'Y U NO commit?????'
        echo 'Y U NO COMMIT !!!!!!!!????????????'
        echo '░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░'
        echo '░░░░░░░░░░░░▄▄▄█▀▀▀▀▀▀▄▄▄░░░░░░░░░'
        echo '░░░░░░░░░▄█▀▀░░░░░░░░░░░▀▀█▄▄░░░░░'
        echo '░░░░░░░▄█▀░░░░░░▄▄▄░░░░░░░░▄▀█▄░░░'
        echo '░░░░░░░█░░░░░░░░░░▀▀▄░░░░▄▀▀░░░█▄░'
        echo '░░░░░░█░░░░░░░░░▄█▀▀▀█▄░▄█▀▀▀█▄░▀▄'
        echo '░░░░░█░░░░░░░░░░██░▀░██░██░▀░██░░█'
        echo '░░░░░█░░░░░░░░░░▀█████▀░▀█████▀░░█'
        echo '░░░░░█░░░░░░░░░░░░░░░░▄░░░░█░░░░░█'
        echo '░░░░░█░░░░░░░░░░░░░░░░██▀▀▀▀█░░░░█'
        echo '░░░░░█░░░░░░░░░░░░░░░█░▄▀▄▄▄▀░░░░█'
        echo '░░░░░█░░░░░░░░░░░░░░░▄█▀▀▀▀▄░░░░░█'
        echo '░░░░░█▄░░░░░░░░░░░░░░█▄█▄█▄█░░░░░█'
        echo '░░░░░░█▄░░░░░░░░░░░░▄▀█████▀░░░░▄▀'
        echo '░░░░░░▄█▄░░░░░░░░░░░░░░░░░░░░░▄█▀░'
        echo '░░░░▄█▀▄░░▀▄▄░░▄▄░░░░░░░▀▀▀▄▄▀▀░░░'
        echo '░░▄█▀░░░▀▄░░░▀▀▀██▄▄▄▄▄▄█▀▀░░░░▄▄░'
        echo '▄▀░░░░░░░░█░░░░░░░▄█▀▄░▄▄▄░░░░▀██▀'
        echo '▀░░░░░░░░░░█▄░░░░▄█▄▄▄█████▄▄▄▀▀░░'
        echo '░░░░░░░░░░░░░▀▀▀█▀▀▀▀▀░▀██▀░░░░░░░'
        echo '░░░░░░░░░░░░░░░▄▀░░░░░░░░░░░░░░░░░'
        echohl None
    endif

    if s:branch !~# '^fatal'
        let s:writes = s:writes + 1
    endif
endf

augroup YUNOcommit
    autocmd!
    autocmd BufWritePost * call s:checkCommits()
augroup END

