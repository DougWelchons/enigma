require './lib/enigma'

enigma = Enigma.new

message_info = enigma.encryption(ARGV)

puts "Created '#{ARGV[1]}' with the key #{message_info[:key]} and date #{message_info[:date]}"
puts "REMOVE BEFORE FINAL!!!!! #{message_info[:encryption]}"
