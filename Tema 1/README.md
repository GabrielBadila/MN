# Criptografie si matrice (Romanian language)


	Metode Numerice
	
   	Tema 1 - Criptografie si matrice
   
   	Badila Gabriel Alin
   	313 CA
   
   
DESCRIERE
   
	Task1 - Criptografie
	
	Task 1A MatrixCipher
	
	Am citit sirul de caractere din fisier si l-am transformat in sir numeric. 
	Am adaugat zerouri in sir pana cand lungimea lui a devenit divizibila cu n. 
	L-am impartit apoi in blocuri de dimensiuni egale(n) si am asezat blocurile 
	intr-o matrice. Am inmultit matricea de codificare cu matricea mea. Am 
	aplicat pe fiecare element din matrice modulo 29, pentru ca niciun numar sa 
	nu depaseasca valoarea 29. Matricea obtinuta am parcurs-o pe coloane si am 
	afisat-o in fisier transformand numerele inapoi in litere.
	Pentru citirea sirului de caractere si a matricei am folosit functia 'read' 
	creata de mine.
	
	Task 1B Decrypt
	
	Am citit sirul de caractere din fisier si l-am transformat in sir numeric. 
	Am adaugat zerouri in sir pana cand lungimea lui a devenit divizibila cu n. 
	L-am impartit apoi in blocuri de dimensiuni egale(n) si am asezat blocurile 
	intr-o matrice. Am folosit algoritmul Gauss-Jordan pentru a afla inversa 
	matricei de codificare. Am inmultit apoi inversa matricei de codificare cu 
	matricea mea. Am aplicat pe fiecare element din matrice modulo 29, pentru ca 
	niciun numar sa nu depaseasca valoarea 29. Matricea obtinuta am parcurs-o pe 
	coloane si am afisat-o in fisier transformand numerele inapoi in litere. 
	Pentru citirea sirului de caractere si a matricei am folosit functia 'read', 
	iar pentru inversa(modulo 29) din formula Gauss-Jordan am folosit o alta 
	functie 'magic', ambele create de mine.
	
	Task 1C Transposition
	
	Pentru acest task am folosit o matrice de codificare aleasa de mine, ce are 
	1 pe diagonala principala, k pe ultima coloana si 0 in rest:
	
	1 0 0 ... 0 0 k
	0 1 0 ... 0 0 k
	0 0 1 ... 0 0 k
	.
	.
	.
	0 0 0 ... 1 0 k
	0 0 0 ... 0 1 k
	0 0 0 ... 0 0 1
	
	Am citit sirul de caractere din fisier si l-am transformat in sir numeric. 
	Am verificat sa vad ce matrice patratica depaseste imediat 1000 de elemente, 
	si am vazut ca o matrice de 32x32(1024 de elemente) este raspunsul. Am notat 
	numarul maxim de elemenete cu 'maxim' si ordinul matricei cu 'p'.
	
	Am verificat intai cazul in care sirul are o lungime mai mica de 1000. I-am 
	adaugat zerouri pana a ajuns la 'maxim'. I-am adaugat apoi o ultima linie 
	plina de 1. Am construit matricea de codificare de (p+1)x(p+1) elemente. Am 
	inmultit matricea de codificare cu matricea mea. Am eliminat ultima linie 
	ce corespundea cu linia de 1 si un numar de elemente ce corespundeau 
	valorilor de 0 adaugate. Am parcurs-o apoi pe coloane si am afisat-o in 
	fisier schimband numerele inapoi in litere.
	
	Am verificat apoi cazul in care lungimea era mai mare de 1000. Am creat apoi 
	un numar de mod(lungime, 1000) matrici pe care am aplicat acelasi algoritm 
	explicat putin mai sus si le-am afisat in fisier schimband numerele in 
	litere. Ajungand la ultima matrice ce avea mai putin de 1000 de elemente, am 
	completat restul cu zerouri si am aplicat algoritmul descris mai sus, 
	diferenta fiind doar ca am eliminat la final un numar mai mare de elemente.
	
	In final am afisat matricea de codificare folosita.
	
	
	Task2 - Matricile sunt fun!!!
	
	Pentru acest task am folosit trei fisiere: 'strassen.m'(fisierul main), 
	'stras'(in care am implementat algoritmul Strassen), 'part'(in care am 
	implementat metoda partitionarii).
	
	'stras.m' - am pus o conditie legata de un minim dat de mine(32), daca n 
	(numarul maxim dintre liniile si coloanele celor doua matrice) este mai mic 
	decat de minim ales de mine(32) inmultirea se face in mod normal A*B, altfel 
	este utilizat algoritmul Strassen pe care l-am implementat.
	
	'part.m' - la fel ca si la fisierul descris mai sus este vorba de conditia 
	n<minim. In vazul in care 'n' este mai mic decat 'minim' inversa matricei 
	este calculata cu functia din Matlab/Octave 'inv'. Altfel (n>=minim) este 
	utilizata metoda partitionarii invatata la laborator.
	
	ATENTIE: Legat de functia 'inv' am o nelamurire. Pe forum ne este precizat 
	ca este de preferat sa folosim Gauss-Jordan in conditiile impuse de mine 
	(n<minim). Expresia 'de preferat' lasa de inteles ca se poate folosi totusi 
	functia 'inv'. Daca considerati ca functia 'inv' este totusi interzisa si ca 
	nu trebuia sa o folosesc, va rog sa nu-mi anulati punctajul pe toata tema, 
	ci doar pe task-ul 2.
	
	'strassen.m' - fisierul main al task-ului 2. Este realizata citirea din fisier 
	a matricei si a puterii la care trebuie ridicata aceasta. Este implementat 
	algoritmul Strassen pentru ridicare la putere, intr-un 'for'. Este apelata 
	functia 'part' pentru determinarea inversei matricei A^n. In final este 
	scrisa in fisier matricea obtinuta.
	
