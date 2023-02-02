# .bashrc

# source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# ensure that interface_ws_lib_ref.h exists to avoid conflicts with atf customer host messages
if [ ! -f /home/dm1931_proj/work/include/interface_ws_lib_ref.h ]; then
  touch /home/dm1931_proj/work/include/interface_ws_lib_ref.h
fi

# ensure that interface_ws_lib_ref.h:23 is commented to avoid 'atf make' conflicts
if sed -n '23p' /home/dm1931_proj/work/include/interface_ws_lib_ref.h | grep -vq "^\/\/"; then
  sed -i '23 s/^/\/\//' /home/dm1931_proj/work/include/interface_ws_lib_ref.h
fi


# colour scheme(s)
export GREP_COLORS="ms=38;2;119;221;119:fn=38;2;106;178;202"
export LS_COLORS="rs=0:di=38;2;59;178;227:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=01;05;37;41:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=38;2;128;227;125:*.tar=38;2;251;103;98:*.tgz=38;2;251;103;98:*.arc=38;2;251;103;98:*.arj=38;2;251;103;98:*.taz=38;2;251;103;98:*.lha=38;2;251;103;98:*.lz4=38;2;251;103;98:*.lzh=38;2;251;103;98:*.lzma=38;2;251;103;98:*.tlz=38;2;251;103;98:*.txz=38;2;251;103;98:*.tzo=38;2;251;103;98:*.t7z=38;2;251;103;98:*.zip=38;2;251;103;98:*.z=38;2;251;103;98:*.Z=38;2;251;103;98:*.dz=38;2;251;103;98:*.gz=38;2;251;103;98:*.lrz=38;2;251;103;98:*.lz=38;2;251;103;98:*.lzo=38;2;251;103;98:*.xz=38;2;251;103;98:*.bz2=38;2;251;103;98:*.bz=38;2;251;103;98:*.tbz=38;2;251;103;98:*.tbz2=38;2;251;103;98:*.tz=38;2;251;103;98:*.deb=38;2;251;103;98:*.rpm=38;2;251;103;98:*.jar=38;2;251;103;98:*.war=38;2;251;103;98:*.ear=38;2;251;103;98:*.sar=38;2;251;103;98:*.rar=38;2;251;103;98:*.alz=38;2;251;103;98:*.ace=38;2;251;103;98:*.zoo=38;2;251;103;98:*.cpio=38;2;251;103;98:*.7z=38;2;251;103;98:*.rz=38;2;251;103;98:*.cab=38;2;251;103;98:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=01;36:*.au=01;36:*.flac=01;36:*.mid=01;36:*.midi=01;36:*.mka=01;36:*.mp3=01;36:*.mpc=01;36:*.ogg=01;36:*.ra=01;36:*.wav=01;36:*.axa=01;36:*.oga=01;36:*.spx=01;36:*.xspf=01;36:"

# user specific aliases and functions
alias grep='grep --exclude="*.tags" --exclude="*.enummap" --exclude="*.vimfind" --exclude="*.orig" --color'
alias sm_startup='sm_startup --yes-to-all'



# extra notes

# file: test_centre/fitness/validate.sh
# line: 36 
# action: surround with curley brackets, append "1>/dev/null 2>&1" to closing bracket.
# reason: it stops ATF-validate printing INFO statements to the terminal, spamming the screen. 
