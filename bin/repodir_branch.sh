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
	if [ -a "${ri}/.git/index" ]
	then
	    branch=$(git rev-parse --abbrev-ref HEAD)
	    name=$(basename `git rev-parse --show-toplevel`)
	    printf "${name}\t${branch}\n"
	fi
    fi
done

cd ${odir}
