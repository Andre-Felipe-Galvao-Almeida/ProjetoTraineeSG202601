clear


pace   := 1
coluna := 0
linha  := 0
nCont  := 1
do while .t.
   if nCont == 0
      exit
   endif

   @linha,coluna say transform(nCont,"9")
   nCont += pace
   linha++


   if nCont == 10
      pace   := -1
      coluna := 3
      linha  := 0
   endif

enddo
