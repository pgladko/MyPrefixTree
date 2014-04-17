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