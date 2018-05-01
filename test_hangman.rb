require "minitest/autorun"
require_relative "hangman_ruby.rb"  #You have to change this what is in quotes to the name of your rb files

class Testhangman_rubyrb < Minitest::Test  #The word Addition can be replace with the name of your project

def test_assert_that_1_equals_1
	assert_equal(1,1) 

def test_assert_that_secret_word_returns_secret_word_array
	assert_equal("_ _ _ _ _ _ _", secret_word("secret_word_array"))

end
end
end