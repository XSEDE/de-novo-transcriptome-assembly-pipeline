FROM python:2.7.18-buster
# Debian Buster base OS
# Python 2.7.18

###### METADATA ######

LABEL authors = "Peter Vaillancourt (pzv2@cornell.edu), Eric Coulter (jecoulte@iu.edu)"

######################

## Use bash
SHELL ["/bin/bash","-c"]

## Ensuring only root user to prepare for singularity conversion
ARG USER=root
USER root
ARG HOME=/root

ARG DEBIAN_FRONTEND=noninteractive

## Install apt packages
RUN apt-get update -y && apt-get install -y \
    wget \
    unzip \
    git \
    time

RUN mkdir /opt/pipeline
WORKDIR /opt/pipeline

## Install Dependencies


### Trinity


### Bowtie2
### Samtools
### Jellyfish
### Salmon
### Kallisto
### Rsem
### SOAPdenovo2
### Abyss 
### TransAbyss
### blat
### R


#### All of the following are provided by pip:
### igraph/python
### QUAST
COPY requirements.txt /root/requirements.txt
RUN python -m pip install --upgrade pip && \
    python -m pip install -r /root/requirements.txt

#### Individual build sections:

### velvet
#### TODO: figure out next steps to install binaries; there is no 'install' action in the 
#### makefile. Also, see if this is one of those things that needs the binaries to stay 
#### in the build dir for REASONS.
RUN mkdir -p /tmp/build/velvet && \
    cd /tmp/build/velvet && \
    wget https://github.com/dzerbino/velvet/archive/refs/tags/v1.2.10.tar.gz && \
    tar xfz ./v1.2.10.tar.gz && \ 
    cd velvet-1.2.10 && \
    make 

### oases
#### Wow, this is sorta gross. oases links velvet as a submodule in git, but the release doesn't include it.
#### It might be more "correct" to git {clone,checkout <sha1>,reset --hard,checkout -b main,make} ?
####  but THEN we'll have velvet built in 2 places!
#### This also only runs make obj on the velvet dir, so it's not sufficient to build all of velvet.
RUN mkdir -p /tmp/build/oases && \
    cd /tmp/build/velvet &&\
    wget https://github.com/dzerbino/oases/archive/refs/tags/0.2.09.tar.gz && \
    tar xfz ./0.2.09.tar.gz && \ 
    cd oases-0.2.09 && \
    rmdir velvet && \
    ln -s /tmp/build/velvet/velvet-1.2.10 ./velvet && \
    make 
    
### BLAST
#### Hash checked against https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.11.0/ncbi-blast-2.11.0+-src.tar.gz.md5
#### The prefix question remains, but is an option with this one, unlike the others!
RUN mkdir -p /tmp/build/BLAST && \
    cd /tmp/build/BLAST && \
    wget https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.11.0/ncbi-blast-2.11.0+-src.tar.gz && \
    if [[ $(md5sum ./ncbi-blast-2.11.0+-src.tar.gz | cut -f 1 -d' ') == "13f93eea6741af2bbcc07f59941dc77b" ]]; then  echo "VERSION MATCHES"; else  exit 1; fi && \
    tar xvf ./ncbi-blast-2.11.0+-src.tar.gz && \
    cd ncbi-blast-2.11.0+-src/c++/ && \
    ./configure && \
    make

### Evigene
#### This is just a pile of scripts; at some point change /tmp/build to a real install dir
RUN mkdir -p /tmp/build/evigene && \
    cd /tmp/build/evigene && \
    wget https://downloads.sourceforge.net/project/evidentialgene/evigene20may20.tar && \
    tar xfv evigene20may20.tar

### Busco
### Hmmer
RUN echo -E "Package: hmmer \n Version: 3.2.1+dfsg-1 \n Pin-Priority: 999" > /etc/apt/preferences.d/hmmer && \
    echo -E "Package: hmmer-doc \n Version: 3.2.1+dfsg-1 \n Pin-Priority: 999" > /etc/apt/preferences.d/hmmer-doc && \
    apt-get install -y hmmer hmmer-doc

### bamtools
RUN echo -E "Package: bamtools \n Version: 2.5.1+dfsg-3 \n Pin-Priority: 999" > /etc/apt/preferences.d/bamtools && \
    echo -E "Package: libbamtools-dev \n Version: 2.5.1+dfsg-3 \n Pin-Priority: 999" > /etc/apt/preferences.d/libbamtools-dev && \
    apt-get install -y libbamtools-dev bamtools


### Augustus
RUN mkdir -p /tmp/build/augustus && \
    wget https://github.com/Gaius-Augustus/Augustus/releases/download/v3.4.0/augustus-3.4.0.tar.gz && \
    tar xfz augustus-3.4.0.tar.gz && \
    cd augustus-3.4.0

### Transdecoder
### Trinotate






## Install the de-novo-transcriptome-assembly-pipeline
# git clone specific hash



## Do last
RUN ldconfig

