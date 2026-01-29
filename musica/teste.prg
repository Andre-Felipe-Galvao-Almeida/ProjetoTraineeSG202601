clear

#include "C:\hb32\tests\sound.prg"

//tune in octave 3

nC      := 130.81
nCSharp := 138.59
nD      := 146.83
nDSharp := 155.56
nE      := 164.81
nF      := 174.61
nFSharp := 185
nG      := 196
nGSharp := 207.65
nA      := 220
nASharp := 233.08
nB      := 246.94

//Para descer uma oitava basta dividir por dois
//Para Subir uma oitava basta multiplicar por dois

tone(nC, 15)
tone(nE, 15)
tone(nG, 15)

cMelody := l2bin(nC) + l2bin(15) + l2bin(nE) + l2bin(15) + l2bin(nG) +l2bin(15)


sound(cMelody)
