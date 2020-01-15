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
  
  def shift_message(message, offset_shift_keys)
    iteration = -1
    
    shifted_message = message.split(//).map do |char|
      iteration = iterate(iteration)
      add_char(offset_shift_keys, iteration, char)
    end
    
    shifted_message.join
  end
  
  def add_char(offset_shift_keys, iteration, char)
    char_set = ("a".."z").to_a << " "
    
    if char_set.include?(char) == true
      return validate_chars(char_set, offset_shift_keys, iteration, char)
    else
      return char
    end
  end
  
  def validate_chars(char_set, offset_shift_keys, iteration, char)
    char_index = create_char_index(char_set)
    shift_key = offset_shift_keys.keys[iteration]
    
    if self.class.to_s == "Encryption"
      rotated_characters = char_set.rotate(offset_shift_keys[shift_key])
    else
      rotated_characters =
      char_set.rotate(-offset_shift_keys[shift_key])
    end
    
    rotated_characters[char_index[char]]
  end
  
  def create_char_index(char_set)
    char_index = {}
    
    char_set.each.with_index do |char, index|
      char_index[char] = index
    end
    
    char_index
  end
  
  def iterate(iteration)
    iterate = iteration
    iterate += 1
    
    if iterate > 3
      iterate = 0
    end
    
    iterate
  end
end