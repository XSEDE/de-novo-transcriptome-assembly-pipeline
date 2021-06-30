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
RUN python -m pip install --upgrade pip
COPY requirements.txt /root/requirements.txt
RUN python -m pip install -r /root/requirements.txt

### velvet
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

