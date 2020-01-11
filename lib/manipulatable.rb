module Manipulatable
  def create_shift_keys(key)
    shift_keys = []
    
    shift_keys << key[0] + key[1]
    shift_keys << key[1] + key[2]
    shift_keys << key[2] + key[3]
    shift_keys << key[3] + key[4]
    
    shift_keys.map {|key| key.to_i}
  end
  
  def offset_shift_keys(shift_keys, date)
    offset_keys = (date.to_i**2).to_s.split(//).last(4)
    offset_shift_keys = {}
  
    offset_shift_keys[:A] = shift_keys[0] + offset_keys[0].to_i
    offset_shift_keys[:B] = shift_keys[1] + offset_keys[1].to_i
    offset_shift_keys[:C] = shift_keys[2] + offset_keys[2].to_i
    offset_shift_keys[:D] = shift_keys[3] + offset_keys[3].to_i
    
    offset_shift_keys
  end
  
  def shift_message(message, character_set)
    split_message = message.split(//)
    require "pry"; binding.pry
    "keder ohulw"
  end
end