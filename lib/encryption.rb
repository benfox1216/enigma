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
    create_shift_keys(@key)
    shift_message(@message)
    
    {encryption: "keder ohulw", key: @key, date: "040895"}
  end
end