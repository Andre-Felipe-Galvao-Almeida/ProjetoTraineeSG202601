setmode(25,50)
clear

nX   := 0
nY   := 8
nYD  := nY
pace := 1

do while .t.
   clear
   if nYD >= nY+3
      pace := -1
   elseif nYD <= nY-3
      pace := 1
   endif

   nYD += pace




   //cabe‡a
   @nX,nYD to nX+10,nYD+20

   //Ombro
   @nX+13,nYD-4 to nX+13,nYD+24

   //Bacia
   @nX+20,nY to nX+20,nY+20

   //Tronco
   @nX+11,nYD+10 to nX+20,nYD+10

   //Pernas
   @nX+20,nY to Nx+30,nY
   @nX+20,nY+20 to Nx+30,nY+20


   @nX+5,nY+25 say "Me chamo Jorge"

   inkey(0.5)
end do
