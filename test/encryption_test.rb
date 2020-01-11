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
    
    assert_equal character_set, @encryption.character_set
    assert_equal "hello world", @encryption.message
    assert_equal "02715", @encryption.key
    assert_equal "040895", @encryption.date
  end
  
  def test_it_can_get_encryption
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}
    assert_equal expected, @encryption.get_encryption
  end
  
  def test_it_can_create_shift_keys
    shift_keys = [02, 27, 71, 15]
    assert_equal shift_keys, @encryption.create_shift_keys(@encryption.key)
  end
  
  def test_it_can_offset_shift_keys
    shift_keys = @encryption.create_shift_keys(@encryption.key)
    offset_shift_keys = {A: 3, B: 27, C: 73, D: 20}
    
    assert_equal offset_shift_keys,
      @encryption.offset_shift_keys(shift_keys, @encryption.date)
  end
  
  def test_it_can_shift_message
    assert_equal "keder ohulw", @encryption.shift_message(@encryption.message)
  end
end