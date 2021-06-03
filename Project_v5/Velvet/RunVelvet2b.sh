#!/bin/bash 

#SBATCH -J RunVelvet2b                                  
#SBATCH -p trinity
#SBATCH -o Velvet2b_%j.log
#SBATCH -e Velvet2b_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=ss93@iu.edu
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=2
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
velvetg oases.65 -read_trkg yes &
velvetg oases.75 -read_trkg yes &
velvetg oases.85 -read_trkg yes &

wait

sbatch RunVelvet3b.sh
