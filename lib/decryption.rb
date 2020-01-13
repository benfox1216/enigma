require './lib/manipulatable'

class Decryption
  include Manipulatable
  attr_reader :char_set, :ciphertext, :key, :date
  
  def initialize(ciphertext, key = nil, date = nil)
    @ciphertext = ciphertext.downcase
    @key = key
    @date = (Time.now.strftime("%d%m%y") if date == nil) || date
  end
  
  def get_decryption
    shift_keys = create_shift_keys(@key)
    offset_shift_keys = offset_shift_keys(shift_keys, @date)
    shift_message(@ciphertext, offset_shift_keys)
  end
  
  def decryption_details
    details = {}
    details[:decryption] = get_decryption
    details[:key] = @key
    details[:date] = @date
    
    details
  end
end