clear
setmode (25,80)

nNum01 := 0
nNum02 := 0
nNum03 := 0
nMaior := 0

@00, 00 say "Informe trˆs numeros e analisaremos o maior"
@01, 00 get nNum01
@02, 00 get nNum02
@03, 00 get nNum03
read

nMaior := nNum01

if nMaior < nNum02
   nMaior := nNum02
endif

if nMaior < nNum03
   nMaior := nNum03
endif

@05, 00 say nMaior




