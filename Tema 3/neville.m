% Metoda Neville

% Cu ajutorul acestei metode calculez polinomul de interpolare pentru a putea 
% desena graficul

function [yp] = neville(x, y, xp)

	n = length(x);	% lungimea vectorului x-urilor

	for k = 1:length(xp)

		P = zeros(n,n);
		P(:,1) = y(:);

		% Calcularea polinomului de interpolare
		for i = 1:n-1
			for j = 1:(n-i)
				P(j,i+1) = ((xp(k)-x(j))*P(j+1,i) + (x(j+i)-xp(k))*P(j,i)) ...
							/(x(j+i)-x(j));
			endfor
		endfor

		yp(k) = P(1,n);
	endfor

endfunction
