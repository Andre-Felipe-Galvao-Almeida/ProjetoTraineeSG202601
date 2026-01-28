clear

nNumero01 := 0
nNumero02 := 0

@00,00 say "Insira dois numeros:"

@01,00 get nNumero01
@02,00 get nNumero02
read

clear

@00,00 say "Os valores das operaá‰es com esses produtos s∆o:"
@01,00 say "Soma*********: " +str(nNumero01 + nNumero02)
@02,00 say "Subtraá∆o****: " +str(nNumero01 - nNumero02)
@03,00 say "Multiplicaá∆o: " +str(nNumero01 * nNumero02)
@04,00 say "Divis∆o******: " +str(nNumero01 / nNumero02)


