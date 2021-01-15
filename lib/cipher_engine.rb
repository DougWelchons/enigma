class CipherEngine
  def encryption_keys(key, date)
    keys = set_keys(key)
    offsets = set_offsets(date.to_i)
    total_offsets = []
    keys.zip(offsets) do |each|
      total_offsets << each.sum
    end
    total_offsets
  end

  def key_gen
    rand(100000).to_s.rjust(5, '0')
  end

  def set_keys(key)
    holder = []
    key.split('').each_cons(2) do |num1, num2|
      holder << (num1 + num2).to_i
    end
    holder
  end

  def set_offsets(date)
    (date * date).digits[0..3].reverse
  end
end
