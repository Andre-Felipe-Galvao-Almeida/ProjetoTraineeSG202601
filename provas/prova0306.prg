//Andre felipe galvao almeida
setcolor("W/N")
set date British
set epoch to 1940

do while .t.
   clear

   nNumEmpregados := 0
   nContador      := 0
   nConfirm       := 0

   nTotalHomensAposent     := 0
   nTotalMulheresAposent   := 0
   nPercentHomensAposent   := 0
   nPercentMulheresAposent := 0
   nTotalRemuAposentados   := 0
   nHomensIdadeAcima       := 0
   nMulheresAdmitidaAntes  := 0
   nTotalMulheresIRRF      := 0
   nPercentMulheresIRRF    := 0


   @ 00,00 to 03,70
   @ 01,01 say "Quantos empregados ser∆o analisados?"

   @ 02,01 get nNumEmpregados
   read
   if lastkey() == 27
      nConfirma := alert("Deseja sair", {"Sim", "N∆o"})
      if nConfirma == 1
         exit
      endif
      loop
   endif

   do while nContador < nNumEmpregados
      cNome                 := space(30)
      cSexo                 := space(1)
      dNascimento           := cTod('')
      dAdmissao             := cTod('')
      dDemissao             := date()
      nIdade                := 0
      nTempoTrabalhado      := 0

      nSalBase              := 0
      nSalLiquido           := 0
      nValorAposentadoria   := 0
      lAposenta             := .f.
      nLimiteIRRF           := 0
      nAdcNoturnoPorcent    := 0
      nAdcInsalubriPercent  := 0
      nIRRF                 := 0
      nIRRFAposentadoria    := 0
      nAdcNoturnoValor      := 0
      nAdcIsalubriValor     := 0


      @ 04,00 to 09,70
      @ 05,01 say "Nome:"
      @ 05,50 say "Nascimento:"
      @ 06,01 say "Sexo(M/F)"
      @ 06,12 say "Data Admissao:"
      @ 06,34 say "Data Demissao:"
      @ 07,01 say "Salario Base: R$"
      @ 07,27 say "Limite IRRF:"
      @ 08,01 say "Adicional Noturno:    %"
      @ 08,26 say "Insalubridade:    %"

      @ 05,06 get cNome                picture "@!"           valid !empty(cNome)
      @ 05,61 get dNascimento                                 valid !empty(dNascimento) .and. dNascimento < date()
      @ 06,10 get cSexo                picture "@!"           valid cSexo$"MF"
      @ 06,25 get dAdmissao                                   valid !empty(dAdmissao)
      @ 06,48 get dDemissao                                   valid !empty(dDemissao)
      @ 07,16 get nSalBase             picture "@e 999999.99" valid nSalBase > 0
      @ 07,38 get nLimiteIRRF          picture "@e 999999.99" valid nLimiteIRRF>= 0
      @ 08,20 get nAdcNoturnoPorcent   picture "999"
      @ 08,41 get nAdcInsalubriPercent picture "999"
      read

      if lastkey() == 27
         nConfirm := alert("Deseja:", {"Cancelar", "Retornar", "Processar"})
         if nConfirm == 2 .or. nConfirm == 0
            loop
         endif
         exit
      endif

      //calcula idade e tempo trabalhaod
      nidade := year(date())-year(dNascimento)

      if month(dNascimento) > month(date())
            nidade--

      elseif month(dNascimento) == month(date())
         if day(dNascimento) > day(date())
            nidade --

         endif
      endif

      nTempoTrabalhado := year(dDemissao)-year(dAdmissao)

      if month(dAdmissao) > month(dDemissao)
            nTempoTrabalhado--

      elseif month(dAdmissao) == month(dDemissao)
         if day(dAdmissao) > day(dDemissao)
               nTempoTrabalhado --

         endif
      endif

      //Descontos e Acrescimos
      nAdcNoturnoValor  := nSalBase * (nAdcIsalubriValor/100)
      nAdcIsalubriValor := nSalBase * (nAdcInsalubriPercent/100)

      nSalLiquido := nSalBase+nAdcNoturnoValor+nAdcIsalubriValor

      if nSalLiquido >= nLimiteIRRF
         nIRRF := nSalLiquido*0.09
      endif

      //Aposentadoria aptid∆o
      if cSexo == "M"
         if nIdade >= 61 .and. nTempoTrabalhado >= 30
            lAposenta := .t.
         endif
      else
         if nIdade >= 58 .and. nTempoTrabalhado >= 20
            lAposenta := .t.
         endif
      endif


      //Calculos aposentadoria

      if lAposenta
         nValorAposentadoria := nSalLiquido

         if year(dAdmissao) <= 2009 .and. year(dDemissao) >= 2012
            nValorAposentadoria += (nSalBase*0.02)
         endif

         if year(dAdmissao) <= 2015 .and. year(dDemissao) >= 2018
            nValorAposentadoria += (nSalBase*0.05)
         endif

         if nIRRFAposentadoria >= nLimiteIRRF
            nIRRFAposentadoria := nValorAposentadoria*0.09
         endif
      endif

      //contagens
      if cSexo =="M"
         if lAposenta
            nTotalHomensAposent++
            nTotalRemuAposentados += nValorAposentadoria-nIRRFAposentadoria
         endif

         if nidade > 91
            nHomensIdadeAcima++
         endif

      else
         if lAposenta
            nTotalMulheresAposent++
            nTotalRemuAposentados += nValorAposentadoria-nIRRFAposentadoria
         endif

         if year(dAdmissao)<2013
            nMulheresAdmitidaAntes++
         endif

         if nIRRF > 0
            nTotalMulheresIRRF++
         endif
      endif


      nContador++
   enddo

   if nConfirm == 1
      loop
   endif

   nPercentMulheresAposent := (100/nTotalMulheresAposent)
   nPercentHomensAposent   := (100/nTotalHomensAposent)
   nPercentMulheresIRRF    := (100/nTotalMulheresIRRF)


   @ 10,01 say "Homens aposentados..............:"+transform(nPercentMulheresAposent,"999,99")+"%"
   @ 11,01 say "Mulheres aposentadas............:"+transform(nPercentHomensAposent,"999,99")+"%"
   @ 12,01 say "Remuneraá∆o total Aposentados...:R$"+Alltrim(Str(nTotalRemuAposentados))
   @ 13,01 say "Homens acima dos 91 anos........:"+alltrim(str(nHomensIdadeAcima))
   @ 14,01 say "Mulheres admitidas antes de 2013:"+alltrim(str(nMulheresAdmitidaAntes))
   @ 15,01 say "Mulheres que pagam IRRF.........:"+transform(nPercentMulheresIRRF,"999,99")+"%"
   @ 18,00 say nTotalHomensAposent

   inkey(0)

   if lastkey() == 27
      nConfirm := alert("Deseja", {"Continuar", "Sair"})
      if nContador == 1
         loop
      endif
   endif

enddo
