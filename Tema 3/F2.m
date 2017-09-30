% Problema 2

function F2

	% Citirea din fisier a numarului de puncte (x-uri si y-uri) si a numarului 
	% de puncte de interpolare
	f=fopen("barcelona.txt");
	m = fscanf(f, '%d', 1);
	n = fscanf(f, '%d\n', 1);

	for i = 1:n
		v = fgetl(f);
		v = str2num(v);

		% Crearea vectorului x-urilor si vectorului y-urilor
		x = v(1:length(v)/2);
		y = v((length(v)/2 + 1): end);

		% Aflarea punctelor necesare pentru desenarea graficului folosind 
		% spline-uri liniare
		xp = linspace(x(1), x(end), m);
		yp = spline_lin(x, y, xp);

		% Desenarea graficului
		hold on;
		plot(xp, yp);
	endfor

	fclose(f);	

endfunction
