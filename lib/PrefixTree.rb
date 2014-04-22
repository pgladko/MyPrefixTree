require "PrefixTree/version"

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


