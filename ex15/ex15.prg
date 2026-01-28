clear

nIndice := 0
cNome   := Space(10)

@ 00,00 say "Qual seu nome:"
@ 00,14 get cNome
read

do while nIndice < 10
   @nIndice++ +1, 0 say cNome


end do

