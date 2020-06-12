# ChromonomerBox

A basic Ubuntu container with Apache, PHP and chromonomer installed.

## Usage

### Prepare

First check out this repo:

```
git clone git@github.com:jdhayes/chromonomerbox.git
cd chromonomerbox
```

Create work directory and set mount points:

```
mkdir 20150603
export SINGULARITY_BINDPATH=${PWD}/20150603:/usr/local/share/chromonomer/php/20150603
```

### Run Analysis

```
chromonomer -p ~/research/20150603_linkage_map.tsv \
    -o ~/research/20150603/ -s ~/research/markers.sam \
    -a ~/research/final.assembly.agp --data_version 20150603
```

### View Web
You can start the Chromonomer web interface with the following script:

```
./apache_ctrl.sh start
```

Stopping the web interface is just as simple:

```
./apache_ctrl.sh stop
```
