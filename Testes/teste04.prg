setmode(25,80)
setcolor('N+/W')
clear

cMensagem := space(20)


@00, 00 say "Envie uma mensagem para s¡:"

@01, 00 get cMensagem picture "@!" valid !empty(cMensagem)
read

@02, 00 say "----------------"
@03, 00 say alltrim(cMensagem)+", foi sua Mensagem!"


