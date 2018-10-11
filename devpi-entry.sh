#!/bin/sh
if [ ! -f .serverversion ]
then 
	devpi-server --serverdir . --init
fi

devpi-server --serverdir . --host=0.0.0.0
