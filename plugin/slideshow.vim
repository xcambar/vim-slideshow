"
" Slideshow mode
"
let s:hidden_all = 0
let s:slideshow_title = ''
function! ToggleHiddenAll(title)
    if s:hidden_all  == 0
        let s:hidden_all = 1
        let s:slideshow_title = a:title
        set noshowmode
        set noruler
        set laststatus=0
        set nonumber
        set scrolloff=0
        nnoremap j :call DownInSlide()<cr>
        nnoremap k :call UpInSlide()<cr>
        nnoremap J :call NextSlideFn()<cr>
        nnoremap K :call PreviousSlideFn()<cr>
        echo s:slideshow_title
    else
        let s:hidden_all = 0
        let s:slideshow_title = ''
        set showmode
        set ruler
        set laststatus=2
        set number
        set scrolloff=8
    endif
endfunction

command! -nargs=1 Slideshow :call ToggleHiddenAll(<f-args>)

function! NextSlideFn()
  cal cursor(line('.') + winheight(0) - (line('.') % winheight(0)) + 1, 1)
  silent exe "normal! zt"
  redraw
  echo s:slideshow_title
endfunction

function! PreviousSlideFn()
  let l:position = line('.') % winheight(0)
  if l:position == 1
    let l:newLine = line('.') - winheight(0) - l:position + 1
  else
    let l:newLine = line('.') - l:position + 1
  endif
  cal cursor(max([l:newLine, 1]), 1)
  silent exe "normal! zt"
  redraw
  echo s:slideshow_title
endfunction

function! DownInSlide()
  let l:position = line('.') % winheight(0)
  if l:position != 0
    silent exe "normal! j"
  endif
  redraw
  echo s:slideshow_title
endfunction

function! UpInSlide()
  let l:position = line('.') % winheight(0)
  if l:position != 1
    silent exe "normal! k"
  endif
  redraw
  echo s:slideshow_title
endfunction

