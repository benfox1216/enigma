require './lib/manipulatable'

class Encryption
  include Manipulatable
  attr_reader :char_set, :message, :key, :date
  
  def initialize(message, key = nil, date = nil)
    @message = message.downcase
    @random_key = rand(99999).to_s.rjust(5, '0')
    @key = (@random_key if key == nil) || key
    @date = (Time.now.strftime("%d%m%y") if date == nil) || date
  end
  
  def encryption_details
    details = {}
    details[:encryption] = get_encryption
    details[:key] = @key
    details[:date] = @date
    
    details
  end
  
  private
  
  def get_encryption
    shift_keys = create_shift_keys(@key)
    offset_shift_keys = offset_shift_keys(shift_keys, @date)
    shift_message(@message, offset_shift_keys)
  end
end