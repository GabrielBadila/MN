% Task 1A MatrixCipher

function matrixCipher
[string, matrix, n] = read('input1A','key1A'); % Functia 'read' definita de mine

% Convertirea caracterelor in numere
for i=1:length(string)
	if(string(i) == ' ')
		string(i) = 0;
	endif
		
	if(string(i) >= "a" && string(i) <= "z")
		string(i) = uint8(string(i)-96);
	endif

	if(string(i) == '.')
		string(i) = 27;
	endif

	if(string(i) == '''')
		string(i) = 28;
	endif
endfor

% Completez cu 0 sirul de numere pana cand lungimea sa devine divizibila cu n
while (mod(length(string), n) ~= 0)
	string(length(string)+1)=0;
endwhile

% Impart sirul de numere in blocuri egale pe care le asez apoi intr-o matrice
string=reshape(string, n,[]);

% Inmultirea dintre matricea de codificare si matricea formata din sirul de caractere
cod=matrix*string;

[l, c] = size(cod);

% Aplic modulo 29 pe fiecare element din matrice, pentru a ma asigura ca niciun
% element nu este mai mare decat 29
for j=1:c
	for i=1:l
		cod(i,j)=mod(cod(i,j),29);
	endfor
endfor

% Scriu matricea rezultata intr-un fisier sub forma unui sir de caractere,
% parcurgand-o pe coloane si transformand numerele inapoi in litere
f = fopen('output1A','w');

for j=1:c
	for i=1:l
		if(cod(i,j) == 0)
			fprintf(f, '%c' , ' ');
		endif

		if(cod(i,j)>=1 && cod(i,j)<=26)
			fprintf(f, '%c', cod(i,j)+96);
		endif

		if(cod(i,j) == 27)
			fprintf(f, '%c', '.');
		endif

		if(cod(i,j) == 28)
			fprintf(f, '%c', '''');
		endif
	endfor		
endfor

fclose(f);

endfunction
