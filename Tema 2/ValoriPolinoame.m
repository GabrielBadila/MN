% Cerinta 1 - ValoriPolinoame

function P = ValoriPolinoame(d, s, val_lambda)
	% Intrari:
	% -> d: diagonala principala a matricei tridiagonale simetrice;
	% -> s: supradiagonala matricei tridiagonale simetrice;
	% -> val_lambda: valoare pentru lambda.
	% Iesiri:
	% -> P: vectorul P = [P0(val_lambda) P1(val_lambda), ..., Pn(val_lambda)].

	% Calcularea polinomului caracteristic
	P0=1;
	P=d(1)-val_lambda;
	P(2)=(d(2)- val_lambda)*P(1) - s(1)*s(1)*P0;
	for i=3:length(d)
		P(i)=(d(i)- val_lambda)*P(i-1) - s(i-1)*s(i-1)*P(i-2);
	endfor
	P=[P0 P];

endfunction
