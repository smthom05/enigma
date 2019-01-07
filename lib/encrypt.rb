require './test/test_helper'

enigma = Enigma.new

handle = File.open(ARGV[0], "r")

incoming_message = handle.read

handle.close

encrypted_word = enigma.encrypt(incoming_message.chomp)

writer = File.open(ARGV[1], "w")

writer.write(encrypted_word[:encryption])

writer.close

puts "Created '#{ARGV[1]}' with key #{encrypted_word[:key]} and date #{encrypted_word[:date]}"
