# ViralFlow-testes


## Testes ART
- Comando utilizado para separar um FASTA em vários: awk '/^>/{filename=sprintf("output_%d.fasta",++count)} {print > filename}' seu_arquivo.fasta
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
![image](https://github.com/ACMElab-Fioce/ViralFlow-testes/assets/98467661/9d4b194b-e20b-457e-a294-624f797be617)


## ViralFlow 1.0 (AWS Cloud9 - 8Gb RAM)
![image](https://github.com/ACMElab-Fioce/ViralFlow-testes/assets/98467661/0736bd87-4051-485d-8320-2b28965df26b)



