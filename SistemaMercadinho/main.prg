clear

//(c/20)
cProd1 := space(20)
cProd2 := space(20)
cProd3 := space(20)

//(N/5/2)
nQtd1 := 0
nQtd2 := 0
nQtd3 := 0

//(N/6/2)
nValor1 := 0
nValor2 := 0
nValor3 := 0

//(N/6/2)
nSubTotal1 := 0
nSubTotal2 := 0
nSubTotal3 := 0

nTotal := 0




@01,01 say "Item.|Produto.............|Qtde.|Valor...|SubTotal"
@02,01 to 02,50
@03,06 to 05,06
@03,27 to 05,27
@03,33 to 05,33
@03,42 to 05,42
@03,02 say "01"
@04,02 say "02"
@05,02 say "03"

@07,33 say "|Total:"
@00,00 to 6,51


@03,07 get cProd1  picture "@!"        valid !empty(cProd1)
@03,28 get nQtd1   picture "@e 99.99"  valid (nQtd1 >= 0)
@03,36 get nValor1 picture "@e 999.99" valid (nValor1 >= 0)

read

nSubTotal1 := nQtd1*nValor1
nTotal += nSubTotal1

@03,07 say cProd1
@03,28 say nQtd1      picture "@e"
@03,36 say nValor1    picture "@e"
@03,43 say nSubTotal1 picture "@e 9,999.99"
@07,42 say nTotal     picture "@e 99,999.99"



@04,07 get cProd2  picture "@!"        valid !empty(cProd2)
@04,28 get nQtd2   picture "@e 99.99"  valid (nQtd2 >= 0)
@04,36 get nValor2 picture "@e 999.99" valid (nValor2 >= 0)
read

nSubtotal2 := nQtd2*nValor2
nTotal += nSubTotal2

@04,07 say cProd2
@04,28 say nQtd2      picture "@e"
@04,36 say nValor2    picture "@e"
@04,43 say nSubTotal2 picture "@e 9,999.99"
@07,42 say nTotal     picture "@e 99,999.99"


@05,07 get cProd3  picture "@!"              valid !empty(cProd3)
@05,28 get nQtd3   picture "@e 99.99"        valid (nQtd3 >= 0)
@05,36 get nValor3 picture "@e 999.99"       valid (nValor3 >= 0)
read

nSubTotal3 := nQtd3*nValor3
nTotal += nSubtotal3


@05,07 say cProd3
@05,28 say nQtd3      picture "@e"
@05,36 say nValor3    picture "@e"
@05,43 say nSubTotal3 picture "@e 9,999.99"
@07,42 say nTotal     picture "@e 99,999.99"



