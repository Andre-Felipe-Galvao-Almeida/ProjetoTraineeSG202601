SetColor("N/W")
clear

cProd  := Space(20)
nCod   := 0
cClas  := Space(28)
cColor := Space(3)

@00, 00 to 07,58
@02, 01 to 02,57
@01, 01 say "C¢d.|Item................|Classifica‡Æo.................."

@03, 02 get nCod Picture "99" valid (nCod>=1 .and. nCod<=15)
@03, 06 get cProd Picture "@!" valid !empty(cProd)
read

if nCod = 1
   cClas  := "Alimento nÆo-perec¡vel"
   cColor := "N/W"
elseif nCod <= 4
   cClas  := "Alimento perec¡vel"
   cColor := "B/W"
elseif nCod <= 6
   cClas  := "Vestu rio"
   cColor := "G/W"
elseif nCod = 7
   cClas  := "Higiene pessoal"
   cColor := "R/W"
elseif nCod <= 15
   cClas  := "Limpeza e utens¡lios dom‚sticos"
   cColor := "GR+/N"
endif

@03, 02 say nCod  color cColor
@03, 06 say cProd color cColor
@03, 27 say cClas color cColor




inkey(0)
