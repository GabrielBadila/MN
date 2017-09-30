% Functia "inmult" definita de mine pentru a inmulti o matrice cu un vector 
% fara a crea matricea

function x = inmult(d, s, y)

	x=0;
	n=length(d);

	x(1) = y(1)*d(1) + y(2)*s(1);
	x(n) = y(n-1)*s(n-1) + y(n)*d(n);

	for i=2:n-1
		x(i) = y(i-1)*s(i-1) + y(i)*d(i) + y(i+1)*s(i);
	endfor

endfunction
