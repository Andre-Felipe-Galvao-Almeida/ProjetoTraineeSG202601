
clear

dData  := date()
cMes   := alltrim(str(Month(dData)+1))
cAno   := transform(Year(dData), "9999")
cValid := "1/"+cMes+"/"+cAno
dValid := cTod(cValid)-

?cvalid

?dValid
?cMes
?cAno


