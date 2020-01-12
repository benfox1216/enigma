require_relative 'test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
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
end