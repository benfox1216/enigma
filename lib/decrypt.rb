require './lib/enigma'
require 'pry'

enigma = Enigma.new

cipher_txt = File.open(ARGV[0], "r")
cipher = cipher_txt.read
cipher_txt.close

decrypted_info = enigma.decrypt(cipher, ARGV[2], ARGV[3])
cipher_text = decrypted_info[:decryption]
cipher_key = decrypted_info[:key]
cipher_date = decrypted_info[:date]

decrypted_txt = File.open(ARGV[1], "w")
decrypted_txt.write(cipher_text)
decrypted_txt.close

key = (cipher_key if ARGV[2] == nil) || ARGV[2]
date = (cipher_date if ARGV[3] == nil) || ARGV[3]

puts "Created '#{ARGV[1]}' with the key #{key} and date #{date}"