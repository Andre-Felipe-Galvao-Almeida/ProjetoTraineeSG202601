clear

do while .t.
   nCodCli := space(6)

   @12, 10 say "Informe o c¢digo do cliente:"

   @12, 40 get nCodCli pict "999999"
   read

   if lastkey() == 27
      break
   endif

enddo
