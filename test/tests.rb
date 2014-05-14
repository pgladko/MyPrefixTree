require_relative 'test_helper'
require_relative '../lib/PrefixTree'

class Tests < Minitest::Test

  def test_contains
    myTree = PrefixTree::MyPrefixTree.new
    myTree.add("hello")
    res1 = myTree.contains("hello")
    res2 = myTree.contains("bye")
    assert_equal res1, true
    assert_equal res2, false
  end

  def test_find
    myTree = PrefixTree::MyPrefixTree.new
    myTree.add("hello")
    myTree.add("help")
    res1 = myTree.find("hel")
    res2 = myTree.find("bwe")

    assert_equal res1, ["hello","help"]
    refute_equal res1,["hello"]
    assert_equal res2, []
    refute_equal res2,["hello"]
  end

  def test_find_same_beginning
    myTree = PrefixTree::MyPrefixTree.new
    myTree.add("hell")
    myTree.add("hello")
    res1 = myTree.find("hel")

    assert_equal res1, ["hello","hell"]
  end

  def test_find_2_different
    myTree = PrefixTree::MyPrefixTree.new
    myTree.add("hello")
    myTree.add("peach")
    res1 = myTree.find("hel")
    res2 = myTree.find("pea")

    refute_equal res1, res2
  end

  def test_find_same_word
    myTree = PrefixTree::MyPrefixTree.new
    myTree.add("hello")
    myTree.add("hello")
    res1 = myTree.find("hel")

    assert_equal res1, ["hello"]
    refute_equal res1,["hello","hello"]
  end

  def test_loadFromFile
    myTree = PrefixTree::MyPrefixTree.new
     File.stub(:open,['hello','help','helicopter']) do
       myTree.loadFromFile('')
     end

     assert_equal myTree.getAllWords,['hello', 'help','helicopter']
     refute_equal myTree.getAllWords,['hello', 'help']
  end

  def test_saveToFile
    myTree = PrefixTree::MyPrefixTree.new
    myTree.add 'hello'
    mock = Minitest::Mock.new
    mock.expect(:puts, nil, ['hello'])

    File.stub(:open, nil, mock) do
      myTree.saveToFile('')
    end
    assert_equal ['hello'], myTree.getAllWords
  end

  end