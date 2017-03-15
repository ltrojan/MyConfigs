#!/bin/bash

odir=$(pwd)

if [ $1 ]
then
    rdir=$(realpath ${1})
else
    rdir=$(pwd)
fi

for ii in $(ls -d ${rdir}/*/); do
    ri=$(realpath ${ii})
    cd ${ri}
    if [ -a "${ri}/.git" ]
    then
	echo "# ======= $ii "
	git status --porcelain
    fi
done

cd ${odir}
