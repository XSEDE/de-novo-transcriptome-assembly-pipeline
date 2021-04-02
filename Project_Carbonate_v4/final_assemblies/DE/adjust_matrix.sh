#join all files by name of transcript, but keep only fifth column (tpm)

#copy the first column of one of your sample outputs into tmp to create a list of transcripts:
awk '{print $1}' Sample12_treat_kallisto/abundance.tsv | sed 1d | sort > tmp

#loop through the samples and merge them into the list
for f in *_kallisto/abundance.tsv; do join -1 1 -2 1 tmp <(awk '{print $1,$5}' $f | sed 1d | sort) > tmp2; mv tmp2 tmp; done

###NEEDS TO BE CHANGED!!!###
#change this based on your sample names to be used in samples_described
echo " T12 T5 C14 C2" > matrix
cat tmp >> matrix

#cleanup
rm tmp

#make tabs
sed -i 's/\ /\t/g' matrix
