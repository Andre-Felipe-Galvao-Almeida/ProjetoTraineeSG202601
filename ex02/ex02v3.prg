cNome := "Andr‚ Almeida"
nPeso := 0
nIdade := 0

clear

@00,00 say "Ol " + cNome + ",Favor complete seu cadastro:"
@01,00 say "Idade:"
@02,00 say "Peso*:"

@01,07 get nIdade picture "99"
@02,07 get nPeso  picture "@e 99.99"
read

clear

@00,00 say "Cadastro completo"
@01,00 say "Nome*:" + cNome
@02,00 say "Idade:"
@03,00 say "Peso*:"

@02,07 say nIdade picture "99"
@03,07 say nPeso  picture "@e 99.99"

