#!/bin/sh
if [ ! -f .serverversion ]
then 
	devpi-server --serverdir . \
				--init \
				--storage pg8000:host=$DB_HOST,port=$DB_PORT,database=$DB_NAME,user=$DB_USER,password=$DB_PASSWORD
fi

devpi-server --serverdir . --host=0.0.0.0 --storage pg8000:host=$DB_HOST,port=$DB_PORT,database=$DB_NAME,user=$DB_USER,password=$DB_PASSWORD
