require './lib/cipher_engine'

class Encipher < CipherEngine

  def initialize
    @base = ('a'..'z').to_a << ' '
  end

  def cipher(message, key, date)
    key_set = encryption_keys(key, date).rotate(3)
    enciphered_message = run_cipher(message, key_set)
    encrypt_return_message(enciphered_message, key, date)
  end

  def encrypt_return_message(message, key, date)
    {
      encryption: message,
      key: key,
      date: date
    }
  end
end
