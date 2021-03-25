#!/bin/bash
rawFile="../data/sampledata.dat"
fiveNums=$(<"$rawFile" Rscript -e 'fivenum (as.numeric (readLines ("stdin")))')
echo $fiveNums >> "../results/summary.txt"
