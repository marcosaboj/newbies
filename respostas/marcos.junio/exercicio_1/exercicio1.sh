#!/bin/bash
primeiro_caracter=""
r=0
l=0
contador=0
linhaParaExcluir=0

while read linha
do

primeiro_caracter=${linha:0:1}
traco=""
contTraco=0
let contador=$contador+1; 
if [ "$primeiro_caracter" == "r" ]; then
	let r=$r+1;
	traco=${linha:6:5}
	for i in $traco; do
		if [ $i == "-" ]; then
			let contTraco=$contTraco+1;
		fi
	done
fi

if [ "$primeiro_caracter" == "l" ]; then
	let l=$l+1;	
	traco=${linha:5:5}
	for i in $traco; do
		if [ $i == "-" ]; then
			let contTraco=$contTraco+1;
		fi
	done
fi
if [ $contTraco != 2 ]; then
	sed -i "$contador"'d' jan_95.txt
fi

done < jan_95.txt

echo "Requisições Locais: "$l
echo "Requisições Remotas: "$r
