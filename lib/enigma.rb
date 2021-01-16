#this is the interface between the runner files and the encryption/decryption proccess

require './lib/cipher_engine'

class Enigma

  def initialize
    @base = ('a'..'z').to_a << ' '
    @engine = CipherEngine.new
  end

  def encryption(argv)
    message = IO.read(argv[0]).delete("\n")
    writer_file = argv[1]
    key = if argv[2].nil?
      @engine.key_gen
    else
      argv[2]
    end
    date = if argv[3].nil?
      Time.now.strftime('%d%m%Y')
    else
      argv[3]
    end
    encrypt(message, writer_file, key, date)
  end

  def decryption(argv)
    message = IO.read(argv[0]).delete("\n")
    writer_file = argv[1]
    key = if argv[2].nil?
      @engine.key_gen
    else
      argv[2]
    end
    date = if argv[3].nil?
      Time.now.strftime('%d%m%Y')
    else
      argv[3]
    end
    decrypt(message, writer_file, key, date)
  end

  def encrypt(message, writer_file, key, date)
    key_set = @engine.encryption_keys(key, date).rotate(3)
    encryption_array = split(message).map do |character|
      key_set = key_set.rotate
      @base[((@base.index(character) + key_set.first) % 27)]
    end
    File.write(writer_file, encryption_array.join)
    encrypt_return_message(encryption_array.join, key, date)
  end

  def decrypt(message, writer_file, key, date)
    key_set = @engine.encryption_keys(key, date).rotate(3)
    decryption_array = split(message).map do |character|
      key_set = key_set.rotate
      @base[((@base.index(character) - key_set.first) % 27)]
    end
    File.write(writer_file, decryption_array.join)
    decrypt_return_message(decryption_array.join, key, date)
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
