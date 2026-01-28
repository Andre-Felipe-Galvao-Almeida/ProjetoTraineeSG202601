clear

cProd1 := space(20)
cProd2 := space(20)
cProd3 := space(20)

nQtd1 := 0
nQtd2 := 0
nQtd3 := 0

nValor1 := 0
nValor2 := 0
nValor3 := 0

nSubTotal1 := 0
nSubTotal2 := 0
nSubTotal3 := 0

nTotal := 0

@09,09 to 15,62
@11,10 to 11,61
@12,15 to 14,15
@12,36 to 14,36
@12,42 to 14,42
@12,51 to 14,51

@10,10 say "item.|Produto.............|Qtd..|Valor...|Subtotal.."
@12,43 say "R$"
@12,10 say "01.."
@13,10 say "02.."
@14,10 say "03.."
@16,43 say "Total"

@12,16 get cProd1  picture "@!"         valid !empty(cProd1)
@12,37 get nQtd1   picture "@e 99.99"   valid nQtd1>=0
@12,45 get nValor1 picture "@e 999.99"  valid nValor1>0
read

nSubTotal1 := nQtd1*nValor1
nTotal += nSubtotal1

@12,52 say "R$"
@13,43 say "R$"
@12,16 say cProd1
@12,37 say nQtd1      picture "@e 99.99"
@12,45 say nValor1    picture "@e 999.99"
@12,54 say nSubTotal1 picture "@e 99999.99"
@16,53 say nTotal     picture "@e 999999.99"

@13,16 get cProd2  picture "@!"        valid !empty(cProd2)
@13,37 get nQtd2   picture "@e 99.99"  valid nQtd2>=0
@13,45 get nValor2 picture "@e 999.99" valid nQtd2>0
read

nSubTotal2 := nQtd2*nValor2
nTotal += nSubTotal2

@13,52 say "R$"
@14,43 say "R$"
@13,16 say cProd2
@13,37 say nQtd2      picture "@e 99.99"
@13,45 say nValor2    picture "@e 999.99"
@13,54 say nSubTotal2 picture "@e 99999.99"
@16,53 say nTotal    picture "@e 999999.99"

//prod3

@14,52 say "R$"
@15,43 say "R$"
@14,16 say cProd2
@14,37 say nQtd2      picture "@e 99.99"
@14,45 say nValor2    picture "@e 999.99"
@14,54 say nSubTotal2 picture "@e 99999.99"
@16,53 say nTotal     picture "@e 999999.99"

@14,16 get cProd3  picture "@!"        valid !empty(cProd2)
@14,37 get nQtd3   picture "@e 99.99"  valid nQtd2>=0
@14,45 get nValor3 picture "@e 999.99" valid nQtd2>0
read

nSubTotal3 := nQtd3*nValor3
nTotal += nSubTotal3

@13,52 say "R$"
@14,43 say "R$"
@13,16 say cProd3
@13,37 say nQtd3      picture "@e 99.99"
@13,45 say nValor3    picture "@e 999.99"
@13,54 say nSubTotal3 picture "@e 99999.99"
@16,53 say nTotal    picture "@e 999999.99"

inkey(0)


