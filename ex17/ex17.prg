do while .t.
   clear
   cPalavra := space(30)
   nIndice  := 0
   cAux     := space(30)

   @ 00,00 say "Diga nos uma palavra"

   @ 01,00 get cPalavra picture "@!" valid !empty(cPalavra)
   read
   if lastkey() == 27
      nConfirm := alert("Deseja sair", {"Sim", "N∆o"})
      if nConfirm == 1
         exit
      endif
      loop
   endif

   nIndice := len(cPalavra)

   do while nIndice > 0
      cAux += subStr(cPalavra,nIndice,1)
      nIndice--
   enddo

   cPalavra := alltrim(cPalavra)
   cAux     := alltrim(cAux)

   @ 03,00 say cPalavra
   @ 04,00 say cAux
   if cAux == cPalavra
      @ 05,00 say cPalavra + " ê um pal°ndromo"
   else
      @ 05,00 say cPalavra + " N∆o Ç um pal°ndromo"
   endif

   inkey(0)

enddo
