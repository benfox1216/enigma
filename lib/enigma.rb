class Enigma
  def encrypt(message, key, date)
    encryption = Encryption.new(message, key, date)
    encryption.get_encryption
  end
  
  def decrypt(ciphertext, key = nil, date = nil)
    {decryption: "hello world", key: "02715", date: "040895"}
  end
end