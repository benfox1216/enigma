require_relative 'test_helper'
require './lib/encryption'

class EncryptionTest < Minitest::Test
  def setup
    @encryption = Encryption.new("hello world", "02715", "040895")
    @today = Time.now.strftime("%d%m%y")
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
    assert_equal "keder ohulw", @encryption.get_encryption
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
end