setcolor("C/N+")
clear

cNome       := Space(20)
nQuantidade := 0
nAux        := 0
nLinha      := 0

@ 00,00 say "Qual seu nome?"
@ 01,00 say "Quantas vezes devo repeti-lo?"

@ 00,14 get cNome       picture "@!" valid !empty(cNome)
@ 01,29 get nQuantidade              valid nQuantidade > 0
read
clear

do while nAux < nQuantidade
   nAux ++
   @ nLinha++,00 say alltrim(str(nAux)) + cNome

   if nLinha == 25
      inkey(0)
      clear
      nLinha := 0
   endif
enddo


