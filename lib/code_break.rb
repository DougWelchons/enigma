require './lib/cipher_engine'

class CodeBreak < CipherEngine

  def initialize
    @base = ('a'..'z').to_a << ' '
  end

  def crack(message, date)
    key_set = key_set = find_key_set(message).map do |key|
      -key
    end.rotate(3)
    deciphered_message = run_cipher(message, key_set)
    decrypt_return_message(deciphered_message, date, key_set)
  end

  # def find_key(key_set, date)
  #   modified_key_set = []
  #   offsets = generate_offsets(date.to_i)
  #   modified_key_set << ((key_set[0] - offsets[0]) % 27)
  #   modified_key_set << ((key_set[1] - offsets[1]) % 27)
  #   modified_key_set << ((key_set[2] - offsets[2]) % 27)
  #   modified_key_set << ((key_set[3] - offsets[3]) % 27)
  #   compile_key(modified_key_set)
  # end
  #
  # def compile_key(key_set)
  #   key = ""
  #   key = key + key_set[0].to_s
  #   key = key + key_set[1].to_s[-1]
  #   key = key + key_set[2].to_s[-1]
  #   key = key + key_set[3].to_s[-1]
  #   key.rjust(5, '0')
  # end

  def decrypt_return_message(message, date, key_set)
    {
      decryption: message,
      key: key_set,
      date: date
    }
  end

  def find_key_set(message)
    key_set = []
    message_end = split(message)[-4..-1]
    key_set << (@base.index(message_end[0]) - 26)
    key_set << (@base.index(message_end[1]) - 4)
    key_set << (@base.index(message_end[2]) - 13)
    key_set << (@base.index(message_end[3]) - 3)
    key_set.rotate(-((split(message).count) % 27))
  end
end
