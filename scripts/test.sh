#!/usr/bin/env bash

for src in $(ls -Ap ../symlinks)
do
    dst="$HOME/$(basename "${src}")"
    filePath="$(realpath ${src})"
    echo "source $filePath"
    echo "dest $dst"
    #link_file "$src" "$dst"
done