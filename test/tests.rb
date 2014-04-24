require_relative 'test_helper'
require_relative '../lib/PrefixTree'

class Tests < Minitest::Test
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
    refute_equal res1,["hello"]
    assert_equal res2, "not found"
    refute_equal res2,["hello"]
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

    refute_equal res1, res2
  end

  def test_find_same_word
    a = PrefixTree::MyPrefixTree.new
    a.add("hello")
    a.add("hello")
    res1 = a.find("hel")

    assert_equal res1, ["hello"]
    refute_equal res1,["hello","hello"]
  end


  def test_load_from_file
     a = PrefixTree::MyPrefixTree.new
     File.stub(:open,['hello','help','helicopter']) do
     a.load_from_file('')
     end
     a.get_all_words()
     assert_equal a.searchRes,['hello', 'help','helicopter']
     refute_equal a.searchRes,['hello', 'help']
  end

  # def test_load_from_zip
  #   a = PrefixTree::MyPrefixTree.new
  #   Zip::ZipFile.stub(:open,['hello\n help\n helicopter']) do
  #     a.load_from_zip('','')
  #   end
  #   a.get_all_words()
  #   assert_equal a.searchRes,['hello', 'help','helicopter']
  #   refute_equal a.searchRes,['hello', 'help']
  # end


  end