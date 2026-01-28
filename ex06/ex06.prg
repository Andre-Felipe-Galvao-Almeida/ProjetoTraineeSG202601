nValor01 := 0
nValor02 := 0
nValor03 := 0

clear

@00,00 say "Insira os Valores a serem calculados"
@01,00 say "Valor 1:"
@02,00 say "Valor 2:"
@03,00 say "Valor 3:"

@25,00 say "Favor inserir valores de apenas 2 digitos pois n∆o tem tratamento de inputs"

@01,09 get nValor01
@02,09 get nValor02
@03,09 get nValor03
read

clear

nSoma := nValor01 + nValor02

@00,00 say str(nValor01,2,0) + "+" + str(nValor02,2,0)+":"
@01,00 say str(nSoma,2,0)

wait
@03,00 say str(nSoma,4,0) + "+" + str(nValor03,2,0)
nSoma += nValor03
@04,00 say str(nSoma,2,0)

wait
clear
@00,00 say str(nSoma,4,0) + "/3:"
nMedia := nSoma/3
@01,00 say str(nMedia,2,0)


