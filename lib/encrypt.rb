require './lib/enigma'

enigma = Enigma.new
# ConfirmInfo.data_review(ARGV)

message_info = enigma.parse_data_encrypt(IO.read(ARGV[0]).downcase, ARGV[2..-1])
File.write(ARGV[1], message_info[:encryption])

puts "Created '#{ARGV[1]}' with the key #{message_info[:key]} and date #{message_info[:date]}"
puts "REMOVE BEFORE FINAL!!!!! #{message_info[:encryption]}"
