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


## ViralFlow 006 (AWS Cloud9 - 8Gb RAM)
![image](https://github.com/ACMElab-Fioce/ViralFlow-testes/assets/98467661/31867c47-4f8b-43b4-a2dc-bbc532f19c1e)

## ViralFlow 1.0 (AWS Cloud9 - 8Gb RAM)


