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


### igraph/python
COPY requirements.txt /root/requirements.txt
RUN python -m pip install --upgrade pip && \
    python -m pip install -r /root/requirements.txt

### velvet
#### TODO: figure out next steps to install binaries; there is no 'install' action in the 
#### makefile. Also, see if this is one of those things that needs the binaries to stay 
#### in the build dir for REASONS.
RUN mkdir -p /tmp/build/velvet && \
    cd /tmp/build/velvet && \
    wget https://github.com/dzerbino/velvet/archive/refs/tags/v1.2.10.tar.gz && \
    ls && \
    tar xfz ./v1.2.10.tar.gz && \ 
    cd velvet-1.2.10 && \
    make && \
### oases
### BLAST
### Evigene
### Busco
### Hmmer
RUN apt-get install -y hmmer
### Augustus
### bamtools
### QUAST
### Transdecoder
### Trinotate






## Install the de-novo-transcriptome-assembly-pipeline
# git clone specific hash



## Do last
RUN ldconfig

