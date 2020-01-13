require './lib/enigma'
enigma = Enigma.new

message_txt = File.open(ARGV[0], "r")
message = message_txt.read
message_txt.close

puts enigma.encrypt("hello world", "02715", "040895")

capitalize = message.upcase

# writer = File.open(ARGV[1], "w")
# writer.write(capitalize)
# writer.close