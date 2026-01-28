clear

cSexo  := space(1)
nIdade := 0
nPeso  := 0

@00, 00 say "Informe seu sexo (M/F)"
//Simbolo "$" equivale a contido em...
@00, 23 get cSexo picture "@!" valid cSexo $ "MF"
read

if cSexo="M"
   @01, 00 say "Informe seu peso:"
   @01, 18 get nPeso picture "@e 999.99" valid nPeso>0
   read

   if nPeso>100
      @02, 00 say "Vocˆ pesa mais que 100Kg"
   end if

else
   @01, 00 say "Informe sua idade:"
   @01, 19 get nIdade picture "@e 999" valid nIdade>0
   read

   if nIdade>21
      @02, 00 say "Vocˆ tem mais de 21"
   end if
end if

