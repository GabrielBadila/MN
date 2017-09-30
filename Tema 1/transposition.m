% Task 1C Transposition

function transposition
[string, k, n] = readC('input1C'); % Functia 'readC' definita de mine

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

inc=k; % incrementul
ch=1000; % change of k, atunci cand k isi modifica valoarea

% Aflu cate elemente va avea matricea patratica cu care voi lucra, p*p elemenete
for i=1:length(string)
	if(i*i>ch)
		p=i;
		break;
	endif
endfor

maxim=p*p; % numarul de elemente ale matricei

fin=length(string); % lungimea sirului
z=mod(fin, 1000); % numarul de elemente din sir pe care il va contine ultima matrice
nr=floor(fin/1000); % numarul de matrice care contin fix 1000 de elemente din sir

% Intai verific daca sirul meu are mai putin de 1000 de elemente. In acest caz 
% nu va mai trebui sa modific valoarea k-ului
if(fin<=1000)
	for j=1:maxim
		if(j<=fin)
			trans(j)=string(j);
		else
			trans(j)=0; % adaug 0 pana ajung la numarul maxim de elemente
		endif
	endfor

	ll=reshape(trans, p, []);

	for j=1:p
		ll(p+1,j)=1; % ii mai adaug matricei o linie plina de 1
	endfor

	% Construiesc matricea de codificare
	matI=eye(p+1);
	for j=1:p
		matI(j,p+1)=inc;
	endfor

	% Inmultesc matricea de codificare cu matricea mea
	cod=matI*ll;

	% Elimin ultima linie din matrice finala deoarece aceasta corespunde cu
	% linia plina de 1 adaugata initial
	cod([p+1],:) = [];

	A = reshape(cod,1,[]); % transform matricea inapoi in sir numeric
	A = A(1:end-(maxim-fin)); % elimin elementele corespondente zerourilor adaugate

	for j=1:length(A)
		A(j)=mod(A(j),29);
	endfor

	% Afisez sirul obtinut transformand numerele inapoi in caractere
	f = fopen('output1C','w');

	for j=1:fin
		if(A(j) == 0)
			fprintf(f, '%c' , ' ');
		endif

		if(A(j)>=1 && A(j)<=26)
			fprintf(f, '%c', A(j)+96);
		endif

		if(A(j) == 27)
			fprintf(f, '%c', '.');
		endif

		if(A(j) == 28)
			fprintf(f, '%c', '''');
		endif
	endfor

	fclose(f);

else
	% Daca sirul meu are mai mult de 1000 element construiesc matrici cu cate 
	% 1000 de elemente din sir si incrementez k-ul de fiecare data
	for i=1:nr+1
		if(i<=nr)
			for j=1:maxim
				if(j<=1000)
					trans(j)=string((i-1)*1000+j);
				else
					trans(j)=0;
				endif
			endfor

			ll=reshape(trans, p, []);

			for j=1:p
				ll(p+1,j)=1; % ii mai adaug matricei o linie plina de 1
			endfor

			% Construiesc matricea de codificare
			matI=eye(p+1);
			for j=1:p
				matI(j,p+1)=inc;
			endfor

			% Inmultesc matricea de codificare cu matricea mea
			cod=matI*ll;

			cod([p+1],:) = []; % elimin ultima linie din matrice finala

			A = reshape(cod,1,[]); % transform matricea inapoi in sir numeric
			A = A(1:end-(maxim-1000)); % elimin elemente

			for j=1:length(A)
				A(j)=mod(A(j),29);
			endfor

			if(i==1)
				f = fopen('output1C','w');
			else 
				f = fopen('output1C','a');
			endif

			% Afisez sirul obtinut transformand numerele inapoi in caractere
			for j=1:length(A)
				if(A(j) == 0)
					fprintf(f, '%c' , ' ');
				endif

				if(A(j)>=1 && A(j)<=26)
					fprintf(f, '%c', A(j)+96);
				endif

				if(A(j) == 27)
					fprintf(f, '%c', '.');
				endif

				if(A(j) == 28)
					fprintf(f, '%c', '''');
				endif
			endfor

			fclose(f);

		else
			% Acest caz este intalnit la ultima matrice formata
			for j=1:maxim
				if(j<=z)
					trans(j)=string((i-1)*1000+j);
				else
					trans(j)=0;
				endif
			endfor

			ll=reshape(trans, p, []);

			for j=1:p
				ll(p+1,j)=1; % ii mai adaug matricei o linie plina de 1
			endfor

			% Construiesc matricea de codificare
			matI=eye(p+1);
			for j=1:p
				matI(j,p+1)=inc;
			endfor

			% Inmultesc matricea de codificare cu matricea mea
			cod=matI*ll;

			cod([p+1],:) = []; % elimin ultima linie din matrice finala

			A = reshape(cod,1,[]); % transform matricea inapoi in sir numeric
			A = A(1:end-(maxim-z)); % elimin elemente

			for j=1:length(A)
				A(j)=mod(A(j),29);
			endfor

			% Afisez sirul obtinut transformand numerele inapoi in caractere
			f = fopen('output1C','a');

			for j=1:length(A)
				if(A(j) == 0)
					fprintf(f, '%c' , ' ');
				endif

				if(A(j)>=1 && A(j)<=26)
					fprintf(f, '%c', A(j)+96);
				endif

				if(A(j) == 27)
					fprintf(f, '%c', '.');
				endif

				if(A(j) == 28)
					fprintf(f, '%c', '''');
				endif
			endfor

			fclose(f);

		endif

		inc++;
	endfor
endif

% Construiesc matricea de codificare 
matI=eye(p+1);
for j=1:p
	matI(j,p+1)=k;
endfor

[l, c] = size(matI);

% Afisez matricea de codificare 
dlmwrite('key1C',matI,' ');

endfunction
