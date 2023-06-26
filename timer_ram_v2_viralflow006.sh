#!/bin/bash

# Executa o comando /usr/bin/time -v < comando >, redirecionando a saída para o awk
output=$(/usr/bin/time -v viralflow --runContainer -inArgsFile vf_args.in -singPath /home/redegenomicaceara/ViralFlow006/ViralFlow/singularity \                                                                                           -containerImg /home/pjeronimo/ViralFlow006/ViralFlow/viralflow_container/ 2>&1 | awk -F': ' '/Elapsed \(wall clock\) time/ { printf "%s\t", $2 }
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

