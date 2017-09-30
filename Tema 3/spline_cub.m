% Functia de spline-uri cubice

% Aceasta functia va genera un vector de puncte pentru desenarea graficului

function yp = spline_cub(x, y, xp)

	n = length(x);	% lungimea vectorului x-urilor
	m = length(xp);	% lungimea vectorului punctelor de interpolare
	yp = zeros(1, m);

	% Lungimea fiecarui interval din x
	for i=1:n-1
		h(i) = x(i+1) - x(i);
	endfor

	a = zeros(1, n-1);

	for i = 2:n-1
		a(i) = 3*(y(i+1) - y(i))/h(i) - 3*(y(i) - y(i-1))/h(i-1);
	endfor

	% Initializarea parametrilor auxiliari
	l = 1;
	u = zeros(1, n-1);
	z = zeros(1, n-1);

	% Calcularea unor parametrii auxiliari ce ofera ajutor in obtinerea 
	% parametrilor de baza
	for i=2:n-1
		l(i) = 2*(x(i+1) - x(i-1)) - h(i-1) * u(i-1);
		u(i) = h(i)/l(i);
		z(i) = (a(i) - h(i-1) * z(i-1))/l(i);
	endfor

	l(n) = 1;
	z(n) = 0;

	% Initializarea parametrilor de baza
	c = zeros(1, n);
	b = zeros(1, n-1);
	d = zeros(1, n-1);

	% Calcularea parametrilor de baza
	for j=n-1:-1:1
		c(j) = z(j) - u(j) * c(j+1);
		b(j) = (y(j+1) - y(j))/h(j) - h(j)*(c(j+1) + 2*c(j))/3;
		d(j) = (c(j+1) - c(j))/(3*h(j));
	endfor

	% Cautarea intervalului din care face parte xp si generarea punctelor 
	% pentru constructia graficului
	for	i=1:n-1
		for j=1:m
			if xp(j) >= x(i) && xp(j) <= x(i+1)			
				yp(j) = d(i) * ((xp(j)-x(i))^3) + c(i) * ((xp(j)-x(i))^2) ...
						+ b(i) * (xp(j)-x(i)) + y(i);
			endif
		endfor
	endfor

endfunction	
