require_relative 'test_helper'
require './lib/decryption'

class DecryptionTest < Minitest::Test
  def setup
    @decryption = Decryption.new("keder ohulw", "02715", "040895")
    @today = Time.now.strftime("%d%m%y")
    @char_set = ("a".."z").to_a << " "
    @offset_shift_keys = {A: 3, B: 27, C: 73, D: 20}
    @char_index = {
      "a"=>0, "b"=>1, "c"=>2, "d"=>3, "e"=>4, "f"=>5, "g"=>6, "h"=>7,
      "i"=>8, "j"=>9, "k"=>10, "l"=>11, "m"=>12, "n"=>13, "o"=>14, "p"=>15,
      "q"=>16, "r"=>17, "s"=>18, "t"=>19, "u"=>20, "v"=>21, "w"=>22, "x"=>23,
      "y"=>24, "z"=>25, " "=>26
    }
  end
  
  def test_it_exists
    assert_instance_of Decryption, @decryption
  end
  
  def test_it_has_attributes
    character_set = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    
    assert_equal character_set, @decryption.character_set
    assert_equal "keder ohulw", @decryption.ciphertext
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
  
  def test_it_can_shift_ciphertext
    ciphertext = @decryption.ciphertext
    char_set = @decryption.character_set
    offset_shift_keys = {A: 3, B: 27, C: 73, D: 20}
    
    assert_equal "hello world",
      @decryption.shift_message(ciphertext, char_set, offset_shift_keys)
  end
  
  def test_it_can_return_decryption_details
    expected = {decryption: "hello world", key: "02715", date: "040895"}
    assert_equal expected, @decryption.decryption_details
  end
  
  def test_it_can_decrypt_messages_with_uppercase_letters
    decryption_w_upcase = Decryption.new("Keder Ohulw", "02715", "040895")
    expected = {decryption: "hello world", key: "02715", date: "040895"}
    
    assert_equal expected, decryption_w_upcase.decryption_details
  end
  
  def test_it_can_decrypt_messages_with_special_characters
    decryption_w_sp_char = Decryption.new("keder ohulw!", "02715", "040895")
    expected = {decryption: "hello world!", key: "02715", date: "040895"}
    
    assert_equal expected, decryption_w_sp_char.decryption_details
  end

  def test_it_decrypt_using_todays_date
    decryption_w_todays_date = Decryption.new("keder ohulw", "02715")
    decrypted = decryption_w_todays_date.decryption_details
    decrypted_message = decrypted[:decryption]
    expected = {decryption: decrypted_message, key: "02715", date: @today}
    
    assert_equal expected, decryption_w_todays_date.decryption_details
  end
  
  def test_it_can_return_valid_characters
    assert_equal "h", @decryption.valid_chars(@char_set, @offset_shift_keys, 0, @char_index, "k")
  end
  
  def test_it_can_create_character_index
    assert_equal @char_index, @decryption.create_char_index(@char_set)
  end
  
  def test_it_can_iterate
    iteration = 0
    
    assert_equal 1, @decryption.iterate(iteration)
  end
  
  def test_it_can_create_add_char_to_shifted_message
    assert_equal "h", @decryption.add_char(@char_set, @offset_shift_keys, 0, @char_index, "k")
  end
end