#this takes the input file
input = File.open("wordlist.txt", "r")

#creating the contents array with all the words
contents = input.readlines

#formating the text
contents.map! { |w| w.downcase.chomp! }

#sorting all the words acording to length
#contents.sort!{ |x, y| x.length <=> y.length }

#creating a hash
words_hash = Hash.new

#adding the keys to the hash
contents.each{ |w| words_hash[w.length] = [] }

#adding the words inside the hash
contents.each{ |w| words_hash[w.length] += [] << w }

#sorting the words from the arrays inside the hash in alphabetical order
words_hash.each{ |key, val| val.sort! }

#sorting the keys into a array
keys_array = words_hash.keys.sort!

hash_values = keys_array.collect{ |k| words_hash[k] }

#this creates the output file
output = File.new("words_ordered.txt", "w")
output.puts hash_values
output.close

puts "The task is FUCKING DONE!!!!"