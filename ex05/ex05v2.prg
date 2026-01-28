nNumero01 := 5
nNumero02 := 7

clear
@00,00 say "Escolha dois numeros para continuar a explicaá∆o."
@01,00 say "Valor 01:"
@02,00 say "Valor 02:"

@01,09 get nNumero01 picture '99'
@02,09 get nNumero02 picture '99'
read

clear
nAux := nNumero01
nInicioColuna1 := 1
nInicioColuna2 := 9


@00,00 say "Armazenaremos temporariamente o valor da variavel A em uma variavel auxiliar(Aux)"
@01,00 say "|-------|-------|"
@02,00 say "|-------|-------|"
@03,00 say "|-------|-------|"
@04,00 say "|-------|-------|"
@01,00 say "|-------|-------|"

@01,nInicioColuna1 say "Var"
@01,nInicioColuna2 say "Valor"

@02,nInicioColuna1 say "A"
@02,nInicioColuna2 say nNumero01 Picture "99"
@03,nInicioColuna1 say "B"
@03,nInicioColuna2 say nNumero02 Picture "99"
@04,nInicioColuna1 say "Aux"
@04,nInicioColuna2 say nAux      Picture "99"
wait
clear

nInicioColuna3 := 17


@00,00 say "Agora atribuiremos o valor de B a variavel A"
@01,00 say "|-------|-------|-------|"
@02,00 say "|-------|-------|-------|"
@03,00 say "|-------|-------|-------|"
@04,00 say "|-------|-------|-------|"
@01,00 say "|-------|-------|-------|"


@01,nInicioColuna1 say "Var"
@01,nInicioColuna2 say "Valor"
@01,nInicioColuna3 say "Atrib"

@02,nInicioColuna1 say "A"
@02,nInicioColuna2 say nNumero01 Picture "99"
@03,nInicioColuna1 say "B"
@03,nInicioColuna2 say nNumero02 Picture "99"
@04,nInicioColuna1 say "Aux"
@04,nInicioColuna2 say nAux      Picture "99"

nNumero01 := nNumero02
@02,nInicioColuna3 say nNumero01  Picture "99"
wait
clear

nInicioColuna3 := 17


@00,00 say "Ent∆o atribuimos o valor da Aux para Variavel B"
@01,00 say "|-------|-------|-------|"
@02,00 say "|-------|-------|-------|"
@03,00 say "|-------|-------|-------|"
@04,00 say "|-------|-------|-------|"
@01,00 say "|-------|-------|-------|"


@01,nInicioColuna1 say "Var"
@01,nInicioColuna2 say "Valor"
@01,nInicioColuna3 say "Atrib"

@02,nInicioColuna1 say "A"
@02,nInicioColuna2 say nNumero01 Picture "99"
@03,nInicioColuna1 say "B"
@03,nInicioColuna2 say nNumero02 Picture "99"
@04,nInicioColuna1 say "Aux"
@04,nInicioColuna2 say nAux      Picture "99"

nNumero02 := nAux
@03,nInicioColuna3 say nNumero02  Picture "99"

wait
clear

nInicioColuna3 := 17


@00,00 say "E com isso temos"
@01,00 say "|-------|-------|"
@02,00 say "|-------|-------|"
@03,00 say "|-------|-------|"
@04,00 say "|-------|-------|"
@01,00 say "|-------|-------|"


@01,nInicioColuna1 say "Var"
@01,nInicioColuna2 say "Valor"

@02,nInicioColuna1 say "A"
@02,nInicioColuna2 say nNumero01 Picture "99"
@03,nInicioColuna1 say "B"
@03,nInicioColuna2 say nNumero02 Picture "99"
@04,nInicioColuna1 say "Aux"
@04,nInicioColuna2 say nAux      Picture "99"

@25,00 say "* a variavel Aux ser† deletada pelo garbage collector ao finalizar a funá∆o"


wait
clear
