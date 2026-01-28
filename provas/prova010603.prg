//Andr‚ Felipe GalvÆo Almeida
set date British
set epoch to 1940
setcolor("W/N")
clear

cCidade      := "Maring  "
cNomeEscola  := "Escola Municipal SG Sistemius"
cCnpj        := "99.999.999/0001-99"
dDataNasc    := cTod("")

cAprovado        := "Aprovado"
cReprovadoNota   := "Reprovado por Nota"
cReprovadoFaltas := "Reprovado por Faltas"
cDependencia     := "Aprovado com Dependecias"
cReprovadoAmbas  := "Reprovado por falta e nota"
cReprovado       := "Reprovado"
cCorVermelha     := "R/N"

cNomeAluno        := space(20)
//dNascimento     := date()
cCurso            := space(20)
nSerie            := 0
nValorMensalidade := 0
nReprovacoes      := 0
cSituacao         := cAprovado

cNomeDisciplina01   := space(20)
nNotaDisc1Bim1      := 0
nFreqDisc1Bim1      := 0
nNotaDisc1Bim2      := 0
nFreqDisc1Bim2      := 0
nNotaDisc1Bim3      := 0
nFreqDisc1Bim3      := 0
nNotaDisc1Bim4      := 0
nFreqDisc1Bim4      := 0
nMediaDisc1         := 0
nFaltasDisc1        := 0

cMotivoReprovacao01 := cAprovado
cCorMediaDisc01     := "G/N"
cCorFaltasDisc01    := "G/N"

cNomeDisciplina02   := space(20)
nNotaDisc2Bim1      := 0
nFreqDisc2Bim1      := 0
nNotaDisc2Bim2      := 0
nFreqDisc2Bim2      := 0
nNotaDisc2Bim3      := 0
nFreqDisc2Bim3      := 0
nNotaDisc2Bim4      := 0
nFreqDisc2Bim4      := 0
nMediaDisc2         := 0
nFaltasDisc2        := 0

cMotivoReprovacao02 := cAprovado
cCorMediaDisc02     := "G/N"
cCorFaltasDisc02    := "G/N"

cNomeDisciplina03   := space(20)
nNotaDisc3Bim1      := 0
nFreqDisc3Bim1      := 0
nNotaDisc3Bim2      := 0
nFreqDisc3Bim2      := 0
nNotaDisc3Bim3      := 0
nFreqDisc3Bim3      := 0
nNotaDisc3Bim4      := 0
nFreqDisc3Bim4      := 0
nMediaDisc3         := 0
nFaltasDisc3        := 0

cMotivoReprovacao03 := cAprovado
cCorMediaDisc03     := "G/N"
cCorFaltasDisc03    := "G/N"

nValorMedia := 60
nMaxFaltas  := 6

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


@ 00,00 to 03,65
@ 04,00 to 10,65

@ 00,01 say cCidade + transform(nDia,"99") + " de " + cMes + " de "+ transform(nAno,"9999") + "(" +cDiaSemana + ")"
@ 01,20 say cNomeEscola
@ 02,22 say "CNPJ: " + cCnpj
@ 05,01 say "Aluno......:"
@ 06,01 say "Curso......:"
@ 07,01 say "S‚rie......:"
@ 08,01 say "Mensalidade:"
@ 09,01 say "Data.......:"

@ 05,14 get cNomeAluno        picture "@!"         valid !empty(cNomeAluno)
@ 06,14 get cCurso            picture "@!"         valid !empty(cCurso)
@ 07,14 get nSerie            picture "9"          valid (nSerie>=1 .and. nSerie<=8)
@ 08,14 get nValorMensalidade picture "@e 9999.99" valid nValorMensalidade > 0
@ 09,14 get dDataNasc
read


if nSerie >= 5
   nValorMedia := 70
endif

if nSerie >=4
   nMaxFaltas := 8
endif

@ 12,10 say "1ø Bimestre|2ø Bimestre|3ø Bimestre|4ø Bimestre|"
@ 13,10 say "Nota/Faltas|Nota/Faltas|Nota/Faltas|Nota/Faltas|"
@ 11,00 to 24,65
@ 13,21 to 23,21
@ 13,33 to 23,33
@ 13,45 to 23,45
@ 13,57 to 23,57
@ 13,01 clear to 13,45
@ 17,01 clear to 17,45
@ 21,01 clear to 21,45
@ 13,01 say "Mat‚ria:"
@ 14,01 say "notas..:"
@ 15,01 say "Faltas.:"
@ 17,01 say "Mat‚ria:"
@ 18,01 say "notas..:"
@ 19,01 say "Faltas.:"
@ 21,01 say "Mat‚ria:"
@ 22,01 say "notas..:"
@ 23,01 say "Faltas.:"



//materia 1
@ 13,10 get cNomeDisciplina01 picture "@!"        valid !empty(cNomeDisciplina01)
@ 14,10 get nNotaDisc1Bim1    picture "@e 999.99" valid (nNotaDisc1Bim1>=0 .and. nNotaDisc1Bim1<=100)
@ 15,10 get nFreqDisc1Bim1    picture "99"        valid nFreqDisc1Bim1 >=0

@ 14,22 get nNotaDisc1Bim2    picture "@e 999.99" valid (nNotaDisc1Bim2>=0 .and. nNotaDisc1Bim2<=100)
@ 15,22 get nFreqDisc1Bim2    picture "99"        valid nFreqDisc1Bim2 >=0

@ 14,34 get nNotaDisc1Bim3    picture "@e 999.99" valid (nNotaDisc1Bim3>=0 .and. nNotaDisc1Bim3<=100)
@ 15,34 get nFreqDisc1Bim3    picture "99"        valid nFreqDisc1Bim3 >=0

@ 14,46 get nNotaDisc1Bim4    picture "@e 999.99" valid (nNotaDisc1Bim4>=0 .and. nNotaDisc1Bim4<=100)
@ 15,46 get nFreqDisc1Bim4    picture "99"        valid nFreqDisc1Bim4 >=0
read

nMediaDisc1  := ((nNotaDisc1Bim1+nNotaDisc1Bim2+nNotaDisc1Bim3+nNotaDisc1Bim4)/4)
nFaltasDisc1 := ((nFreqDisc1Bim1+nFreqDisc1Bim2+nFreqDisc1Bim3+nFreqDisc1Bim4)/4)

if nMediaDisc1 < nValorMedia .and. nFaltasDisc1 > nMaxFaltas
   cMotivoReprovacao01 := cReprovadoAmbas
   cCorMediaDisc01     := cCorVermelha
   cCorFaltasDisc01    := cCorVermelha

elseif nMediaDisc1 < nValorMedia
   cMotivoReprovacao01 := cReprovadoNota
   cCorMediaDisc01     := cCorVermelha

elseif nFaltasDisc1 > nMaxFaltas
   cMotivoReprovacao01 := cReprovadoFaltas
   cCorFaltasDisc01    := cCorVermelha
endif

if !(cMotivoReprovacao01 == cAprovado)
   nReprovacoes ++
endif

@ 14,58 say alltrim(str(nMediaDisc1))  Color cCorMediaDisc01
@ 15,58 say alltrim(str(nFaltasDisc1)) Color cCorFaltasDisc01

//mat‚ria 2
@ 17,10 get cNomeDisciplina02 picture "@!"        valid !empty(cNomeDisciplina02)
@ 18,10 get nNotaDisc2Bim1    picture "@e 999.99" valid (nNotaDisc2Bim1>=0 .and. nNotaDisc2Bim1<=100)
@ 19,10 get nFreqDisc2Bim1    picture "99"        valid nFreqDisc2Bim1 >=0

@ 18,22 get nNotaDisc2Bim2    picture "@e 999.99" valid (nNotaDisc2Bim2>=0 .and. nNotaDisc2Bim2<=100)
@ 19,22 get nFreqDisc2Bim2    picture "99"        valid nFreqDisc2Bim2 >=0

@ 18,34 get nNotaDisc2Bim3    picture "@e 999.99" valid (nNotaDisc2Bim3>=0 .and. nNotaDisc2Bim3<=100)
@ 19,34 get nFreqDisc2Bim3    picture "99"        valid nFreqDisc2Bim3 >=0

@ 18,46 get nNotaDisc2Bim4    picture "@e 999.99" valid (nNotaDisc2Bim4>=0 .and. nNotaDisc2Bim4<=100)
@ 19,46 get nFreqDisc2Bim4    picture "99"        valid nFreqDisc2Bim4 >=0
read

nMediaDisc2  := ((nNotaDisc2Bim1+nNotaDisc2Bim2+nNotaDisc2Bim3+nNotaDisc2Bim4)/4)
nFaltasDisc2 := ((nFreqDisc2Bim1+nFreqDisc2Bim2+nFreqDisc2Bim3+nFreqDisc2Bim4)/4)

if nMediaDisc2 < nValorMedia .and. nFaltasDisc2 > nMaxFaltas
   cMotivoReprovacao02 := cReprovadoAmbas
   cCorMediaDisc02     := cCorVermelha
   cCorFaltasDisc02    := cCorVermelha

elseif nMediaDisc2 < nValorMedia
   cMotivoReprovacao02 := cReprovadoNota
   cCorMediaDisc02     := cCorVermelha

elseif nFaltasDisc2 > nMaxFaltas
   cMotivoReprovacao02 := cReprovadoFaltas
   cCorFaltasDisc02    := cCorVermelha
endif

if !(cMotivoReprovacao02 == cAprovado)
   nReprovacoes ++
endif

@ 18,58 say alltrim(str(nMediaDisc2))  Color cCorMediaDisc02
@ 19,58 say alltrim(str(nFaltasDisc2)) Color cCorFaltasDisc02

//Mat‚ria 3
@ 21,10 get cNomeDisciplina03 picture "@!"        valid !empty(cNomeDisciplina03)
@ 22,10 get nNotaDisc3Bim1    picture "@e 999.99" valid (nNotaDisc3Bim1>=0 .and. nNotaDisc3Bim1<=100)
@ 23,10 get nFreqDisc3Bim1    picture "99"        valid nFreqDisc3Bim1 >=0

@ 22,22 get nNotaDisc3Bim2    picture "@e 999.99" valid (nNotaDisc3Bim2>=0 .and. nNotaDisc3Bim2<=100)
@ 23,22 get nFreqDisc3Bim2    picture "99"        valid nFreqDisc3Bim2 >=0

@ 22,34 get nNotaDisc3Bim3    picture "@e 999.99" valid (nNotaDisc3Bim3>=0 .and. nNotaDisc3Bim3<=100)
@ 23,34 get nFreqDisc3Bim3    picture "99"        valid nFreqDisc3Bim3 >=0

@ 22,46 get nNotaDisc3Bim4    picture "@e 999.99" valid (nNotaDisc3Bim4>=0 .and. nNotaDisc3Bim4<=100)
@ 23,46 get nFreqDisc3Bim4    picture "99"        valid nFreqDisc3Bim4 >=0
read

nMediaDisc3  := ((nNotaDisc3Bim1+nNotaDisc3Bim2+nNotaDisc3Bim3+nNotaDisc3Bim4)/4)
nFaltasDisc3 := ((nFreqDisc3Bim1+nFreqDisc3Bim2+nFreqDisc3Bim3+nFreqDisc3Bim4))

if nMediaDisc3 < nValorMedia .and. nFaltasDisc3 > nMaxFaltas
   cMotivoReprovacao03 := cReprovadoAmbas
   cCorMediaDisc03     := cCorVermelha
   cCorFaltasDisc03    := cCorVermelha

elseif nMediaDisc3 < nValorMedia
   cMotivoReprovacao03 := cReprovadoNota
   cCorMediaDisc03     := cCorVermelha

elseif nFaltasDisc3 > nMaxFaltas
   cMotivoReprovacao03 := cReprovadoFaltas
   cCorFaltasDisc03    := cCorVermelha
endif

if !(cMotivoReprovacao03 == cAprovado)
   nReprovacoes ++
endif

@ 22,58 say alltrim(str(nMediaDisc3))  Color cCorMediaDisc03
@ 23,58 say alltrim(str(nFaltasDisc3)) Color cCorFaltasDisc03

@ 25,00 say "Pressione qualquer tecla para continuar"
inkey(0)

//Relat¢rio
@ 04,00 clear to 25,80

if nReprovacoes <= 2
   cSituacao := "Aprovado com Depencˆncia(s)"
elseif nReprovacoes > 2
   cSituacao := "Reprovado"
endif



if !(cMotivoReprovacao01 == cAprovado)
   @ 13,01 say "+R$"
   @ 13,05 say transform(nValorMensalidade*0.2,"@e 999.99")
endif

if !(cMotivoReprovacao02 == cAprovado)
   @ 18,01 say "+R$"
   @ 18,05 say transform(nValorMensalidade*0.2,"@e 999.99")
endif

if !(cMotivoReprovacao03 == cAprovado)
   @ 23,01 say "+R$"
   @ 23,05 say transform(nValorMensalidade*0.2,"@e 999.99")
endif

nValorMensalidade := (1+(0.2*nReprovacoes))*nValorMensalidade

@ 04,00 to 23,65
@ 05,01 say "Aluno......:"    + cNomeAluno
@ 06,01 say "Situa‡Æo...:"    + cSituacao
@ 07,01 say "Mensalidade: R$" + alltrim(Str(nValorMensalidade))
@ 08,01 say "Data.......:"    + dToc(dDataNasc)

@ 10,01 say "Disciplina 01:" + Alltrim(cNomeDisciplina01) + "(" +cMotivoReprovacao01 + ")"
@ 11,01 say "Nota: "         + Alltrim(Str(nMediaDisc1))    color cCorMediaDisc01
@ 12,01 say "Faltas: "       + Alltrim(Str(nFaltasDisc1))   color cCorFaltasDisc01

@ 15,01 say "Disciplina 02:" + Alltrim(cNomeDisciplina02) + "(" + cMotivoReprovacao02 + ")"
@ 16,01 say "Nota: "         + Alltrim(Str(nMediaDisc2))    color cCorMediaDisc02
@ 17,01 say "Faltas: "       + Alltrim(Str(nFaltasDisc2))   color cCorFaltasDisc02

@ 20,01 say "Disciplina 03:" + Alltrim(cNomeDisciplina03) +"(" + cMotivoReprovacao03 + ")"
@ 21,01 say "Nota: "         + Alltrim(Str(nMediaDisc3))    color cCorMediaDisc03
@ 22,01 say "Faltas: "       + Alltrim(Str(nFaltasDisc3))   color cCorFaltasDisc03

inkey(0)
