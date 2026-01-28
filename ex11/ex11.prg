clear
// Nome e Idade, infantilA 5-7; InfantilB 8-10 JuvenilA 11-13 JuvenilB 14-17; Senior 18+

cNome     := space(20)
nIdade    := 0
cAdjetivo := "Nadador"
cResposta := Space(10)


//Variaveis para ajuste de tela
x := 0
y := 0

@0, 0 say "Iniciando cadastro, forne‡a as informa‡äes abaixo:"
@1, 0 say "Nome.:"
@2, 0 say "Idade:"

@1, 6 get cNome  Picture "@!" valid !empty(cNome)
@2, 6 get nIdade Picture "99" valid (nIdade>=5)
read

//Retorna a String categorizada
if nIdade <= 10
   cResposta := "Infantil"

   if nIdade <= 7
      cResposta += "(A)"

   else
      cResposta += "(B)"
   end if

elseif nIdade <= 17
   cResposta := "Juvenil"

   if nIdade <= 13
      cResposta += "(A)"

   else
      cResposta += "(B)"
   end if

else
   cResposta := "Senior"
end if

clear
@00, 00 say cAdjetivo+" "+cResposta+", "+str(nIdade,2,0)+" Anos"


//********************************//
//Daqui para baixo ‚ apenas testes//
//********************************//




/*
if nIdade>=5
   @03, 00 say "Gerando careirinha de membro"
   wait
   clear

   @00, 00 to 03, 30
   @01, 01 say cNome

   if nIdade <8
      @02, 01 say "Infantil A"

   elseif nIdade <11
      @02, 01 say "Infantil B"

   elseif nIdade <13
      @02, 01 say "Juvenil A"

   elseif nIdade <17
      @02, 01 say "Juvenil B"

   else
      @02 ,01 say "Sˆnior"
   end if



else
   @03,00 say "Idade insuficiente para cria‡Æo de cadastro."
end if
*/

/*
clear
@x,   y    to  x+3, y+30
@x+1, y+1  say cNome
@x+1, y+15 say nIdade
@x+1, y+17 say " Anos"
@x+2, y+1  say cAdjetivo

if nIdade > 18
   @x+2 ,y+9 say "Sˆnior"

elseif nIdade >= 11
   @x+2, y+9 say "Juvenil"

   if nIdade >= 14
      @x+2, y+18 say "(B)"

   else
      @x+2, y+18 say "(A)"
   endif

elseif nIdade >= 5
   @x+2, y+9 say "Infantil"

   if nIdade >= 8
      @x+2, y+19 say "(B)"
   else
      @x+2, y+19 say "(A)"
   end if

else
   @x, y say "Usu rio Inv lido"
end if
*/
