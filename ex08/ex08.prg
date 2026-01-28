clear

nProd1Valor := 10
nProd2Valor := 5.25
nProd3Valor := 20

nProd1Qtd := 0
nProd2Qtd := 0
nProd3Qtd := 0

@00,00 to 09,40

@01,01 say "Insira as quantidades de cada produto:"
@02,01 say "Produto A:"
@03,01 say "Produto B:"
@04,01 say "Produto C:"

@02,12 get nProd1Qtd picture "999" valid (nProd1Qtd > 0)
@03,12 get nProd2Qtd picture "999" valid (nProd2Qtd > 0)
@04,12 get nProd3Qtd picture "999" valid (nProd3Qtd > 0)
read

@01,01 clear to 08,39

nProd1Total := nProd1Valor*nProd1Qtd
nProd2Total := nProd2Valor*nProd2Qtd
nProd3Total := nProd3Valor*nProd3Qtd
nTotal := nProd1Total+nProd2Total+nProd3Total

@01,01 say "..Produto..|.Qtd.|.ValorUn.|ValorTotal."
@02,01 say ".Produto.A.|.....|.........|..........."
@03,01 say ".Produto.B.|.....|.........|..........."
@04,01 say ".Produto.C.|.....|.........|..........."

@02,15 say nProd1Qtd picture "999"
@03,15 say nProd2Qtd picture "999"
@04,15 say nProd3Qtd picture "999"

@02,20 say nProd1Valor picture "@e 999.99"
@03,20 say nProd2Valor picture "@e 999.99"
@04,20 say nProd3Valor picture "@e 999.99"

@02,30 say nProd1Total picture "@e 99999.99"
@03,30 say nProd2Total picture "@e 99999.99"
@04,30 say nProd3Total picture "@e 99999.99"

@07,01 say "Total:"
@07,09 say (nTotal)

inkey(0)

