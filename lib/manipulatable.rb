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
    new_shift_keys = {}
  
    new_shift_keys[:A] = shift_keys[0] + offset_keys[0].to_i
    new_shift_keys[:B] = shift_keys[1] + offset_keys[1].to_i
    new_shift_keys[:C] = shift_keys[2] + offset_keys[2].to_i
    new_shift_keys[:D] = shift_keys[3] + offset_keys[3].to_i
    
    new_shift_keys
  end
  
  def shift_message(message, character_set, offset_shift_keys)
    indexed_characters = {}
    split_message = message.split(//)
    decrypted_message = []
    
    character_set.each.with_index do |character, index|
      indexed_characters[character] = index
    end
    
    iterate = 0
    
    split_message.each do |character|
      shift_key = offset_shift_keys.keys[iterate]
      
      character_index = indexed_characters[character]
      rotated_characters = character_set.rotate(-offset_shift_keys[shift_key])
      decrypted_message << rotated_characters[character_index]
      
      iterate += 1
      
      if iterate > 3
        iterate = 0
      end
    end
    
    decrypted_message.join
  end
end