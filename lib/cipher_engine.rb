class CipherEngine

  def encryption_keys(key, date)
    keys = generate_keys(key)
    offsets = generate_offsets(date.to_i)
    total_offsets = []
    keys.zip(offsets) do |each|
      total_offsets << each.sum
    end
    total_offsets
  end

  def generate_keys(key)
    holder = []
    key.split('').each_cons(2) do |num1, num2|
      holder << (num1 + num2).to_i
    end
    holder
  end

  def generate_offsets(date)
    (date * date).digits[0..3].reverse
  end

  def run_cipher(message, key_set)
    split(message).map do |character|
      key_set = key_set.rotate
      if @base.include?(character)
        @base[((@base.index(character) + key_set.first) % 27)]
      end
    end.join
  end

  def split(message)
    message.split('')
  end
end
