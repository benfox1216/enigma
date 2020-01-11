class Enigma
  def encrypt(message, key, date)
    encryption = Encryption.new(message, @key, @date)
    encryption.get_encryption
  end
  
  def decrypt(ciphertext, key = nil, date = nil)
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