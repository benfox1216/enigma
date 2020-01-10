require_relative 'test_helper'
require './lib/encryption'

class EncryptionTest < Minitest::Test
  def setup
    @encryption = Encryption.new("hello world", "02715", "040895")
  end
  
  def test_it_exists
    assert_instance_of Encryption, @encryption
  end
  
  def test_it_has_attributes
    character_set = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    
    assert_equal "date", @encryption.today
    assert_equal character_set, @encryption.character_set
  end
end