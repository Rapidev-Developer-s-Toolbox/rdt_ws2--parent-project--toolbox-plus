#! /usr/bin/env bash
TARGET=''
find_system_modules () {
	touch "${HOME}/tmp-dfile1010"
	sudo find / -type d -name 'site-packages' 2>&/dev/null 1>&"${HOME}/tmp-dfile1010"
	for f in ${HOME}/tmp-dfile1010; do
		c
	done
}