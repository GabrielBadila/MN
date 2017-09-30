% Cerinta 6 - PutereInv

function [valp vecp] = PutereInv(d, s, h, y, maxIter, eps)
	% Intrari:
	% -> d: diagonala principala a matricei tridiagonale simetrice;
	% -> s: supradiagonala matricei tridiagonale simetrice;
	% -> y: aproximatia initiala a vectorului propriu;
	% -> h: deplasare;
	% -> maxIter: numarul maxim de iteratii;
	% -> eps: precizia determinarii.
	% Iesiri:
	% -> [valp vecp]: valoarea proprie valp, respectiv vectorul propriu vecp.

	k=0;
	y0=y/norm(y);

	% Utilizand algoritmul Thomas si metoda puterii inverse invatate la 
	% laborator determin valoarea proprie cea mai apropiata de o deplasare data 
	% si vectorul corespunzator
	while k < maxIter
		y=Thomas(s,d-h,s,y0);
		y=y';	
		y=y/norm(y);
		y0=y;
		k=k+1;
		
		valp = inmult(d, s, y)*y;
		h=valp;
		aux = inmult(d, s, y);
		
		if norm(inmult(d,s,y) - valp*y') < eps
			break;
		endif
	endwhile
	vecp=y;  

endfunction
