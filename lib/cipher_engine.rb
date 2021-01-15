# this is the class used for prossesing the keys and dates into usable key_sets

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

  def key_gen
    rand(100_000).to_s.rjust(5, '0')
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
end
