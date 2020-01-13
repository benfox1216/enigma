require './lib/enigma'
enigma = Enigma.new

cipher_txt = File.open(ARGV[0], "r")
cipher = cipher_txt.read
cipher_txt.close

decrypted_info = enigma.decrypt(cipher, "02715", "040895")
cipher_text = decrypted_info[:decryption]
cipher_key = decrypted_info[:key]
cipher_date = decrypted_info[:date]

decrypted_txt = File.open(ARGV[1], "w")
decrypted_txt.write(cipher_text)
decrypted_txt.close

puts "Created '#{ARGV[1]}' with the key #{ARGV[2]} and date #{ARGV[3]}"