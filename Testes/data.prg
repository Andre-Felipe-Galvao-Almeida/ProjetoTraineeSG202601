set date british
set epoch to 1940
clear

dData      := cTod("")
dDataAtual := date()

@ 00,00 say dData
@ 01,00 say dDataAtual

@ 04,00 get dData
@ 05,00 get dDataAtual
read

@ 07,00 say dData
@ 08,00 say dDataAtual
