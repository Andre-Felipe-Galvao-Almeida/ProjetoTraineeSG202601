//Andr‚ Felipe GalvÆo Almeida
set date British
set epoch to 1940

do while .t.
   setcolor("W/N")
   clear
   //Cabe‡alho
   cNomeVendedor := Space(30)
   dDataCotacao  := date()

   //Dados Pessoais
   cNome    := Space(30)
   nIdade   := 0
   cSexo    := Space(1)
   nPeso    := 0
   nAltura  := 0
   cFumante := Space(1)
   nImc     := 0

   // Dados do plano
   cTipoPlano   := Space(1)
   cAbrangencia := Space(1)
   dValidade    := cTod("")

   // Variaveisde modifica‡Æo de valor
   nValorBaseCuidar       := 400
   nModIdadeCuidar        := 0
   nModSexoCuidar         := 0
   nModImcCuidar          := 0
   nModFumanteCuidar      := 0
   nModPlanoCuidar        := 0
   nModAbrangenciaCuidar  := 0
   nModMesCuidar          := 0
   nValorFinalCuidar      := 0
   cCorCuidar             := "W/G"

   nValorBaseVital       := 350
   nModIdadeVital        := 0
   nModSexoVital         := 0
   nModImcVital          := 0
   nModFumanteVital      := 0
   nModPlanoVital        := 0
   nModAbrangenciaVital  := 0
   nModMesVital          := 0
   nValorFinalVital      := 0
   cCorVital             := "W/G"

   //Variaveis para para de carregamento
   nContador := 0
   cBarra    := "######"


   //Say's
   @ 00,00 to 02,70
   @ 00,01 say "Sistema de Cota‡Æo Hospital Placeholder"
   @ 01,01 say "Vendedor:"
   @ 01,46 say "Data da Cota‡Æo:"

   //Get's
   @ 01,10 get cNomeVendedor picture "@!" valid !empty(cNomeVendedor)
   @ 01,62 get dDataCotacao               valid !empty(dDataCotacao)
   read

   if lastkey() == 27
      nConfirm := alert("Deseja sair?",{"Sim", "NÆo"})
      if nConfirm == 1
         exit
      endif
      loop
   endif

   //Say's
   @ 02,00 to 06,70
   @ 02,01 say "Informe os dados do cliente"
   @ 03,01 say "Nome:"
   @ 03,60 say "Idade: "
   @ 04,01 say "Altura:"
   @ 04,13 say "Peso:"
   @ 05,13 say "Fumante(S/N):"
   @ 05,01 say "Sexo(M/F):"

   //get's
   @ 03,06 get cNome    picture "@!"       valid !Empty(cNome)
   @ 03,65 get nIdade   picture "999"      valid (nIdade>0 .and. nIdade<160)
   @ 04,08 get nAltura  picture "@e 9.99"  valid (nAltura>0 .and. nAltura<3)
   @ 04,18 get nPeso    picture "@e 999.9" valid (nPeso>0 .and. nPeso <500)
   @ 05,11 get cSexo    picture "@!"       Valid cSexo$"MF"
   @ 05,26 get cFumante picture "@!"       valid cFumante$"SN"
   read

   if lastkey() == 27
      nConfirm := alert("Deseja sair?",{"Sim", "NÆo"})
      if nConfirm == 1
         exit
      endif
      loop
   endif

   //Say's
   @ 07,00 to 10,70
   @ 08,01 say "Plano [E]nfer,[A]part, [V]ip:"
   @ 09,01 say "Abrangencia [R]egi/[N]aci:"

   //Get's
   @ 08,30 get cTipoPlano   picture "@!" valid !empty(cTipoPlano)
   @ 09,27 get cAbrangencia picture "@!" valid !empty(cAbrangencia)
   read

   if lastkey() == 27
      nConfirm := alert("Deseja sair?",{"Sim", "NÆo"})
      if nConfirm == 1
         exit
      endif
      loop
   endif

   //barra de progresso
   @ 11,00 to 13,70
   @ 12,01 say cBarra

   do while nContador < 9
      inkey(0.5)
      cBarra += "#######"
      nContador ++
      @ 12,01 say cBarra
      inkey(0.5)
   enddo

   //Calculo IMC
   nImc := nPeso/(nAltura*nAltura)

   //L¢gica Cuidar idade

   if nIdade < 35
      nModIdadeCuidar := (-1)*(0.15*nValorBaseCuidar)
   elseif nIdade > 55
      nModIdadeCuidar := (0.25*nValorBaseCuidar)
   endif

   //L¢gica Vital Idade

   if nIdade < 28
      nModIdadeVital  := (-1)*(0.20*nValorBaseVital)
   elseif nIdade > 62
      nModIdadeVital  := (0.30*nValorBaseVital)
   endif

   //L¢gica Sexo Ambos
   if cSexo == "M"
      nModSexoCuidar := (0.10*nValorBaseCuidar)
      nModSexoVital  := (-1)*(0.10*nValorBaseVital)
   else
      nModSexoCuidar := (-1)*(0.10*nValorBaseCuidar)
      nModSexoVital  := (0.15*nValorBaseVital)
   endif

   //L¢gica Cuidar IMC
   if nImc > 28
      nModImcCuidar := (0.20*nValorBaseCuidar)
   endif

   //L¢gica Vial IMC
   if nImc > 26
      nModImcVital := (0.15*nValorBaseVital)
   endif

   //L¢gica Fumante Ambos
   if cFumante == "S"
      nModFumanteCuidar := (0.30*nValorBaseCuidar)
      nModFumanteVital  := (0.35*nValorBaseVital)
   endif

   //L¢gica Plano Ambos
   if cTipoPlano == "A"
      nModPlanoCuidar := (0.35*nValorBaseCuidar)
      nModPlanoVital  := (0.30*nValorBaseVital)
   elseif cTipoPlano == "V"
      nModPlanoCuidar := (0.60*nValorBaseCuidar)
      nModPlanoVital  := (0.50*nValorBaseVital)
   endif

   //L¢gica Abrangˆncia
   if cAbrangencia == "N"
      nModAbrangenciaCuidar := (0.20*nValorBaseCuidar)
      nModAbrangenciaVital  := (0.15*nValorBaseVital)
   endif

   //L¢gica Mˆs Ambos
   if month(dDataCotacao) == 6
      nModMesCuidar := (-1)*(0.15*nValorBaseCuidar)
   elseif month(dDataCotacao) ==11
      nModMesVital  := (-1)*(0.20*nValorBaseVital)
   endif

   nValorFinalCuidar := (nValorBaseCuidar+nModIdadeCuidar+nModSexoCuidar+nModImcCuidar+nModFumanteCuidar+nModPlanoCuidar+nModAbrangenciaCuidar+nModMesCuidar)
   nValorFinalVital  := (nValorBaseVital +nModIdadeVital +nModSexoVital +nModImcVital +nModFumanteVital +nModPlanoVital +nModAbrangenciaVital +nModMesVital)

   if nValorFinalCuidar > nValorFinalVital
      cCorVital := "W/R"
   elseif nValorFinalVital > nValorFinalCuidar
      cCorCuidar := "W/R"
   endif

   setcolor(cCorCuidar)
   @ 15,00 clear to 19,35
   @ 15,00 say "Plano Cuidar"
   @ 16,00 say "Mensa:" + transform(nValorFinalCuidar    ,"@e 9999.99")
   @ 17,00 say "Trime:" + transform(nValorFinalCuidar*3  ,"@e 9999.99")
   @ 18,00 say "Anual:" + transform(nValorFinalCuidar*12 ,"@e 9999.99")


   setcolor(cCorVital)
   @ 15,36 clear to 19,70
   @ 15,36 say "Plano Vital"
   @ 16,36 say "Mensa:" + transform(nValorFinalVital    ,"@e 9999.99")
   @ 17,36 say "Trime:" + transform(nValorFinalVital*3  ,"@e 9999.99")
   @ 18,36 say "Anual:" + transform(nValorFinalVital*12 ,"@e 9999.99")

   //Validade acabando o tempo entÆo go horse

   cMes := alltrim(str(month(dDataCotacao)+1))
   cAno := Alltrim(str(year(dDataCotacao)))
   cData := "01/"nMes+"/"+cAno
   dValidade := ctod(cData)-1

   setcolor("W/N")
   @ 19,00 say "Cota‡Æo validka at‚ o dia: " + dToc(dValidade)
   wait





enddo
