% Task 1B Decrypt

function decrypt
[string, matrix, n] = read('input1B','key1B'); % Functia 'read' definita de mine

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

[l, c] = size(matrix);

% Formez o matrice cu 1 pe diagonala principala si 0 in rest (In)
matI=eye(l);

% Aplic algoritmul Gauss-Jordan pentru a afla inversa matricei de codificare
for j = 1 : l
    for i = j : l
        if matrix(i,j) ~= 0
            for k = 1 : l
                aux =  matrix(j,k);  matrix(j,k) = matrix(i,k); matrix(i,k) = aux;
                aux = matI(j,k); matI(j,k) = matI(i,k); matI(i,k) = aux;
            end
            t = magic(matrix(j,j)); % Functia 'magic' definita de mine
            for k = 1 : l
                matrix(j,k) = mod(t * matrix(j,k), 29);
                matI(j,k) = mod(t * matI(j,k), 29);
            end
            for L = 1 : l
                if L ~= j
                    t = -matrix(L,j);
                    for k = 1 : l
                        matrix(L,k) = mod(matrix(L,k) + t * matrix(j,k), 29);
                        matI(L,k) = mod(matI(L,k) + t * matI(j,k), 29);
                    end
                end
            end            
        end
    end
end

% Inmultirea dintre inversa matricei de codificare si matricea formata din sirul
% ce trebuie decriptat
cod=matI*string;

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
f = fopen('output1B','w');

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
