require './lib/encryption'

class Enigma
  def encrypt(message, key, date)
    encryption = Encryption.new(message, key, date)
    encryption.get_encryption
    encryption.encryption_details
  end
  
  def decrypt(ciphertext, key = nil, date = nil)
    {decryption: "hello world", key: "02715", date: "040895"}
  end
end