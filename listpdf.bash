#! /bin/bash

select FILE in `ls -A | grep ".pdf$" | tr " " "*"` 
do
	evince "`echo $FILE | sed 's/*\| /\\ /g'|sed 's/&/\\&/g'|sed 's/(/\\(/g'|sed 's/)/\\)/g'`"
	#Change evince for your pdf viewer.
	#You may have to change a little the sed commands according to your needs.
done
