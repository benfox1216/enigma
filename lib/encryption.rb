class Encryption
  attr_reader :today, :character_set
  
  def initialize(message, key, date)
    @character_set = ("a".."z").to_a << " "
    @today = "date"
  end
  
  def generate_key
    
  end
end