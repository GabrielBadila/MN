% Functia 'readC' ce realizeaza citirea din fisier pentru task-ul 1C

function [string, k, n] = readC(in)
	f=fopen(in);
	k=fscanf(f, '%d', 1);
	n=fscanf(f, '%d\n', 1);
	string=fgetl(f);
	fclose(f);
	string=lower(string);
endfunction
