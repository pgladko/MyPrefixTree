require_relative 'test_helper'
require_relative '../lib/PrefixTree'

class Tests < Test::Unit::TestCase
  def test_contains
    a = PrefixTree::MyPrefixTree.new
    a.add("hello")
    res1 = a.contains("hello")
    res2 = a.contains("bye")
    assert_equal res1, true
    assert_equal res2, false
  end

  def test_find
    a = PrefixTree::MyPrefixTree.new
    a.add("hello")
    a.add("help")
    res1 = a.find("hel")
    res2 = a.find("bwe")

    assert_equal res1, ["hello","help"]
    assert_not_equal res1,["hello"]
    assert_equal res2, "not found"
    assert_not_equal res2,["hello"]
  end

  def test_find_same_beginning
    a = PrefixTree::MyPrefixTree.new
    a.add("hell")
    a.add("hello")
    res1 = a.find("hel")

    assert_equal res1, ["hello","hell"]
  end

  def test_find_2_different
    a = PrefixTree::MyPrefixTree.new
    a.add("hello")
    a.add("peach")
    res1 = a.find("hel")
    res2 = a.find("pea")

    assert_not_equal res1, res2
  end

  def test_find_same_word
    a = PrefixTree::MyPrefixTree.new
    a.add("hello")
    a.add("hello")
    res1 = a.find("hel")

    assert_equal res1, ["hello"]
    assert_not_equal res1,["hello","hello"]
  end
end