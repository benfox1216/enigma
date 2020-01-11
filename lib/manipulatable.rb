module Manipulatable
  def shift_keys(key)
    shift_keys = []
    
    shift_keys << key[0] + key[1]
    shift_keys << key[1] + key[2]
    shift_keys << key[2] + key[3]
    shift_keys << key[3] + key[4]
    
    shift_keys
  end
  
  def shift_message(message)
    require "pry"; binding.pry
  end
  
  def rotate(character_set)
    "array"
  end
  
  def with_index
    "enumerator"
  end
end