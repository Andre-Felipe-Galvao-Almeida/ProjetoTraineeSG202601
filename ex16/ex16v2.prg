setcolor("C/N+")
clear

cNome       := Space(15)
nQuantidade := 0
nContador   := 0
nLinha      := 0
nColuna     := 0

@ 00,00 say "Qual seu nome?"
@ 01,00 say "Quantas vezes devo repeti-lo?"

@ 00,14 get cNome       picture "@!"  valid !empty(cNome)
@ 01,29 get nQuantidade               valid nQuantidade > 0
read
clear

do while nContador < nQuantidade
   inkey(0.01)
   @ nLinha++,nColuna say transform(nContador++) + ": " + cNome

   if nLinha == 24
      nLinha  := 0
      nColuna += 20
   endif

   if nColuna == 60
      //@ 25,00 say "Digite qualquer tecla para continuar"
      //inkey(0)
      clear
      nColuna := 0
   endif


end do



