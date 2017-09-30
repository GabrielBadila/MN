% Cerinta 2 - NrValProprii

function numvp = NrValProprii(d, s, val_lambda)
	% Intrari:
	% -> d: diagonala principala a matricei tridiagonale simetrice;
	% -> s: supradiagonala matricei tridiagonale simetrice;
	% -> val_lambda: valoare pentru lambda.
	% Iesiri:
	% -> numvp: numarul de valori proprii mai mici decit val_lambda.

	P = ValoriPolinoame(d, s, val_lambda);

	% Aplicarea proprietatii unui sir Sturm pentru calcularea numarului de 
	% valori proprii
	numvp=0;
	for i=1:(length(P)-1)
		if P(i)*P(i+1) < 0
			numvp=numvp+1;
		elseif P(i)==0
				numvp=numvp+1;
		endif
	endfor

endfunction
