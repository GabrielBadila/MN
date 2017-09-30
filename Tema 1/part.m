%Functia pentru determinarea inversei matricei utilizand metoda partitionarii

function [y] = part(A);
[n,n]=size(A);
minim=32;

% Daca n este mai mic decat un minim ales de mine(32) se aplica functia 'inv' 
% din biblioteca Matlab/Octave (detalii despre implementare in README)
if(n<minim) y=inv(A);
else 
	% Altfel daca n>=minim este aplicata metoda partitionarii
	a=floor(n/2);

	A1=A(1:a,1:a);
	A3=A(1:a,a+1:n);
	A2=A(a+1:n,1:a);
	A4=A(a+1:n,a+1:n);

	B1=part(A1);
	B4=part(A4);

	X1=part(A1-stras(stras(A3,B4,minim),A2,minim));
	X2=-stras(stras(B4,A2,minim),X1,minim);
	X4=part(A4-stras(stras(A2,B1,minim),A3,minim));
	X3=-stras(stras(B1,A3,minim),X4,minim);

	y=[X1,X3;X2,X4];
endif

endfunction
