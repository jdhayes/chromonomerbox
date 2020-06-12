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

%runscript
    /usr/local/bin/chromonomer

