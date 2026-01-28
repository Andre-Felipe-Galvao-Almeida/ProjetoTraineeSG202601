cNome := "Andr‚ Almeida"
nPeso := 0
nIdade := 0

clear

@00,00 say "Ol " + cNome + ",Favor complete seu cadastro:"
@01,00 say "Idade:"
@02,00 say "Peso*:"

@01,07 get nIdade
@02,07 get nPeso
read

clear

@00,00 say "Cadastro completo"
@01,00 say "Nome*:" + cNome
@02,00 say "Idade:" + str(nIdade,2,0)
@03,00 say "Peso*:" + str(nPeso,3,0) - "Kg"


