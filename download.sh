git clone https://github.com/letdummer/scripts.git

mv scripts/header_make.sh $HOME
rm -rf scripts

RC_FILE="$HOME/.zshrc"

if [ "$(uname)" != "Darwin" ]; then
	RC_FILE="$HOME/.bashrc"
	if [[ -f "$HOME/.zshrc" ]]; then
		RC_FILE="$HOME/.zshrc"
	fi
fi

if [ $(cat $RC_FILE | grep 'header_make.sh' | wc -l) -eq 0 ] 
then
	echo -e "\nalias ham=\"bash $HOME/header_make.sh\"" >> "$RC_FILE"
fi

exec "$SHELL"
