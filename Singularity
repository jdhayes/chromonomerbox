BootStrap: library
From: ubuntu:18.04

%post
    # Update Ubuntu
    apt update -y

    # Install various softwares
    apt install -y build-essential zlib1g zlib1g-dev wget apache2 php libapache2-mod-php

    # Download Chromonomer
    wget http://catchenlab.life.illinois.edu/chromonomer/source/chromonomer-1.11.tar.gz
    
    # Install Chromonomer
    tar xfvz chromonomer-1.11.tar.gz
    cd chromonomer-1.11
    ./configure
    make
    make install

    # Set build date
    NOW=$(date)
    echo "export NOW=\"${NOW}\"" >> $SINGULARITY_ENVIRONMENT

%runscript
    # Print build date
    echo "Container was created $NOW"

    # Check name
    if [ "$SINGULARITY_NAME" = 'chromonomer' ]; then
        cmd="/usr/local/bin/chromonomer"
    else
        cmd=""
    fi

    # Parse args and re-insert quotes for final command
    for arg in "$@"; do
        echo $arg | grep -P '\s' >/dev/null
        ecode=$?
        if [ $ecode -eq 0 ]; then
            cmd="$cmd '$arg'"
        else
            cmd="$cmd $arg"
        fi
    done

    ${cmd}

