#!/bin/bash -l

cd $(dirname $0)

if [[ $1 == 'start' ]]; then

    # Start Apache
    export SINGULARITYENV_PORT=$(shuf -i8000-9999 -n1)
    echo 'Starting Apache...'
    singularity exec chromonomer.img apache2 -f /home/jhayes/hpcc/singularity/chromonomer/config/httpd.conf && echo 'Started'
    echo "Please configure your SSH tunnel and navigate to http://localhost:${SINGULARITYENV_PORT}/chromonomer/"

elif [[ $1 == 'stop' ]]; then

    # Stop Apache by killing PID
    if [[ -f logs/httpd.pid ]]; then
        echo 'Stopping Apache...'
        kill $(cat logs/httpd.pid) && echo 'Killed'
    else
        echo 'No PID file found at logs/httpd.pid'
    fi

else

    # Print usage
    echo -e "USAGE: $(basename $0) <start|stop>"

fi

