input = File.open("wordlist.txt") #incarcam fisierul dorit

arr1 = input.readlines #citim liniile de text si adaugam fiecare cuvant in array-ul arr1
arr1.map!{ |x| x.downcase } #rescriem toate cuvintele cu litere mici
arr1.sort_by! { |x| x.length }# sortam cuvintele din arr1 in functie de lungimea lor

#deci daca avem cuvintele ordonate dupa lungime inseamna ca de a lungul intregului array -->
#-->nu exista decat doua situatii care se repeta. Anume: arr1[i].length == arr[i+1].length sau nu este egal: arr1[i].length != arr1[i+1].length -->
#-->scriptul "exploateaza" fix aceasta "vulnerabilitate" a problemei

arr2 = [] #acest array il vom folosi pt a sorta fiecare grup de cuvinte egale
arr3 = [] #in acest array vom "varsa" continutul din arr2 ordonat corespunzator

i = 0 # pt a parcurge arr1 avem nevoie de o variabila pe care sa o incrementam mai tarziu in cadrul loop-ului nostru

while arr1[i+3] != nil do #conditia ca loop-ul sa functioneze
	#acest loop identifica cuvintele cu marimi egale si le pune in arr2 unde aplicam funtia .sort pt a le ordona alfabetic
	while arr1[i].length == arr1[i+1].length
		arr2 << arr1[i]#fiecare cuvant e adaugat in arr2
		#acest test e necesar pt a prinde ultimul cuvant cu lungime egala
		if arr1[i].length == arr1[i+1].length and arr1[i+1].length != arr1[i+2].length 
			arr2 << arr1[i+1]#il adaugam si pe el la arr2
		end
		i += 1#incementarea in cadrul loop-ului secundar
	end
	#in momentul asta in arr2 avem o serie de cuvinte cu lungime egala dar neordonate alfabetic
	arr2.sort!#pur si simlu le ordonam alfabetic
	arr3 << arr2#le adaugam la arr3(array-ul unde vom avea toate cuv ordonate corespunzator)
	arr2 = []#golim continutul din arr2 pentru a face loc urmatorului sir de cuvinte egale
	#facem testul asta pentru a prinde cuvintele cu lungim unicat
	if arr1[i].length != arr1[i+1].length and arr1[i+1].length != arr1[i+2].length
		arr3 << arr1[i+1]#pt ca este doar un cuvant nu este necesr sa-l adaugam mai intai la arr2 pt ordonare alfabetica si astfel in punem direct in arr3
	end

	i += 1#acum pentru a trece la urmatorul sir de cuvinte egale incrementam i si o luam de la capat
end

#am folosit variabilele a,b,c ca sa nu mai scriu d fiecare data tot
#arr1[-1] inseamna ultima valoare a lui arr1
a = arr1[-3].length#lungimea antepenultimei valoare din arr1
b = arr1[-2].length#lungimea penultimei valoare din arr1
c = arr1[-1].length#lungimea ultimei valoare din arr1
#pentru ca loop-ul de mai sus functionea doar pana la antepenultima valoare din array ne ramane de facut astfel cateva situatii de exeptie
#dupa cum vedeti aici sunt 4 cazuri posibile(nu uitam ca avem cuvintele ordonate dupa lungime deja)
if a == b and  b == c
	arr2 << arr1[-3]
	arr2 << arr1[-2]
	arr2 << arr1[-1]
	arr2.sort!
	arr3 << arr2
	elsif a == b and b != c 
		arr2 << arr1[-3]
		arr2 << arr1[-2]
		arr2.sort!
		arr3 << arr2
		arr3 << arr1[-1]
	elsif a != b and b == c
		arr2 << arr1[-2]
		arr2 << arr1[-1]
		arr2.sort!
		arr3 << arr2
	elsif a != b and b != c
		arr3 << arr1[-3]
		arr3 << arr1[-2]
		arr3 << arr1[-1]
end
#la partea asta ca si la prima parte cand am citit fisierul i-am dat copy paste de la Marius
#acum cuvintele ordonate corespunzator pe care le avem in arr3 le scoatem si le printam pe un fisier aparte
output = File.new("cuv4.txt", "w")# inca nu am inteles ce face litera w aici????am incercat fara si nu merge sriptul.  
output.puts arr3
output.close


