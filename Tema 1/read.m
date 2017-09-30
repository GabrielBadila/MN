% Functia 'read' ce realizeaza citirea din fisier pentru task-urile 1A si 1B

function [string, matrix, n] = read(in, key)
	f=fopen(in);
	string=fgetl(f);
	fclose(f);
	string=lower(string);
	f=fopen(key);
	n=fgetl(f);
	fclose(f);
	n=str2num(n);
	matrix=dlmread(key,' ', 1, 0);
endfunction
