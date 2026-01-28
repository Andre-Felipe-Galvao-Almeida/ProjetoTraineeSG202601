do while .t.
   clear
   nValor01 := 0
   nValor02 := 0

   @00,00 say "Digite dois valores para serem multiplicados!"

   @01,00 say "Valor 1:"
   @02,00 say "Valor 2:"

   @01,09 get nValor01
   @02,09 get nValor02
   read

   if lastkey() == 27
      nOpcao := alert("Desejas sair", {"Sim", "NÆo"})
      if nOpcao == 1
         exit
      endif
      loop
   endif

   clear

   nProduto := nValor01*nValor02
   @00,00 say "Calculando..."
   wait

   @02,00 say "O Produto dos valores fornecidos ‚:" + str(nProduto,10,0)
   inkey(0)
enddo
