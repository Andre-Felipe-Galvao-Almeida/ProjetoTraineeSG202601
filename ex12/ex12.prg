clear

nNum01 := 0
nNum02 := 0
nNum03 := 0

@00, 00 say "Informe 3 numeros e analisaremos qual ‚ maior"

@01, 00 say "Primeiro:"
@02, 00 say "Segundo.:"
@03, 00 say "Terceiro:"
@04, 00 say "---------"

@01, 10 get nNum01 picture "@e 99.99"
@02, 10 get nNum02 picture "@e 99.99"
@03, 10 get nNum03 picture "@e 99.99"
read

/*Metodo 1

if (nNum01*2)>(nNum02+nNum03)
   @05, 00 say "O maior ‚ o Primero:"
   @05, 21 say nNum01

elseif (nNum02*2)>(nNum01+nNum03)
   @05, 00 say "O maior ‚ o Segundo:"
   @05, 21 say nNum02

elseif ((nNum03*2)>(nNum01+nNum02))
   @05, 00 say "O maior ‚ o Terceiro"
   @05, 21 say nNum03

end if
*/

if nNum01 > nNum02 .and. nNum01 > nNum03
   @05, 00 say "O maior ‚ o Primeiro"
   @05, 21 say nNum01

else if nNum02 > nNum01 .and. nNum02 > nNum03
   @05, 00 say "O maior ‚ o Segundo"
   @05, 21 say nNum02

else if nNum03 > nNum01 .and. nNum03 > nNum02
   @05, 00 say "O maior ‚ o Terceiro:"
   @05, 21 say nNum03






