set date British
set epoch to 1940
clear

do while .t.

   cClienteNome    := space(20)
   nClienteLimite  := 0
   dDataVenda      := cTod("")

   nNumProd       := 1
   nLinha         := 0
   nConfirma      := 9

   cFormaPagamento := space(1)
   nQtdParcelas    := 0

   nTotal          := 0
   cCorStrTotal    := "G/N"

   @ 00,00 to 04,48
   @ 01,01 say "Nome.........:"
   @ 02,01 say "Limite(R$)...:"
   @ 03,01 say "Data da Venda:"
   @ 05,00 to 10,48
   @ 06,01 say "Item|Produto.............|Valor.|Qtd|Subtotal.."

   // Cabe‡alho
   @ 01,15 get cClienteNome   picture "@!"          valid !empty(cClienteNome)
   @ 02,15 get nClienteLimite picture "@e 9,999.99" valid nClienteLimite > 0
   @ 03,15 get dDataVenda                           valid !empty(dDataVenda)
   read

   if lastkey() == 27
      nConfirma := alert("Deseja Sair", {"Sim", "NÆo"})

      if nConfirma == 1
         exit
      endif
      nConfirma := 0
      loop
   endif

   //@ 01,12 say cClienteNome
   //@ 02,12 say nClienteLimite

   /*
   @ 07,02 say "01"
   @ 08,02 say "02"
   @ 09,02 say "03"
   @ 07,05 to 09,05
   @ 07,26 to 09,26
   @ 07,33 to 09,33
   @ 07,37 to 09,37
   */
   @ 11,32 say "Total|"

   do while .t.
      cProdDescricao := space(20)
      nProdQtd       := 0
      nProdValor     := 0
      nSubtotal      := 0


      @ nLinha+7   ,02 say transform(nNumProd,"99")
      @ nLinha+7   ,05 say "|"
      @ nLinha+7   ,26 say "|"
      @ nLinha+7   ,33 say "|"
      @ nLinha+7   ,37 say "|"

      @ nLinha+7   ,06 get cProdDescricao picture "@!"        valid !empty(cProdDescricao)
      @ nLinha+7   ,27 get nProdValor     picture "@e 999.99" valid nProdValor > 0
      @ nLinha+7   ,34 get nProdQtd       picture "@e 999"    valid nProdQtd   > 0
      read

      if lastkey() == 27
         nConfirma := alert("Deseja", {"Continuar", "Abandonar", "Faturar"})
      endif

      if nConfirma <= 1
         nConfirma := 9
         loop

      elseif nConfirma == 3
         nConfirma := 9
         if nTotal <= 0
            alert("Imposs¡vel faturar")
            loop
         else
            exit
         endif

      elseif nConfirma == 2
         exit
      endif


      nSubtotal := nProdQtd * nProdValor
      nTotal    += nSubtotal

      if nTotal > nClienteLimite
         cCorStrTotal := "R/N"
      endif

      @ nLinha+7,38 say nSubtotal picture "@e 999,999.99" color cCorStrTotal
      @ 11      ,38 say nTotal    picture "@e 999,999.99" color cCorStrTotal

      if nLinha == 2
         @ 07,01 clear to 09,47
         nLinha := 0
      else
         nLinha ++
      endif

      nNumProd ++
   enddo

   if nConfirma == 2
      nConfirma := 9
      loop
   endif


   // Metodo de Pagamento
   @ 12,00 to 17,48
   @ 13,01 say "Selecione o metodo de pagamento"
   @ 14,01 say "[V] · Vista | [P] · Prazo"

   @ 16,01 get cFormaPagamento picture "@!" valid cFormaPagamento $ "VP"
   read

   if cFormaPagamento$"P"
      @ 16,03 say "|    Parcelas"
      @ 16,05 get nQtdParcelas picture "99" valid (nQtdParcelas>=1 .and. nQtdParcelas <=10)
      read
   endif


   nConfirma := alert("Oque deseja?", {"Novo Pedido", "Sair"})
   if nConfirma == 1
      nConfirma := 9
      loop
   else
      exit
   endif


/*
   //gracinha
   @ 18,00 say "Pressione qualquer tecla para continuar"
   inkey(0)
   clear
   @ 00,00 say "Processando"
   inkey(0.5)
   @ 01,00 say "."
   inkey(0.5)
   @ 02,00 say "."
   inkey(0.5)
   @ 03,00 say "."
   inkey(0.5)
   clear


   //NFCE
   setcolor("N/GR")
   @ 05,10 clear to 23,48
   @ 05,22 say "Jorge's Mercado"
   @ 07,10 say "Item|Produto.............|Qtd|Subtotal."
   @ 08,10 say ".01...................................."
   @ 09,10 say ".02...................................."
   @ 10,10 say ".03...................................."

   @ 08,14 to 10,14
   @ 08,35 to 10,35
   @ 08,39 to 10,39

   @ 08,15 say alltrim(cProdDescricao1)
   @ 08,36 say alltrim(str(nProdQtd1,3,0))
   @ 08,40 say alltrim(str(nSubtotal1,11,2))

   @ 09,15 say alltrim(cProdDescricao2)
   @ 09,36 say alltrim(str(nProdQtd2,3,0))
   @ 09,40 say alltrim(str(nSubtotal2,11,2))

   @ 10,15 say alltrim(cProdDescricao1)
   @ 10,36 say alltrim(str(nProdQtd3,3,0))
   @ 10,40 say alltrim(str(nSubtotal3,11,2))
   @ 11,40 say Alltrim(Str(nTotal,11,2))

   @ 13,11 say "Cliente........: " + Alltrim(cClienteNome)
   @ 14,11 say "Data da Venda..: " + dToc(dDataVenda)
   @ 15,11 say "Data de EmissÆo: " + dToc(date())
   @ 18,11 say "PrevisÆo de entrega:" + dToc(date()+7)
   if cFormaPagamento == "P"
      @ 16,11 say "Qtd/ Parcelas...: "   + Alltrim(Str(nQtdParcelas))
      @ 17,11 say "Valor p/ parcela: R$" + Alltrim(str(nTotal/nQtdParcelas))
   else
      @ 16,11 say "Valor Final.....: R$" + Alltrim(Str(nTotal))
   endif
*/
enddo
   inkey(0)
