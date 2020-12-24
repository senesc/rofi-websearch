#!/bin/bash

runBackground() {
	eval "$@" &>/dev/null & disown
	exit 0
}

rawurlencode() {
  local string="${1}"
  local strlen=${#string}
  local encoded=""
  local pos c o

  for (( pos=0 ; pos<strlen ; pos++ )); do
     c=${string:$pos:1}
     case "$c" in
        [-_.~a-zA-Z0-9] ) o="${c}" ;;
        * )               printf -v o '%%%02x' "'$c"
     esac
     encoded+="${o}"
  done
  echo ${encoded}
}

if [ $ROFI_RETV -eq 0 ]
then
	echo -e "\0delim\x1f\t"
	echo -en "\0prompt\x1fSearch\t"
	echo -en "\0message\x1fUsage: [browser][search engine] [keyword]\n       [browser] [url]\t"
	echo -en "c - chromium\t"
	echo -en "v - vivaldi\t"
	echo -en "f - firefox\t"
	echo -en "[x]g - google\t"
	echo -en "[x]d - duckduckgo\t"
	echo -en "[x]az - amazon\t"
	echo -en "[x]n - netflix\t"
	echo -en "[x]gd - google drive\t"
	echo -en "[x]y - youtube\t"
	echo -en "[x]gh - github\t"
	echo -en "[x]gn - genius\t"

elif [ $ROFI_RETV -eq 2 ]
then
	cmd=$BROWSER
	firstWord=$(echo "$@" | cut -f1 -d ' ')
	case x"$(echo $firstWord | cut -c1)" in
		x"c") cmd="chromium ";;
		x"C") cmd="chromium --new-window ";;
		x"v") cmd="vivaldi-stable ";;
		x"V") cmd="vivaldi-stable --new-window ";;
		x"f") cmd="firefox ";;
		x"F") cmd="firefox --new-window ";;
	esac
	c2=$(echo $firstWord | cut -c2-)
	otherWords=$(echo $@ | cut -f2- -d ' ')
	if [[ x"$c2" == x"" ]]
	then
		cmd+=$otherWords
		runBackground $cmd
	else
		query=$(rawurlencode "$otherWords")
		case x"$c2" in
			x"g ") cmd+="https://google.com/search?q=$query"; runBackground $cmd;;
			x"d ") cmd+="https://duckduckgo.com/?q=$query"; runBackground $cmd;;
			x"az") cmd+="https://amazon.it/s?k=$query"; runBackground $cmd;;
			x"y ") cmd+="https://youtube.com/results?search_qyuery=$query"; runBackground $cmd;;
			x"gh") cmd+="https://github.com/search?q=$query"; runBackground $cmd;;
			x"gn") cmd+="https://genius.com/search?q=$query"; runBackground $cmd;;
			x"gd") cmd+="https://drive.google.com/drive/search?q=$query"; runBackground $cmd;;
			x"n") cmd+="https://www.netflix.com/search?q=$query"; runBackground $cmd;;
		esac
	fi
fi

