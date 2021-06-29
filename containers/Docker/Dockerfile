FROM python:2.7.18-buster
# Debian Buster base OS
# Python 2.7.18

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
### velvet
### oases
### BLAST
### Evigene
### Busco
### Hmmer
### Augustus
### bamtools
### QUAST
### Transdecoder
### Trinotate






## Install the de-novo-transcriptome-assembly-pipeline
# git clone specific hash



## Do last
RUN ldconfig

