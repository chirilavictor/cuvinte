#this takes the input file
input = File.open("text.txt", "r")#ce inseamna "r"

#creating the contents array with all the words
contents = input.readlines


#formating the text
contents.map! { |w| w.downcase.chomp! }

#sorting all the words acording to length
#contents.sort!{ |x, y| x.length <=> y.length }

#creating a hash
words_hash = Hash.new

#adding the keys to the hash 
###### se parcurge fiecare element din array, se masoara lungimea lui si se creeaza cate o singura cheie???
###### de ce se creeaza cate o singura cheie???
###### cum se creeaza un hash cu lungimea fiecarui cuv din array
contents.each{ |w| words_hash[w.length] = [] }

#adding the words inside the hash
##### notatia += [] este identica cu notatia de alipire a unui arr la alt arr
##### notatia << trasmite comanda de adaugare a unui element intr-un arr
contents.each{ |w| words_hash[w.length] += [] << w }

#sorting the words from the arrays inside the hash in alphabetical order
words_hash.each{ |key, val| val.sort! }

#sorting the keys into a array
keys_array = words_hash.keys.sort!
#puts keys_array



##### ?????? 
#deci mutam valorile cheilor din keys_array in hash_values 
#si .. words_hash[k]???
hash_values = keys_array.collect{ |k| words_hash[k] }
 puts hash_values #.class doar un test
 #deci am mutat valorile cheilor si dupa am scris valorile 
 # am creat pe scurt mai multe arr intr-un arr
 # fara sa se copieze cheile ci s-au copiat valorile 


#this creates the output file
output = File.new("words_ordered2.txt", "w")# ce inseamna "w"
output.puts hash_values
output.close

	puts "The task is FUCKING DONE!!!!"
