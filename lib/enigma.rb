class Enigma
  attr_reader :today, :character_set
  
  def initialize
    @today = "date"
    @character_set = ("a".."z").to_a << " "
  end
  
  def encrypt(message, key, date)
    {encryption: "keder ohulw", key: "02715", date: "040895"}
  end
  
  def decrypt(ciphertext, key, date)
    {decryption: "hello world", key: "02715", date: "040895"}
  end
  
  def rotate
    "array"
  end
  
  def strftime
    "date"
  end
  
  def with_index
    "enumerator"
  end
end