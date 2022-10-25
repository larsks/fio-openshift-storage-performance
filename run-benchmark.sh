#!/bin/bash

: ${FIO_TARGET_PATH:=/target} 
: ${FIO_SIZE:=4G}

chmod -R a+rX .

set -ue

run_fio() 
{
	ls
	echo "test"
}