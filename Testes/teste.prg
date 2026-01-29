set date british
clear

dInic := cTod("25/01/2005")
dHoje := Date()

idade := year(dHoje)-year(dInic)
if month(dInic) < month(dHoje)
   idade--
elseif month(dInic) == month(dHoje)
   if day(dInic) == day(dHoje)
      idade --
   endif
endif

?dInic
?dHoje
?idade

