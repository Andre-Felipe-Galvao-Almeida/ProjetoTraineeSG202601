set date British
set epoch to 1940
clear

cClienteNome    := space(20)
nClienteLimite  := 0



cProdDescricao1 := space(20)
nProdQtd1       := 0
nProdValor1     := 0
nSubtotal1      := 0

cProdDescricao2 := space(20)
nProdQtd2       := 0
nProdValor2     := 0
nSubtotal2      := 0

cProdDescricao3 := space(20)
nProdQtd3       := 0
nProdValor3     := 0
nSubtotal3      := 0

cFormaPagamento := space(1)
nQtdParcelas    := 0

nTotal          := 0
cCorStrTotal    := "G/N"

@ 00,00 to 03,48
@ 01,01 say "Nome......:"
@ 02,01 say "Limite(R$):"
@ 04,00 to 09,48
@ 05,01 say "Item|Produto.............|Valor.|Qtd|Subtotal.."
@ 06,02 say "01"
@ 07,02 say "02"
@ 08,02 say "03"
@ 06,05 to 08,05
@ 06,26 to 08,26
@ 06,33 to 08,33
@ 06,37 to 08,37
@ 10,32 say "Total|"


// Cabe‡alho
@ 01,12 get cClienteNome   picture "@!"          valid !empty(cClienteNome)
@ 02,12 get nClienteLimite picture "@e 9,999.99" valid nClienteLimite > 0
read

//@ 01,12 say cClienteNome
//@ 02,12 say nClienteLimite


//Prod1
@ 06,06 get cProdDescricao1 picture "@!"        valid !empty(cProdDescricao1)
@ 06,27 get nProdValor1     picture "@e 999.99" valid nProdValor1>0
@ 06,34 get nProdQtd1       picture "@e 999"     Valid nProdQtd1>0
read

nSubtotal1 := nProdValor1*nProdQtd1
nTotal     += nSubtotal1

if nTotal>nClienteLimite
   cCorStrTotal := "R/N"
endif

//@ 06,06 say cProdDescricao1
//@ 06,27 say nProdValor1 picture "@e"
//@ 06,34 say nProdQtd1   picture "@e"
@ 06,38 say nSubtotal1  picture "@e 999,999.99"
@ 10,38 say nTotal      picture "@e 999,999.99" color cCorStrTotal

//Prod2
@ 07,06 get cProdDescricao2 picture "@!"        valid !empty(cProdDescricao2)
@ 07,27 get nProdValor2     picture "@e 999.99" valid nProdValor2>0
@ 07,34 get nProdQtd2       picture "@e 999"    Valid nProdQtd2>0
read

nSubtotal2 := nProdValor2*nProdQtd2
nTotal     += nSubtotal2

if nTotal>nClienteLimite
   cCorStrTotal := "R/N"
endif

//@ 07,06 say cProdDescricao2
//@ 07,27 say nProdValor2 picture "@e"
//@ 07,34 say nProdQtd2   picture "@e"
@ 07,38 say nSubtotal2  picture "@e 999,999.99"
@ 10,38 say nTotal      picture "@e 999,999.99" color cCorStrTotal

//Prod3
@ 08,06 get cProdDescricao3 picture "@!"        valid !empty(cProdDescricao3)
@ 08,27 get nProdValor3     picture "@e 999.99" valid nProdValor3>0
@ 08,34 get nProdQtd3       picture "@e 999"    valid nProdQtd3>0
read

nSubtotal3 := nProdValor3*nProdQtd3
nTotal     += nSubtotal3

if nTotal>nClienteLimite
   cCorStrTotal := "R/N"
endif

//@ 08,06 say cProdDescricao3
//@ 08,27 say nProdValor3 picture "@e"
//@ 08,34 say nProdQtd3   picture "@e"
@ 08,38 say nSubtotal3  picture "@e 999,999.99"
@ 10,38 say nTotal      picture "@e 999,999.99" color cCorStrTotal

// Metodo de Pagamento
@ 11,00 to 16,48
@ 12,01 say "Selecione o metodo de pagamento"
@ 13,01 say "[V] · Vista | [P] · Prazo"

@ 15,01 get cFormaPagamento picture "@!" valid cFormaPagamento $ "VP"
read

if cFormaPagamento$"P"
   @ 15,03 say "|    Parcelas"
   @ 15,05 get nQtdParcelas picture "99" valid (nQtdParcelas>=1 .and. nQtdParcelas <=10)
   read
endif

//gracinha
@ 17,00 say "Pressione qualquer tecla para continuar"
inkey(0)
clear
@ 00,00 say "Processando"
inkey(0.5)
@ 01,00 say "."
inkey(0.5)
@ 02,00 say "."
inkey(0.5)
@ 03,00 say "."
inkey(0.5)
clear

//NFCE
setcolor("N/GR")
@ 05,10 clear to 23,48
@ 05,22 say "Jorge's Mercado"
@ 07,10 say "Item|Produto.............|Qtd|Subtotal."
@ 08,10 say ".01...................................."
@ 09,10 say ".02...................................."
@ 10,10 say ".03...................................."

@ 08,14 to 10,14
@ 08,35 to 10,35
@ 08,39 to 10,39

@ 08,15 say alltrim(cProdDescricao1)
@ 08,36 say alltrim(str(nProdQtd1,3,0))
@ 08,40 say alltrim(str(nSubtotal1,11,2))

@ 09,15 say alltrim(cProdDescricao2)
@ 09,36 say alltrim(str(nProdQtd2,3,0))
@ 09,40 say alltrim(str(nSubtotal2,11,2))

@ 10,15 say alltrim(cProdDescricao1)
@ 10,36 say alltrim(str(nProdQtd3,3,0))
@ 10,40 say alltrim(str(nSubtotal3,11,2))
@ 11,40 say Alltrim(Str(nTotal,11,2))

@ 13,11 say "Cliente.........: " + Alltrim(cClienteNome)
if cFormaPagamento == "P"
   @ 14,11 say "Qtd/ Parcelas...: " + Alltrim(Str(nQtdParcelas))
   @ 15,11 say "Valor p/ parcela: R$" + Alltrim(str(nTotal/nQtdParcelas))
else
   @ 14,11 say "Valor Final.....: R$" + Alltrim(Str(nTotal))
endif

inkey(0)
