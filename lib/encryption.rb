require 'manipulatable'

class Encryption
  include Manipulatable
  attr_reader :character_set, :message, :key, :date
  
  def initialize(message, key, date)
    @character_set = ("a".."z").to_a << " "
    @message = message
    
    @random_key = rand(99999).to_s.rjust(5, '0')
    @key = (@random_key if key == nil) || key
    
    @today = Time.now.strftime("%d%m%y")
    @date = (@today if date == nil) || date
  end
  
  def get_encryption
    shift_keys = create_shift_keys(@key)
    offset_shift_keys = offset_shift_keys(shift_keys, @date)
    shift_message(@message, @character_set, offset_shift_keys)
    
    {encryption: "keder ohulw", key: @key, date: "040895"}
  end
end