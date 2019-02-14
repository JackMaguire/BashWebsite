#!/bin/bash

source ~/.bashrc
file=jack.html
tempfile=temp.html

while true; do

    cp html_ingredients/beginning $tempfile

    for script in scripts/*.sh; do
	cat html_ingredients/seg1 >> $tempfile
	echo $script | awk -F/ '{print $NF}' >> $tempfile
	cat html_ingredients/seg2 >> $tempfile
	bash $script | sed 's/$/<br>/g' >> $tempfile
	cat html_ingredients/seg3 >> $tempfile
    done

    cat html_ingredients/end >> $tempfile

    mv $tempfile $file

    sleep 60
done
