#!/bin/bash

# Caminho absoluto para o arquivo "ArticV3.bed" (alterar para outro arquivo)
bed_file="$PWD/ArticV3.bed"

# Verifica se o arquivo "ArticV3.bed" existe (alterar para outro arquivo)
if [ ! -f "$bed_file" ]; then
  echo "Erro: O arquivo ArticV3.bed não foi encontrado em $bed_file."
  exit 1
fi

echo "Arquivo.bed encontrado em: $bed_file"

# Executa o comando /usr/bin/time -v <comando>, redirecionando a saída para o awk
echo "Executando nextflow run..."

# Adicione essas duas linhas para exibir o comando que está sendo executado
echo "Comando a ser executado:"
echo "/usr/bin/time -v nextflow run /home/ubuntu/ViralFlow/vfnext/main.nf \
                      --primersBED \"$bed_file\" \
                      --referenceGenome reference.fasta \
                      --inDir ./ \
                      --outDir \"$PWD/RESULTS\" \
                      --writeMappedReads true --virus sars-cov2 --runSnpEff true -resume \
                      --nextflowSimCalls 96"

# Execute o comando e capture a saída
output=$(/usr/bin/time -v nextflow run /home/ubuntu/ViralFlow/vfnext/main.nf \
                      --primersBED "$bed_file" \
                      --referenceGenome reference.fasta \
                      --inDir ./ \
                      --outDir "$PWD/RESULTS" \
                      --writeMappedReads true --virus sars-cov2 --runSnpEff true -resume \
                      --nextflowSimCalls 96 2>&1 | awk -F': ' '/Elapsed \(wall clock\) time/ { printf "%s\t", $2 } \
                                                                                 /Maximum resident set size/ { printf "%s\t", $2 } \
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

echo "Script finalizado."

