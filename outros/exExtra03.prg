set date british
set epoch to 1940
clear
do while .t.

   cNome       := space(30)
   dNascimento := cTod("")
   nPeso       := 0


@ 00,00 to 03,70
@ 01,01 say "Nome:"
@ 01,51 say "Nascimento:"
@ 02,01 say "Peso:      Kg"

@ 01,06 get cNome picture "@!"        valid !empty(cNome)
@ 01,62 get dNascimento               valid !empty(dNascimento)
@ 02,06 get nPeso picture "@e 999.99" valid nPeso > 0
read

if lastkey() == 27
   nConfirm := alert("Deseja", {"Sair", "Continuar"})
   if nConfirm == 1
      exit
   endif
   loop
endif


cDados := cNome + dToc(dNascimento) + str(nPeso)
@04,00 to 06,70
@05,01 say cDados

@07,00 to 11,70
@08,01 say subStr(cDados,1,30)
@09,01 say subStr(cDados,31,8)
@10,01 say subStr(cDados,39,6)
inkey(0)

enddo
