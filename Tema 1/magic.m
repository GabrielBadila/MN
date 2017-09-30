% Functia 'magic' ce realizeaza calcularea inversului modulo 29 al numarului x
% Functie folosita in cadrul task-ului 1B

function [m] = magic(x)

for i=1:29
	if (mod(i*x,29)==1)
		m=i;
	endif
endfor

endfunction
