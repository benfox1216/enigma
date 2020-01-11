module Manipulatable
  def create_shift_keys(key)
    shift_keys = []
  
    #shift_keys.split
    
    shift_keys << key[0] + key[1]
    shift_keys << key[1] + key[2]
    shift_keys << key[2] + key[3]
    shift_keys << key[3] + key[4]
    
    shift_keys
  end
  
  def offset_shift_keys(shift_keys)
    ["03", "30", "69", "18"]
  end
  
  def shift_message(message)
    "keder ohulw"
  end
end