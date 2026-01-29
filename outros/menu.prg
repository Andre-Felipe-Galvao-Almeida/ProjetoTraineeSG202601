set message to 24

nTela := 0
do while .t.
   //Menu
   clear
   @ 00,00 to 05,70
   @ 01,01 prompt "Calculadora"
   @ 02,01 prompt "CRM"
   @ 03,01 prompt "Leia e Imprima"
   menu to nTela

   if nTela == 0
      nConfirm := Alert("Deseja Sair do Programa?", {"Sim", "NÆo"})
      if nConfirm == 1
         exit
      endif
      loop
   endif

   //Calculadora
   do while nTela == 1
      clear
      nNum01 := 0
      nNum02 := 0

      @ 00,00 to 03,40
      @ 00,00 say "Calculadora"
      @ 01,01 say "Numero 01:"
      @ 02,01 say "Numero 02:"

      @ 01,11 get nNum01 picture "999"
      @ 02,11 get nNum02 picture "999"
      read

      if lastkey() == 27
         nConfirm := alert("Deseja retornar?", {"Sim", "NÆo"})
         if nConfirm == 1
            exit
         endif
         loop
      endif

      ///
      cNum01 := transform(nNum01, "999")
      cNum02 := transform(nNum02, "999")

      @ 04,00 to 10,40
      @ 05,01 say cNum01 + "+" + cNum02 + "=" + transform(nNum01+nNum02,"@e 99999.99")
      @ 06,01 say cNum01 + "-" + cNum02 + "=" + transform(nNum01-nNum02,"@e 99999.99")
      @ 07,01 say cNum01 + "x" + cNum02 + "=" + transform(nNum01*nNum02,"@e 99999.99")
      @ 08,01 say cNum01 + "/" + cNum02 + "=" + transform(nNum01/nNum02,"@e 99999.99")
      @ 09,01 say cNum02 + "/" + cNum01 + "=" + transform(nNum02/nNum01,"@e 99999.99")

      inkey(0)
      nConfirm := Alert("Deseja", {"Sair", "Continuar"})
         if nConfirm == 1
            exit
         endif
   enddo

   //CRM
   do while nTela == 2
      clear
      @00,00 say "Estou com pregui‡a, fa‡o essa depois"

      inkey(0)
      nConfirm := Alert("Deseja", {"Sair", "Continuar"})
         if nConfirm == 1
            exit
         endif
   enddo

   //Leia e Imprima
   do While nTela == 3
      clear
      @00,00 say "Estou com pregui‡a, fa‡o essa depois"

      inkey(0)
      nConfirm := Alert("Deseja", {"Sair", "Continuar"})
         if nConfirm == 1
            exit
         endif
   enddo
enddo




