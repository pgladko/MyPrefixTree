require_relative "../lib/PrefixTree"

a = PrefixTree::MyPrefixTree.new

puts "---------------------"
a.add("hello")
puts "Added: hello"
a.add("help")
puts "Added: help"
a.add("hegicopter")
puts "Added: hegicopter"
a.add("hegd")
puts "Added: hegd"
puts "---------------------"
puts "Trie contains hello:"
puts a.contains("hello")

puts "Trie contains banana:"
puts a.contains("banana")
puts "---------------------"
puts "Trie:"
a.printSorted(a.root,"")
puts "---------------------"
puts "Find: hegd"
b =a.find("hegd")
puts "#{b}"




# puts "---------------------"
# puts "Load from file: dictionary.txt"
# a.load_from_file("wordsrc/src.txt")
# puts "Loaded"
# a.printSorted(a.root,"")
# a.save_to_file("D:/dictionary1.txt")
# puts "Saved"


=begin
puts "Load from zip file: dictionary.zip"
a.load_from_zip("D:/dictionary.zip","dictionary.txt")
a.printSorted(a.root,"")
a.save_to_zip("D:/dictionary_new.zip","dictionary_new.txt")
=end

