clear

nVarFds := 0

@00,00 say "Diga:"

@00,06 get nVarFds
read

if nVarFds=0
   @01,00 say "0"
elseif (nVarFds > 0)
   @01,00 say "Big"
else
   @01,00 say "Low"
end if

