require 'sinatra'
require 'json'
require_relative "../lib/PrefixTree"

WORD_SRCPATH = "wordsrc/src.txt"

set :port,8085

configure do
  tree = PrefixTree::MyPrefixTree.new
  begin
    tree.loadFromFile(WORD_SRCPATH)
  rescue
    puts 'error appeared loading data from source file'
  end

  set :tree, tree
end

get '/' do
  'Use one of following commands: <b>add, find, contains</b> to work work with PrefixTree <br> Minimal word length for find and contains operations is 3 symbols'
end

get '/add?:word' do
  content_type :json
  word = params.keys.first
  options.tree.add(word)
end

get '/find?:word' do
  content_type :json
  word = params.keys.first

  if(word.length<3)
    return 'Specified word contains less than 3 symbols'
  end

  words = options.tree.find(word)
  {words: words}.to_json
end

get '/contains?:word' do
  content_type :json
  word = params.keys.first
  if(word.length<3)
    return 'Specified word contains less than 3 symbols'
  end
  {result: options.tree.contains(word)}.to_json
end


