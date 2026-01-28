nNumero01 := 5
nNumero02 := 7

clear
@00,00 say "O numero A inicia em:" + str(nNumero01,2,0)
@01,00 say "O numero B inicia em:" + str(nNumero02,2,0)

@03,00 say "Adicionaremos uma variavel auxiliar, e atribuiremos ela o valor de A"

nAux := nNumero01
nNumero01 := nNumero02
nNumero02 := nAux

@04,00 say "Logo Aux:" + str(nAux,2,0)

@06,00 say "Agora, farmos A receber o valor de B, e B o valor de Aux, podendo assim deletar Aux."

@07,00 say "--------------"
@08,00 say "agora temos que:"
@09,00 say "Aux: Null"
@10,00 say "A:" + str(nNumero01,2,0)
@11,00 say "B:" + str(nNumero02,2,0)



/*
Apenas uma prova de que ‚ poss¡vel, favor ignorar

? "A:" + Str(nNumero01,02,0)
? "B:" + Str(nNumero02,02,0)

nNumero01 := nNumero01 + nNumero02

? "Soma:" + Str(nNumero01,02,0)

nNumero02 := nNumero01-nNumero02
nNumero01 := nNumero01-nNumero02


? "A:" + Str(nNumero01,02,0)
? "B:" + Str(nNumero02,02,0)
*/




