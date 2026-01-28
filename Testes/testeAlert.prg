clear

do while .t.
   if lastkey() == 27
   nOpcao := alert("Alo Mundo!", {"Sim", "NÆo"}, "G/N")
      if nOpcao == 1
         exit
      endif
      loop
   endif
enddo
@ 01,00 say alltrim(str(nOpcao))
