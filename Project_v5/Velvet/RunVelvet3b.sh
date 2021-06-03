#!/bin/bash 

#SBATCH -J RunVelvet3b                                
#SBATCH -p trinity
#SBATCH -o Velvet3b_%j.log
#SBATCH -e Velvet3b_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=ss93@iu.edu
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=3
#SBATCH --cpus-per-task=1
#SBATCH --mem=200gb
#SBATCH --time=03:00:00 

##Move to correct WD
cd /home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/Velvet
source ../setup_files/path_set 

export PATH=/home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/software/Velvet:$PATH

#input define
reads=/home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/input_files/reads-norm.fq

##run code
oases oases.65 &
oases oases.75 &
oases oases.85 &

wait
