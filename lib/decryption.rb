require './lib/manipulatable'

class Decryption
  include Manipulatable
  attr_reader :character_set, :message, :key, :date
  
  def initialize(message, key, date)
    @character_set = ("a".."z").to_a << " "
    @message = message
    @key = key
    
    @today = Time.now.strftime("%d%m%y")
    @date = (@today if date == nil) || date
  end
  
  def get_decryption
    shift_keys = create_shift_keys(@key)
    offset_shift_keys = offset_shift_keys(shift_keys, @date)
    shift_message(@message, @character_set, offset_shift_keys)
  end
  
  def decryption_details
    details = {}
    details[:decryption] = get_decryption
    details[:key] = @key
    details[:date] = @date
    
    details
  end
end