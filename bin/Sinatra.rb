require 'sinatra'
require 'json'
require_relative "../lib/PrefixTree"

set :port,8085

configure do
  tree = PrefixTree::MyPrefixTree.new
  tree.load_from_file("D:/dictionary.txt")
  set :tree, tree
end

get '/' do
  'Use one of following commands: add, find, contains to work work with PrefixTree'
end

get '/add?:word' do
  content_type :json
  word = params.keys.first
  options.tree.add(word)
end

get '/find?:word' do
  content_type :json
  word = params.keys.first
  words = options.tree.find(word)
  {words: words}.to_json
end

get '/contains?:word' do
  content_type :json
  word = params.keys.first
  {result: options.tree.contains(word)}.to_json
end


