require_relative "../lib/PrefixTree/version"
require "zip/zip"

module PrefixTree
  # Your code goes here...
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

    def get_all_words
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
      v = @root
      word.each_char do |i|
        unless v.children.has_key?(i)
          return false;
        end
        v=v.children[i]
      end

      return true
    end

    def find(word)
      v = @root
      word.each_char do |i|
        unless v.children.has_key?(i)
          return "not found";
        end
        v=v.children[i]
      end
      @searchRes = Array.new
      getValue(v,word)

      return @searchRes
    end

    def load_from_file(fullName)
       File.open(fullName).each { |line| add(line.delete("\n")) }
    end

    def save_to_file(fullName)
      File.open(fullName, 'w') do |f|
        get_all_words.each { |word| f.puts(word) }
      end
    end

    def load_from_zip(fullName,textFileName)
      Zip::ZipFile.open(fullName) {
          |zipfile|
        zipfile.read(textFileName).split("\n").each do
          |line|
          add(line)
        end
      }
    end

    def save_to_zip(fullName,textfileName)
      Zip::ZipFile.open(fullName, Zip::ZipFile::CREATE){
       |zipfile| zipfile.get_output_stream(textfileName) { |f| get_all_words.each { |word| f.puts word }}
      }
    end

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


