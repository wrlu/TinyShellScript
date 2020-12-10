#!/bin/bash
if [ $# -eq 1 ];
then
    echo "Start..."
    echo "LABEL USER    UID PID CMD"
    maxpid=$(cat /proc/sys/kernel/pid_max)
    for pid in $(ps -Ao PID)
    do
        if [ "$pid" == "PID" ];
        then
            continue
        fi
        cat /proc/$pid/maps | grep $1 2>&1 > /dev/null
        if [ $? -eq 0 ];
        then
            ps -AZ -o USER,UID,PID,ARGS=CMD | grep $pid | grep -v "grep"
        fi
    done
else
    echo "Missing parameters, usage: cat_proc_maps.sh module_name."
fi
echo "Exit..."