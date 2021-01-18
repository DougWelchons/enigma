require './lib/encipher'
require './lib/decipher'

class Enigma

  def key_gen
    rand(100_000).to_s.rjust(5, '0')
  end

  def parse_data_encrypt(message, key_and_date)
    if key_and_date.count == 2
      encrypt(message, key_and_date[0], key_and_date[1])
    elsif key_and_date.count == 1
      encrypt(message, key_and_date[0])
    else
      encrypt(message)
    end
  end

  def parse_data_decrypt(message, key_and_date)
    if key_and_date.count == 2
      decrypt(message, key_and_date[0], key_and_date[1])
    elsif key_and_date.count == 1
      decrypt(message, key_and_date[0])
    else
      decrypt(message)
    end
  end

  def encrypt(message, key = key_gen, date = Time.now.strftime('%d%m%y'))
    encipher = Encipher.new
    encipher.cipher(message, key, date)
  end

  def decrypt(message, key = key_gen, date = Time.now.strftime('%d%m%y'))
    decipher = Decipher.new
    decipher.cipher(message, key, date)
  end
end
