#!/bin/bash

# Executa o comando /usr/bin/time -v < comando >, redirecionando a saída para o awk
output=$(/usr/bin/time -v nextflow run /home/redegenomicaceara/ViralFlow/vfnext/main.nf \                                                                                                                                                                    --referenceGenome reference.fasta\                                                                                                                                                                                   --inDir ./ \                                                                                                                                                                                                       --outDir $PWD/RESULTS \                                                                                                                                                                                                                                                                                                                                                                      --writeMappedReads true --virus sars-cov2 --runSnpEff true -resume \                                                                                                                                               --nextflowSimCalls 96 2>&1 | awk -F': ' '/Elapsed \(wall clock\) time/ { printf "%s\t", $2 }
                                                        /Maximum resident set size/ { printf "%s\t", $2 }
                                                        /Average resident set size/ { printf "%s\n", $2 }')

# Define os nomes das colunas
headers="tempo_decorrido\tMaximum resident set size\tAverage resident set size"

# Define o nome do arquivo de saída
output_file="output.tsv"

# Verifica se o arquivo de saída já existe
if [ ! -f "$output_file" ]; then
  # Cria o arquivo e adiciona os cabeçalhos
  echo -e "$headers" > "$output_file"
fi

# Adiciona a linha de saída ao arquivo
echo -e "$output" >> "$output_file"

