class Encryption
  attr_reader :today, :character_set
  
  def initialize(message, key, date)
    @message = message
    
    @random_key = rand(99999).to_s.rjust(5, '0')
    @key = random_key if key == nil else key
    
    @today = Time.now.strftime("%d%m%y")
    @date = today if date == nil else date
  end
  
  def get_encryption
    
    @date = @today
    require "pry"; binding.pry
    {encryption: "keder ohulw", key: @key, date: "040895"}
  end
end