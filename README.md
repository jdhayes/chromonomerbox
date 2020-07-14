# ChromonomerBox

A basic Ubuntu container with Apache, PHP and chromonomer installed.

## Install

First you will need to install singularity on a Linux machine that you have root privileges on.

Once singularity is installed, download the singularity definition and build image:

```bash
wget -O Singularity https://raw.githubusercontent.com/jdhayes/chromonomerbox/master/Singularity
sudo singularity build chromonomerbox.sing Singularity # Root privileges are required
```

Then transfer the `chromonomerbox.sing` image to a remote machine (or cluster):

```bash
scp chromonomerbox.sing username@cluster.hpcc.ucr.edu:chromonomerbox.sing
```

After the transfer has completed, log into the cluster and check out this repo:

```bash
ssh username@cluster.hpcc.ucr.edu
git clone git@github.com:jdhayes/chromonomerbox.git /path/to/chromonomerbox
```

Then move your singularity image to the images directory of the repo:

```bash
mv chromonomerbox.sing /path/to/chromonomerbox/images/
```

Lastly add chromonomerbox images and scripts directory to your PATH:
   
   ```bash
   export PATH=/path/to/chromonomerbox/images:/path/to/chromonomerbox/scripts:$PATH
   ```

Consider adding the above export line to your `~/.bashrc` file to make this permanent.

## Usage

### Prepare


Create work directory and set mount points:

```
module load singularity
cd /path/to/chromonomerbox
mkdir 20150603
export SINGULARITY_BINDPATH=${PWD}/20150603:/usr/local/share/chromonomer/php/20150603,$SINGULARITY_BINDPATH
```

### Run Analysis

This example came directly from chromonomer website [Chromonomer Usage](http://catchenlab.life.illinois.edu/chromonomer/manual/#exec):

```bash
chromonomer -p ~/research/20150603_linkage_map.tsv \
    -o ~/research/20150603/ -s ~/research/markers.sam \
    -a ~/research/final.assembly.agp --data_version 20150603
```

Example data can be downloaded from [here](https://creskolab.uoregon.edu/pipefish/).

### View Web

Assuming you still have the proper mount points defined in `SINGULARITY_BINDPATH`, you can start the Chromonomer web interface with the following script:

```bash
apache_ctrl.sh start
```

Stopping the web interface is just as simple:

```bash
apache_ctrl.sh stop
```
