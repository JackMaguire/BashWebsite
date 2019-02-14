#!/bin/bash

source ~/.bashrc
file=jack.html
tempfile=temp.html

while true; do

    cp ingredients/beginning $tempfile

    for script in scripts/*.sh; do
	cat ingredients/seg1 >> $tempfile
	echo $script | awk -F/ '{print $NF}' >> $tempfile
	cat ingredients/seg2 >> $tempfile
	bash $script | sed 's/$/<br>/g' >> $tempfile
	cat ingredients/seg3 >> $tempfile
    done

    cat ingredients/end >> $tempfile

    mv $tempfile $file

    sleep 60
done
