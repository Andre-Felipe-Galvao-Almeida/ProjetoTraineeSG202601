clear

nNum01 := 00
nNum02 := 00
nNum03 := 00
nNum04 := 00

@00,00 say "Insira 4 numeros com suas regras"

@01,10 say "Entre 15,25 e 28,28"
@02,10 say "Menor que o anterior"
@03,10 say "menor que o anterior"
@04,10 say "O produto dos anteriores"

@01,00 get nNum01 picture "@e 99.99"      valid (nNum01 >= 15.25 .and. nNum01 <= 28.28)
@02,00 get nNum02 picture "@e 99.99"      valid (nNum01 > nNum02)
@03,00 get nNum03 picture "@e 999.99"     valid (nNum02 > nNum03)
read



@25,00 say (nNum01*nNum02*nNum03)
@04,00 get nNum04 picture "@e 99999.9999999" valid (nNum04 = (nNum01*nNum02*nNum03))
read

