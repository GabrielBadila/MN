% Task 2 Strassen

function strassen(fisier_in,fisier_out)

% Citirea din fisier a matricei si a puterii la care trebuie ridicata
numefis=fisier_in;
f=0;
f=fopen(numefis,'r');
n=fscanf(f, "%f", 1);
A=dlmread(f);
fclose(f);
minim=32;

[l,l]=size(A);

% Aplicarea algoritmului Strassen
z=floor(l/2);
A1=A(1:z,1:z);
A2=A(1:z,(z+1):l);
A3=A((z+1):l,1:z);
A4=A((z+1):l,(z+1):l);

B1=A1;
B2=A2;
B3=A3;
B4=A4;

for i=1:n-1

	Q1=stras((A1+A4),(B1+B4),minim);
	Q2=stras((A3+A4),B1,minim);
	Q3=stras(A1,(B2-B4),minim);
	Q4=stras(A4,(B3-B1),minim);
	Q5=stras((A1+A2),B4,minim);
	Q6=stras((A3-A1),(B1+B2),minim);
	Q7=stras((A2-A4),(B3+B4),minim);

	C1=Q1+Q4-Q5+Q7;
	C2=Q3+Q5;
	C3=Q2+Q4;
	C4=Q1-Q2+Q3+Q6;

	B1=C1;
	B2=C2;
	B3=C3;
	B4=C4;
		
	S=[C1,C2;C3,C4];
endfor

% Determinarea inversei matricei finale
F = part(S);

% Scrierea in fisier a matricei obtinute
[l, c] = size(F);
f=fopen(fisier_out, 'w');
for i=1:l
	for j=1:c
		fprintf(f, '%f', F(i,j));
		fprintf(f, '%c', ' ');
	endfor
	fprintf(f, '%c', "\n");
endfor

fclose(f);

endfunction
