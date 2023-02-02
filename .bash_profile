# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

if [ -f "$HOME/bin/ut_profile" ]
then
  . $HOME/bin/ut_profile
elif [ -f "$HOME/source/ut_profile.sh" ]
then
  . $HOME/source/ut_profile.sh
elif [ -f "~/source/ut_profile.sh" ]
then
  . ~/source/ut_profile.sh
else
  . ~/bin/ut_profile
fi

export TERM=xterm




