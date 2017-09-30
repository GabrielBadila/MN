% Cerinta 3 - LimiteValProprii

function [limita_inf, limita_sup] = LimiteValProprii(d, s)
	% Intrari:
	% -> d: diagonala principala a matricei tridiagonale simetrice;
	% -> s: supradiagonala matricei tridiagonale simetrice.
	% Iesiri:
	% -> [limita_inf limita_sup]: limitele incadratoare pentru valorile 		proprii ale matricei tridiagonale simetrice.

	M=0;
	N=0;

	% Utilizand teorema lui Gershgorin determin limitele valorilor proprii
	for i=1:length(d)
		if (i == 1)
			t = s(1);
		elseif (i == length(d))
			t = s(i-1);
		else 
			t = s(i) + s(i-1);
		endif
		M(i) = d(i) - abs(t);
		N(i) = d(i) + abs(t);
	endfor

	limita_inf = min(M);
	limita_sup = max(N);

endfunction
