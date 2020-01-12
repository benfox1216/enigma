require_relative 'test_helper'
require './lib/decryption'

class DecryptionTest < Minitest::Test
  def setup
    @decryption = Decryption.new("keder ohulw", "02715", "040895")
  end
  
  def test_it_exists
    assert_instance_of Decryption, @decryption
  end
  
  def test_it_has_attributes
    character_set = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    
    assert_equal character_set, @decryption.character_set
    assert_equal "keder ohulw", @decryption.message
    assert_equal "02715", @decryption.key
    assert_equal "040895", @decryption.date
  end
  
  def test_it_can_get_decryption
    assert_equal "hello world", @decryption.get_decryption
  end
  
  def test_it_can_create_shift_keys
    shift_keys = [02, 27, 71, 15]
    assert_equal shift_keys, @decryption.create_shift_keys(@decryption.key)
  end
  
  def test_it_can_offset_shift_keys
    shift_keys = @decryption.create_shift_keys(@decryption.key)
    offset_shift_keys = {A: 3, B: 27, C: 73, D: 20}
    
    assert_equal offset_shift_keys,
      @decryption.offset_shift_keys(shift_keys, @decryption.date)
  end
  
  def test_it_can_shift_message
    message = @decryption.message
    char_set = @decryption.character_set
    offset_shift_keys = {A: 3, B: 27, C: 73, D: 20}
    
    assert_equal "hello world",
      @decryption.shift_message(message, char_set, offset_shift_keys)
  end
  
  def test_it_can_return_decryption_details
    expected = {decryption: "hello world", key: "02715", date: "040895"}
    assert_equal expected, @decryption.decryption_details
  end
end