# ViralFlow-testes


## Testes ART
- Comando utilizado para executar em loop o ART:
for file in $(find ./ -type f -name "*.fasta"); do     output="${file%.fasta}.output";     art_illumina -ss HS25 -sam -i "$file" -p -l 150 -f 500 -m 200 -s 0 -o "$output"; done


## Rodar scripts:
- chmod +x "script.sh"
- ./"script.sh"

## Nomenclatura das pastas:
- RESULTS_1_viralflow1
- RESULTS_2_viralflow1
- RESULTS_3_viralflow1

- RESULTS_1_viralflow006
- RESULTS_2_viralflow006
- RESULTS_3_viralflow006

