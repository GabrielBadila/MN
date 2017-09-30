# Desenarea unor obiecte statice - Interpolare (Romanian language)


	Metode Numerice

	Tema 3 - Desenarea unor obiecte statice - Interpolare
   
	Badila Gabriel Alin
	313 CA
   
   
DESCRIERE
   
	Problema 1
	
	In fisierul "F1.m" citesc din fisierul "dodel.txt" primele doua valori 
	numerice (n = numarul de randuri ce urmeaza a fi citite, m = numarul de 
	valori pentru care sunt generate m-1 intervale echidistante). Intr-un 'for' 
	citesc fiecare linie din fisier si atribui valorile de pe fiecare linie in 
	doi vectori x (valori pe axa Ox) si y (valori pe axa Oy). Folosesc apoi 
	functia 'linspace' pentru a genera m-1 intervale. Apelez functia "neville" 
	ce imi returneaza un vector de puncte. Cu vectorul creat prin functia 
	'linspace' si vectorul determinat cu functia 'neville' desenez graficul.
	In fisierul "neville.m" se determina polinomul de interpolare si se 
	returneaza un vector de puncte pentru determinarea graficului.
	
	Problema 2
	
	Fisierul "F2.m" este construit in mod asemanator cu fisierul "F1.m", singura 
	diferenta fiind ca in loc sa fie apelata functia "neville", este apelata 
	functia "spline_lin".
	In fisierul "spline_lin.m" se determina functia liniara yp = a * xp + b cu 
	ajutorul formulelor din cursul 9. Functia "spline_lin" va returna vectorul 
	'yp' ce contine punctele necesare desenarii graficului.
	Citirea se face din fisierul "barcelona.txt".
	
	Problema 3
	
	Fisierul "F3.m" este construit in mod asemanator cu fisierul "F1.m", 
	singurele diferente fiind: sortarea elementelor, pentru ca spre deosebire 
	de primele doua probleme, aici elementele necesita o sortare crescatoare 
	dupa valorile de x; apelarea functiei "spline_cub".
	In fisierul "spline_cub.m" sunt stocate in vectorul 'h' lungimea 
	intervalelor dintre fiecare doua puncte consecutive din 'x'. Apoi pentru 
	determinarea parametrilor necesari polinomului final sunt folositi niste 
	parametrii auxiliari (a, l, u, z). Polinomul 
	yp = d*(xp-x)^3 + c*(xp-x)^2 + b*(xp-x) + a, unde a = y, stocheaza in 
	vectorul yp punctele necesare desenarii graficului. Parametrii sunt 
	obtinuti cu ajutorul formulelor din cursul 9.
	Citirea se face din fisierul "realmadrid.txt".
