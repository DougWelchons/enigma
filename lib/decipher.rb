require './lib/cipher_engine'

class Decipher < CipherEngine

  def initialize
    @base = ('a'..'z').to_a << ' '
  end

  def cipher(message, key, date)
    key_set = encryption_keys(key, date).map do |key|
      -key
    end.rotate(3)
    deciphered_message = run_cipher(message, key_set)
    decrypt_return_message(deciphered_message, key, date)
  end

  def decrypt_return_message(message, key, date)
    {
      decryption: message,
      key: key,
      date: date
    }
  end
end
