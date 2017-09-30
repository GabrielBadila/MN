%Functia pentru determinarea matricei la puterea n, folosind algoritmul Strassen

function [C] = stras(A,B,minim);
[la,ca]=size(A);
[lb,cb]=size(B);

if(la>ca) a=la;
else a=ca;
endif

if(lb>cb) b=lb;
else b=cb;
endif

if (a>b) n=a;
else n=b;
endif

% Daca n e mai mic decat un anumit minim ales de mine (32), inmultirea este 
% facuta normal fara a mai utiliza algoritmul Strassen
if(n<minim) C=A*B;
else
	% Altfel daca n>=minim este utilizat algoritmul Strassen
	if(mod(la,2) ~= 0)
		la=la+1;
		A(la,:)=0;
	endif
	if(mod(ca,2) ~= 0)
		ca=ca+1;
		A(:,ca)=0;
	endif
	if(mod(lb,2) ~= 0)
		lb=lb+1;
		B(lb,:)=0;
	endif
	if(mod(cb,2) ~= 0)
		cb=cb+1;
		B(:,cb)=0;
	endif
	
	zl=la/2;
	zc=ca/2;
	
	A1=A(1:zl,1:zc);
	A2=A(1:zl,(zc+1):ca);
	A3=A((zl+1):la,1:zc);
	A4=A((zl+1):la,(zc+1):ca);
	
	zl=lb/2;
	zc=cb/2;
	
	B1=B(1:zl,1:zc);
	B2=B(1:zl,(zc+1):cb);
	B3=B((zl+1):lb,1:zc);
	B4=B((zl+1):lb,(zc+1):cb);


	Q1=stras(A1+A4,B1+B4,minim);
	Q2=stras(A3+A4,B1,minim);
	Q3=stras(A1,B2-B4,minim);
	Q4=stras(A4,B3-B1,minim);
	Q5=stras(A1+A2,B4,minim);
	Q6=stras(A3-A1,B1+B2,minim);
	Q7=stras(A2-A4,B3+B4,minim);

	C1=Q1+Q4-Q5+Q7;
	C2=Q3+Q5;
	C3=Q2+Q4;
	C4=Q1-Q2+Q3+Q6;

	C=[C1,C2;C3,C4];

endif

endfunction
