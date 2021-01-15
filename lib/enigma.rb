#this is the interface between the runner files and the encryption/decryption proccess

require './lib/cipher_engine'

class Enigma

  def initialize
    @base = ('a'..'z').to_a << ' '
    @engine = CipherEngine.new
  end

  def encrypt(message, key = @engine.key_gen, date = Time.now.strftime('%d%m%Y'))
    key_set = @engine.encryption_keys(key, date).rotate(3)
    encryption = split(message).map do |character|
      key_set = key_set.rotate
      @base[((@base.index(character) + key_set.first) % 27)]
    end
    encrypt_return_message(encryption.join, key, date)
  end

  def decrypt(message, key = @engine.key_gen, date = Time.now.strftime('%d%m%Y'))
    key_set = @engine.encryption_keys(key, date).rotate(3)
    encryption = split(message).map do |character|
      key_set = key_set.rotate
      @base[((@base.index(character) - key_set.first) % 27)]
    end
    decrypt_return_message(encryption.join, key, date)
  end

  def encrypt_return_message(message, key, date)
    {
      encryption: message,
      key: key,
      date: date
    }
  end

  def decrypt_return_message(message, key, date)
    {
      decryption: message,
      key: key,
      date: date
    }
  end

  def split(message)
    message.split('')
  end
end
