:if has("terminfo")
:  set t_Co=8
:  set t_Sf=[3%p1%dm
:  set t_Sb=[4%p1%dm
:else
:  set t_Co=8
:  set t_Sf=[3%dm
:  set t_Sb=[4%dm
:endif
syntax enable
colo desert
set sm
set sw=2
set noai
set cindent
set expandtab
set pastetoggle=<F12>
"set paste
set bs=2
set ruler
set complete=.,w,b,u,t,]
set completeopt=preview
set hidden

map <F8> :!ut_ctags<CR>
map! <F8> <ESC>:!ut_ctags<CR>
set tags=~/source/.tags,./tags,./TAGS,tags,TAGS,.tags,~/.tags,~/.TAGS

map <F9> :!ut_lib %<CR>
map! <F9> <ESC>:!ut_lib %<CR>
map <F10> :!ut_build %<CR>
map! <F10> <ESC>:!ut_build %<CR>

if has("folding")
  set foldmethod=indent
  set foldlevel=99
endif " has("folding")

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  autocmd BufRead web_* map <F10> :!ut_lib % && ut_build web_om<CR>
  autocmd BufRead web_* map! <F10> <ESC>:!ut_lib % && ut_build web_om<CR>

  autocmd BufRead web_om.c map <F10> :!ut_build web_om<CR>
  autocmd BufRead web_om.c map! <F10> <ESC>:!ut_build web_om<CR>

  autocmd BufRead web_status_* map <F10> :!ut_lib % && ut_build web_status<CR>
  autocmd BufRead web_status_* map! <F10> <ESC>:!ut_lib % && ut_build web_status<CR>

  autocmd BufRead oi_* map <F10> :!ut_lib % && ut_build web_moi<CR>
  autocmd BufRead oi_* map! <F10> <ESC>:!ut_lib % && ut_build web_moi<CR>

  autocmd BufRead web_status.c map <F10> :!ut_build web_status<CR>
  autocmd BufRead web_status.c map! <F10> <ESC>:!ut_build web_status<CR>

  autocmd BufRead web_loi_* map <F10> :!ut_lib % && ut_build web_loi<CR>
  autocmd BufRead web_loi_* map! <F10> <ESC>:!ut_lib % && ut_build web_loi<CR>

  autocmd BufRead web_loi.c map <F10> :!ut_build web_loi<CR>
  autocmd BufRead web_loi.c map! <F10> <ESC>:!ut_build web_loi<CR>

  autocmd BufRead web_setup.c map <F10> :!ut_build %<CR>
  autocmd BufRead web_setup.c map! <F10> <ESC>:!ut_build %<CR>

  autocmd BufRead web_roi* map <F10> :!ut_lib % && ut_roi<CR>
  autocmd BufRead web_roi* map! <F10> <ESC>:!ut_lib % && ut_roi<CR>

  autocmd BufRead web_moi* map <F10> :!ut_lib % && ut_build web_moi<CR>
  autocmd BufRead web_moi* map! <F10> <ESC>:!ut_lib % && ut_build web_moi<CR>

  autocmd BufRead rdt* map <F10> :!ut_lib % && ut_build rdt_control<CR>
  autocmd BufRead rdt* map! <F10> <ESC>:!ut_lib % && ut_build rdt_control<CR>

  autocmd BufRead *.js map <F10> :!web_setup<CR>
  autocmd BufRead *.js map! <F10> :<ESC>!web_setup<CR>

  autocmd BufRead *.css map <F10> :!web_setup<CR>
  autocmd BufRead *.css map! <F10> :<ESC>!web_setup<CR>

endif " has("autocmd")

map <C-F> :!grep -n <cword> *.c *.h > .vimfind<CR> :10sp .vimfind<CR> <C-W>r<CR>

:filetype plugin on

if has("autocmd")

  autocmd BufRead *.plugin set filetype=plugin
  autocmd BufRead sdf.txt set filetype=sdf
  autocmd BufRead df_alias.txt set filetype=df_alias
  autocmd BufRead df_proj_alias.txt set filetype=df_alias

  " Standard export filenames for system config
  autocmd BufRead *.menu_config set filetype=datascript
  autocmd BufRead *.screen_settings set filetype=datascript
  autocmd BufRead *.settings set filetype=datascript

endif " has("autocmd")

" Turn on persistent undo
if has('persistent_undo')
  set undofile
  set undodir=$HOME/.vim/vimundo
endif " has('persistent_undo')

" Lastly, look for user configuration in $HOME/profile directory
" First choice: $WEB_PROJECT_NAME-$HOST.vimrc
" Second choice: $HOST.vimrc

let home_str = $HOME
let web_project_name_str = $WEB_PROJECT_NAME
let host_str = $HOST
let config_found = 0

if ( strlen( home_str ) > 0 )
  if ( strlen( host_str ) > 0 )

    if ( strlen( web_project_name_str ) > 0 )
      let config_file = home_str . "/profile/" . web_project_name_str . "-" . host_str . ".vimrc"
      if ( filereadable( config_file ) )
        let config_found = 1
      endif
    endif

    if ( config_found == 0 )
      let config_file = home_str . "/profile/" . host_str . ".vimrc"
      if ( filereadable( config_file ) )
        let config_found = 1
      endif
    endif

  endif
endif

if ( config_found == 1 )
  execute ':source ' config_file
endif
