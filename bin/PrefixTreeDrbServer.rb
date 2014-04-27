require 'drb/drb'
require_relative "../lib/PrefixTree"

# The URI for the server to connect to
MySRV_URI="druby://localhost:8788"


class PrefixTreeDrbServer
  private
  attr_accessor :tree

  public
   def initialize
     @tree = PrefixTree::MyPrefixTree.new
     @tree.load_from_file("D:/dictionary.txt")
     puts 'PrefixTree service Started'
   end

  def add(word)
    @tree.add(word)
  end

  def contains(word)
    @tree.contains(word)
  end

  def find(word)
    @tree.find(word)
  end

  def outputTree
    @tree.printSorted(@tree.root,"")
  end
end

# The object that handles requests on the server
FRONT_OBJECT=PrefixTreeDrbServer.new

$SAFE = 1   # disable eval() and friends

DRb.start_service(MySRV_URI, FRONT_OBJECT)
# Wait for the drb server thread to finish before exiting.
DRb.thread.join