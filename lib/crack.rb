require './lib/enigma'

enigma = Enigma.new

message_info = enigma.parse_data_crack(IO.read(ARGV[0]).downcase, ARGV[2..-1])
File.write(ARGV[1], message_info[:decryption])

puts "Created '#{ARGV[1]}' with the key #{message_info[:key]} and date #{message_info[:date]}"
puts "REMOVE BEFORE FINAL!!!!! #{message_info[:decryption]}"
