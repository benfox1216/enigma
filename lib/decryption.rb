require './lib/manipulatable'

class Decryption
  include Manipulatable
  attr_reader :char_set, :ciphertext, :key, :date
  
  def initialize(ciphertext, key = nil, date = nil)
    @ciphertext = ciphertext.downcase
    @key = key
    @date = (Time.now.strftime("%d%m%y") if date == nil) || date
  end
  
  def decryption_details
    details = {}
    details[:decryption] = get_decryption
    details[:key] = @key
    details[:date] = @date
    
    details
  end
  
  def get_decryption
    shift_keys = create_shift_keys(@key)
    offset_shift_keys = offset_shift_keys(shift_keys, @date)
    shift_message(@ciphertext, offset_shift_keys)
  end
  
  # def crack
  #   char_set = ("a".."z").to_a << " "
  #   char_index = create_char_index(char_set)
  #   offset_keys = (@date.to_i**2).to_s.split(//).last(4)
  #   split_cipher = @ciphertext.split(//)
  #   last_4_of_cipher = split_cipher.last(4)
  #
  #   space_index = char_index[" "]
  #   e_index = char_index["e"]
  #   n_index = char_index["n"]
  #   d_index = char_index["d"]
  #
  #   first_cipher_index = char_index[last_4_of_cipher[0]]
  #   second_cipher_index = char_index[last_4_of_cipher[2]]
  #   third_cipher_index = char_index[last_4_of_cipher[2]]
  #   fourth_cipher_index = char_index[last_4_of_cipher[3]]
  #
  #   keys = {}
  #
  #   keys[:D] = first_cipher_index - space_index
  #   keys[:A] = second_cipher_index - e_index
  #   keys[:B] = third_cipher_index - n_index
  #   keys[:C] = fourth_cipher_index - d_index
  #
  #   keys.each do |key, value|
  #     if value < 0
  #       keys[key] = 27 - value.abs
  #     end
  #   end
  #
  #   # iterate = -1
  #   #
  #   # original_keys = keys.values.map do |value|
  #   #   iterate += 1
  #   #   value - offset_keys[iterate].to_i
  #   # end
  #   require "pry"; binding.pry
  #   shift_message(ciphertext, keys)
  # end
end