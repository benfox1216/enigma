require_relative 'test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
    @today = Time.now.strftime("%d%m%y")
  end
  
  def test_it_exists
    assert_instance_of Enigma, @enigma
  end
  
  def test_it_can_encrypt
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end
  
  def test_it_can_decrypt
    expected = {decryption: "hello world", key: "02715", date: "040895"}
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end
  
  def test_it_can_encrypt_messages_with_uppercase_letters
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}
    assert_equal expected, @enigma.encrypt("Hello World", "02715", "040895")
  end
  
  def test_it_can_decrypt_messages_with_uppercase_letters
    expected = {decryption: "hello world", key: "02715", date: "040895"}
    assert_equal expected, @enigma.decrypt("Keder Ohulw", "02715", "040895")
  end
  
  def test_it_can_encrypt_messages_with_special_characters
    expected = {encryption: "keder ohulw!", key: "02715", date: "040895"}
    assert_equal expected, @enigma.encrypt("hello world!", "02715", "040895")
  end

  def test_it_can_decrypt_messages_with_special_letters
    expected = {decryption: "hello world!", key: "02715", date: "040895"}
    assert_equal expected, @enigma.decrypt("Keder Ohulw!", "02715", "040895")
  end
  
  def test_it_encrypt_using_todays_date
    expected = {encryption: "nib udmcxpu", key: "02715", date: @today}
    assert_equal expected, @enigma.encrypt("hello world", "02715")
  end
  
  def test_it_decrypt_using_todays_date
    encrypted = @enigma.encrypt("hello world", "02715")
    encrypted_message = encrypted[:encryption]
    expected = {decryption: "hello world", key: "02715", date: @today}
    
    assert_equal expected, @enigma.decrypt(encrypted_message, "02715")
  end
  
  def test_it_can_encrypt_using_only_message
    encrypted = @enigma.encrypt("hello_world")
    encrypted_message = encrypted[:encryption]
    encrypted_key = encrypted[:key]
    expected = {encryption: encrypted_message, key: encrypted_key, date: @today}
    
    assert_equal expected, encrypted
  end
end