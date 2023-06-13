# ViralFlow-testes


## Testes ART
- Comando utilizado para executar em loop o ART:
for file in $(find ./ -type f -name "*.fasta"); do     output="${file%.fasta}.output";     art_illumina -ss HS25 -sam -i "$file" -p -l 150 -f 500 -m 200 -s 0 -o "$output"; done
