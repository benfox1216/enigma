require './lib/enigma'
enigma = Enigma.new


# CREATES NEW READ/WRITE FILE
encrypted = File.open("encrypted.txt", "w+")

new_file.write("all the text you want")

ARGV == ["message.txt", "encrypted.txt"]
ARGV[0] == "message.txt"
ARGV[1] == "encrypted.txt"
