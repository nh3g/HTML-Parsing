#!/bin/bash

if [ "$1" == "" ]
  then 
	echo "===================="
	echo "HTML PARSING - NH3G"
	echo "===================="
	echo "modo de uso: $0 URL"
	echo "exemplo: $0 exemple.com"
  else
	echo "========================================================="
	echo "Analisando $1...                                         "
	echo "========================================================="
       	mkdir Indexes
	cd Indexes
	echo "=========================="
	echo "Baixando dados..."
	echo "=========================="
	wget $1;
	cat *.html | grep href | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v "<l" > URLs.txt
	rm *.html
       	echo "=============="
	echo "IPs | Address"
	echo "=============="
for URL in $(cat URLs.txt);
do host $URL | grep -v "timed out";
done
fi
