set date british
set epoch to 1940
set message to 24

cDados   := ""
nTela    := 0
nConfirm := 0
do while .t.
   //Menu de Sele‡Æo
   do while nTela == 0
      clear
      @ 01,00 prompt "Cadastro" message "Cadastra novos clientes"
      @ 02,00 prompt "Consulta" message "Consulta dados do cliente por nome"
      @ 03,00 prompt "Listar"   message "Lista todos os usuarios"
      menu to nTela
      if nTela == 0
         nConfirm := alert("Deseja sair?", {"Sim", "NÆo"})

         if nConfirm == 1
            exit
         endif
      endif


   enddo
   if nConfirm == 1
      exit
   endif

   //Cadastro
   do while nTela == 1
      clear
      cNome       := space(30)
      dNascimento := cTod("")
      nPeso       := 0

      @ 00,00 to 04,70
      @ 01,01 say "Nome:"
      @ 01,52 say "Nascimento"
      @ 02,01 say "Peso:"

      @ 01,06 get cNome picture "@!"        valid !empty(cNome)
      @ 01,62 get dNascimento               valid !empty(dNascimento)
      @ 02,06 get nPeso picture "@e 999.99" valid (nPeso>0)
      read

      if lastkey() == 27
         nConfirm := alert("Deseja Voltar", {"Sim", "NÆo"})
         if nConfirm == 1
            nTela := 0
            exit
         endif
      endif

      cDados += cNome + dToc(dNascimento) + str(nPeso)
   enddo

   //Consulta
   do while nTela == 2
      clear
      @00,00 say "Em manuten‡Æo"
      nTela := 0
   enddo

  //Listar
   do while nTela == 3
      clear
      nIndice := 1
      nLinha  := 0
      nFluxo  := 0
      do while !(nIndice==(len(cDados)-44))
         @ nLinha,00 say subStr(cDados,nIndice,44)+"|"
         nLinha++
         nIndice +=44

         if nLinha == 21
            @21,00 to 24,70
            @22,01 prompt "Sair"
            @23,01 prompt "Continuar"
            menu to nFluxo

            if nFluxo == 1
               nConfirm := alert("Deseja voltar?", {"Sim", "NÆo"})
                  if nConfirm == 1
                     nTela :=0
                     exit
                  endif
            else
               @00,00 clear to 20,80
               nLinha := 0
            endif
         endif


      enddo

   enddo
enddo
