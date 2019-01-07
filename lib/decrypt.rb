require './test/test_helper'
enigma = Enigma.new

handle = File.open(ARGV[0], 'r')
encrypted_word = handle.read
handle.close

key = ARGV[2]
date = ARGV[3]

decrypted_message = enigma.decrypt(encrypted_word, key, date)
writer = File.open(ARGV[1], 'w')
writer.write(decrypted_message[:decryption])
writer.close

puts "Created '#{ARGV[1]}' with key #{key} and date #{date}"
