% Problema 3

function F3

	% Citirea din fisier a numarului de puncte (x-uri si y-uri) si a numarului 
	% de puncte de interpolare
	f=fopen("realmadrid.txt");
	m = fscanf(f, '%d', 1);
	n = fscanf(f, '%d\n', 1);

	for i = 1:n
		v = zeros(1,1);
		v = fgetl(f);
		v = str2num(v);

		% Crearea vectorului x-urilor si vectorului y-urilor
		x = zeros(1,1);
		y = zeros(1,1);
		x = v(1:length(v)/2);
		y = v((length(v)/2 + 1): end);

		% Sortarea vectorilor x si y
		for j=1:length(x)
			for k=1:length(x)-1
				if(x(k) > x(k+1))
					aux = x(k);
					x(k) = x(k+1);
					x(k+1) = aux;
					
					aux = y(k);
					y(k) = y(k+1);
					y(k+1) = aux;
				endif
			endfor
		endfor

		% Aflarea punctelor necesare pentru desenarea graficului folosind 
		% spline-uri cubice
		xp = linspace(x(1), x(end), m);
		yp = spline_cub(x, y, xp);

		% Desenarea graficului
		hold on;
		plot(xp, yp);
	endfor

	fclose(f);	

endfunction
