require './lib/enigma'
enigma = Enigma.new

message_txt = File.open(ARGV[0], "r")
message = message_txt.read
message_txt.close

encrypted_info = enigma.encrypt(message, "02715", "040895")
cipher_text = encrypted_info[:encryption]
cipher_key = encrypted_info[:key]
cipher_date = encrypted_info[:date]

encrypted_txt = File.open(ARGV[1], "w")
encrypted_txt.write(cipher_text)
encrypted_txt.close

puts "Created '#{ARGV[1]}' with the key #{cipher_key} and date #{cipher_date}"