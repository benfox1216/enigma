require_relative 'test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end
  
  def test_it_exists
    assert_instance_of Enigma, @enigma
  end
  
  def test_it_has_a_date
    assert_equal "date", @enigma.today
  end
  
  def test_it_can_encrypt
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}
    
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end
  
  def test_it_can_decrypt
    expected = {decryption: "hello world", key: "02715", date: "040895"}
    
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end
  
  def test_it_has_rotate_method
    assert_equal "array", @enigma.rotate
  end
  
  def test_it_can_generate_date
    assert_equal "date", @enigma.strftime
  end
  
  def test_it_has_with_index_method
    assert_equal "enumerator", @enigma.with_index
  end
end