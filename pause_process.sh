#!/bin/sh
# a script to pause processes so they can be attached to a debugger
# this needs to be tweaked based on what bins are on the system

# kills the current process
ID=$(ps | grep <process_name> | grep -v grep | grep -v sh | cut -d ' ' -f 2)
kill $ID


# runs and waits for the process to restart
# when it finds it it stops it and prints the new process PID
while [ 1 ]
do
  PID=$(ps | grep <process_name> | grep -v grep | grep -v sh | cut -d ' ' -f 2)
	if [ "$PID" != "" ] && [ "$ID" != "$PID" ]
	then
		kill -STOP $PID
		echo "PID: $PID"
		break
	fi
done
