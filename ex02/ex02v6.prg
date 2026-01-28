set date british
set epoch to 1940

do while .t.
   cNome := space(20)
   nPeso := 0
   nIdade := 0

   clear

   @00,00 to 05,54
   @01,01 say "Qual seu nome?"
   @02,01 say "....................!"

   @02,01 get cNome picture "@!" valid !empty(cNome)
   read

   if lastkey() == 27
      exit
   endif

   clear

   @00,00 to 05,54
   @01,01 say "Ol  " + cNome + ",Favor complete seu cadastro:"
   @02,01 say "Idade:"
   @03,01 say "Peso.:"
   @25,00 say "Pressione Esc para sair"

   @02,08 get nIdade picture "99"       valid (nIdade>0)
   @03,08 get nPeso  picture "@e 99.99" valid (nPeso>0)
   read

   if lastkey() == 27
      exit
   endif

   clear

   @00,00 to 05,54
   @01,01 say "Cadastro completo"
   @02,01 say "Nome.:" + alltrim(cNome)
   @03,01 say "Idade:"
   @04,01 say "Peso.:"

   @03,08 say nIdade picture "99"
   @04,08 say nPeso  picture "@e 99.99"
   @04,13 say "Kg"
   @25,00 say "Pressione Esc para sair"

   inkey(0)

enddo
