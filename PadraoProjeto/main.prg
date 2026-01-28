//Andr‚ Felipe GalvÆo Almeida
setcolor("W/N")
set date British
set epoch to 1940

do while .t.
   clear
   // variaveis
   nLinhaInic := 0
   nLinhaFim  := 25
   nLinha     := nLinhaInic

   n := 0
   c := space(1)
   c := space(20)
   d := cTod("")
   d := date()


   cDiaSemana := "Domingo"
   nDia       := day(date())
   cMes       := "Janeiro"
   nAno       := year(date())
   nMes       := month(date())
   nDiaSemana := dow(date())


   if nDiaSemana == 2
      cDiaSemana := "Segunda Feira"
   elseif nDiaSemana == 3
      cDiaSemana := "Ter‡a Feira"
   elseif nDiaSemana == 4
      cDiaSemana := "Quarta Feira"
   elseif nDiaSemana ==5
      cDiaSemana := "Quinta Feira"
   elseif nDiaSemana == 6
      cDiaSemana := "Sexta Feira"
   elseif nDiaSemana == 7
      cDiaSemana := "S bado"
   endif

   if nMes == 2
      cMes := "Fevereiro"
   elseif  nMes == 3
      cMes := "Mar‡o"
   elseif  nMes == 4
      cMes := "Abril"
   elseif  nMes == 5
      cMes := "Maio"
   elseif  nMes == 6
      cMes := "Junho"
   elseif  nMes == 7
      cMes := "Julho"
   elseif  nMes == 8
      cMes := "Agosto"
   elseif  nMes == 9
      cMes := "Setembro"
   elseif  nMes == 10
      cMes := "Outubro"
   elseif  nMes == 11
      cMes := "Novembro"
   elseif  nMes == 12
      cMes := "Dezembro"
   endif






   //Say's







   //Get's




   read
   if lastkey() == 27
      nConfirm := alert("Deseja sair?"{"Sim", "NÆo"})
      if nConfirm == 1
         exit
      endif
      loop
   endif

   nLinha ++
   if nLinha >= nLinhaFim
      nLinha := nLinhaInic
      @ nLinhaInic, 01 clear to nLinhaFim,07
   endif



enddo
