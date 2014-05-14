require_relative "../lib/PrefixTree/version"
require "zip/zip"

module PrefixTree
  # class that provide operations with prefix tree
  class MyPrefixTree

    attr_accessor :root
    attr_accessor :searchRes

    def initialize()
      @root = TrieNode.new
      @searchRes = Array.new
    end

    def printSorted(treeNode,s)
      treeNode.children.each_key do |k|
        printSorted(treeNode.children[k],s+k)
      end
      if treeNode.leaf
        puts s
      end
    end

    def getAllWords
      @searchRes  = []
      getValue(root,"")
      return @searchRes
    end

    def getValue(treeNode,s)
      treeNode.children.each_key do |k|
        getValue(treeNode.children[k],s+k)
      end
      @searchRes<<s if treeNode.leaf
    end

    def add(word)
      v = @root
      word.each_char do |i|
        unless v.children.has_key?(i)
          v.children[i]=TrieNode.new
        end
        v=v.children[i]
      end
      v.leaf=true
    end

    def contains(word)
      wordPresent, node = iterateThroughTrie(word)
      return wordPresent && node.leaf
    end

    def find(word)
      @searchRes = Array.new

      if word.length < 3
        return []
      end

      wordPresent, node = iterateThroughTrie(word)
      if wordPresent
        getValue(node,word)
      end

      return @searchRes
    end

    def iterateThroughTrie(word)
      v = root
      word.each_char do |char|
        unless v.children.has_key?(char)
          return [false, v]
        end
        v = v.children[char]
      end
     return [true, v]
    end

    def loadFromFile(fullName)
       File.open(fullName).each { |line| add(line.delete("\n")) }
    end

    def saveToFile(fullName)
      File.open(fullName, 'w') do |f|
        getAllWords.each { |word| f.puts(word) }
      end
    end

    def loadFromZip(fullName,textFileName)
      Zip::ZipFile.open(fullName) {
          |zipfile|
        zipfile.read(textFileName).split("\n").each do
          |line|
          add(line)
        end
      }
    end

    def saveToZip(fullName,textfileName)
      Zip::ZipFile.open(fullName, Zip::ZipFile::CREATE){
       |zipfile| zipfile.get_output_stream(textfileName) { |f| getAllWords.each { |word| f.puts word }}
      }
    end

    class TrieNode

      @children
      @leaf

      attr_accessor :leaf
      attr_accessor :children

      def initialize()
        @children = Hash.new
        @leaf = false
      end

    end

  end

end


