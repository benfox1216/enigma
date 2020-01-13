require_relative 'test_helper'
require './lib/encryption'

class EncryptionTest < Minitest::Test
  def setup
    @encryption = Encryption.new("hello world", "02715", "040895")
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
    assert_instance_of Encryption, @encryption
  end
  
  def test_it_has_attributes
    assert_equal @char_set, @encryption.character_set
    assert_equal "hello world", @encryption.message
    assert_equal "02715", @encryption.key
    assert_equal "040895", @encryption.date
  end
  
  def test_it_can_get_encryption
    assert_equal "keder ohulw", @encryption.get_encryption
  end
  
  def test_it_can_create_shift_keys
    shift_keys = [02, 27, 71, 15]
    assert_equal shift_keys, @encryption.create_shift_keys(@encryption.key)
  end
  
  def test_it_can_offset_shift_keys
    shift_keys = @encryption.create_shift_keys(@encryption.key)
    
    assert_equal @offset_shift_keys,
      @encryption.offset_shift_keys(shift_keys, @encryption.date)
  end
  
  def test_it_can_shift_message
    message = @encryption.message
    char_set = @encryption.character_set
    offset_shift_keys = {A: 3, B: 27, C: 73, D: 20}
    
    assert_equal "keder ohulw",
      @encryption.shift_message(message, char_set, offset_shift_keys)
  end
  
  def test_it_can_return_encryption_details
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}
    assert_equal expected, @encryption.encryption_details
  end
  
  def test_it_can_encrypt_messages_with_uppercase_letters
    encryption_w_upcase = Encryption.new("Hello World", "02715", "040895")
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}
    
    assert_equal expected, encryption_w_upcase.encryption_details
  end
  
  def test_it_can_encrypt_messages_with_special_characters
    encryption_w_sp_char = Encryption.new("hello world!", "02715", "040895")
    expected = {encryption: "keder ohulw!", key: "02715", date: "040895"}
    
    assert_equal expected, encryption_w_sp_char.encryption_details
  end

  def test_it_encrypt_using_todays_date
    encryption_w_todays_date = Encryption.new("hello world", "02715")
    encrypted = encryption_w_todays_date.encryption_details
    encrypted_message = encrypted[:encryption]
    expected = {encryption: encrypted_message, key: "02715", date: @today}
    
    assert_equal expected, encryption_w_todays_date.encryption_details
  end
  
  def test_it_can_encrypt_using_only_message
    encryption_w_msg_only = Encryption.new("hello world")
    encrypted = encryption_w_msg_only.encryption_details
    encrypted_message = encrypted[:encryption]
    encrypted_key = encrypted[:key]
    expected = {encryption: encrypted_message, key: encrypted_key, date: @today}
    
    assert_equal expected, encrypted
  end
  
  def test_it_can_return_valid_characters
    assert_equal "k", @encryption.valid_chars(@char_set, @offset_shift_keys, 0,
      @char_index, "h")
  end
  
  def test_it_can_create_character_index
    assert_equal @char_index, @encryption.create_char_index(@char_set)
  end
  
  def test_it_can_iterate
    iteration = 0
    
    assert_equal 1, @encryption.iterate(iteration)
  end
  
  def test_it_can_create_add_char_to_shifted_message
    assert_equal "k", @encryption.add_char(@char_set, @offset_shift_keys, 0,
      @char_index, "h")
  end
end