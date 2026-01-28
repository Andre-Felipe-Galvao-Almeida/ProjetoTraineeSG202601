clear

nIdade := 0
cNome := space(20)

@00,00 say "Me forneáa seu nome: "
@01,00 say "Forneáa sua Idade:"
@03,00 say "-------------------"

@00,21 get cNome  picture "@!" valid !empty(cNome)
@01,18 get nIdade picture "99" valid nIdade > 0
read

if nIdade > 21
   @04,00 say "Vocà tem mais de 21"
elseif nIdade = 21
   @04,00 say "Vocà tem 21"
else
   @04,00 say "Vocà tem menos de 21"
end if

if !(alltrim(cNome)=="JORGE")
   @05,00 say "Vocà n∆o se chama Jorge!"
else
   @05,00 say "Ol† Jorge!"
end if

