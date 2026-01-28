clear
@00,00 say "Digite um numero:"
nNumero1 :=15.25

@00,18 get nNumero1 picture "@e 99.99" valid nNumero1 >= 15.25 .and. nNumero1 <= 28.28
read

@01,00 say "======================="
@02,00 say "Digite um numero menor que o anterior"
nNumero2 := nNumero1-1

@02,38 get nNumero2 picture "@e 99.99" valid nNumero2 < nNumero1
read

@03,00 say "======================="
@04,00 say "Digite um numero menor que o anterior"
nNumero3 := nNumero2-2

@04,38 get nNumero3 picture "@e 99.99" valid nNumero3 < nNumero2
read

@03,00 say "======================="
@04,00 say "Digite o produto dos tres anteriores"
nNumero4 := nNumero1*nNumero2*nNumero3

@04,37 get nNumero4 picture "@e 9999.9999" valid nNumero4 == (nNumero1*nNumero2*nNumero3)
read





