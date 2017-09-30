% Functia de spline-uri liniare

% Aceasta functia va genera un vector de puncte pentru desenarea graficului

function yp = spline_lin(x, y, xp)

	n = length(x);	% lungimea vectorului x-urilor
	m = length(xp);	% lungimea vectorului punctelor de interpolare
	yp = zeros(1, m);

	% Generarea vectorului de puncte pentru desenarea graficului
	for	i=1:n-1
		for j=1:m
			if xp(j) >= x(i) && xp(j) <= x(i+1)
				a = (y(i+1) - y(i)) / (x(i+1) - x(i));
				b = (x(i+1) * y(i) - x(i) * y(i+1)) / (x(i+1) - x(i));

				yp(j) = a * xp(j) + b;
			endif
		endfor
	endfor

endfunction
