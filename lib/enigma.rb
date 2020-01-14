require './lib/encryption'
require './lib/decryption'

class Enigma
  def encrypt(message, key = nil, date = nil)
    encryption = Encryption.new(message, key, date)
    encryption.encryption_details
  end
  
  def decrypt(ciphertext, key = nil, date = nil)
    decryption = Decryption.new(ciphertext, key, date)
    decryption.decryption_details
  end
  
  def crack(ciphertext, date = nil)
    decryption_crack = Decryption.new(ciphertext, date)
    decryption_crack.crack
  end
end