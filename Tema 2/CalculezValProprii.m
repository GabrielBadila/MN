% Cerinta 5 - CalculezValProprii

function vp = CalculezValProprii(d, s, m, eps)
	% Intrari:
	% -> d: diagonala principala a matricei tridiagonale simetrice;
	% -> s: supradiagonala matricei tridiagonale simetrice;
	% -> m: limita pentru numarul de valori proprii;
	% -> eps: precizia determinarii.
	% Iesiri:
	% -> vp: vector de valori proprii, de dimensiune m.

	r = IntervaleValProprii(d, s, m);
	
	% Utilizand metoda bisectiei de la laborator si doua din functiile 
	% implementate anterior determin cu o anumita precizie cele mai mici m 
	% valori proprii
	vp=0;
	for i=1:length(r)-1
		min = r(i);
		max = r(i+1);
		a = ValoriPolinoame(d, s, min);
		b = ValoriPolinoame(d, s, max);
		n1=a(length(a));
		n2=b(length(b));
		
		while n1 * n2 < 0
			c = (min + max)/2;
			f = ValoriPolinoame(d, s, c);
			n3=f(length(f));
			
			if abs(n3) < eps
				x = c;
				break;
			endif
			
			if n3 * n2 < 0
				min = c;
			else
				max = c;
			endif
		endwhile
		vp(i) = x;
	endfor

endfunction
