require 'minitest/autorun'
require 'minitest/pride'
require './lib/cipher_engine'

class CipherEngineTest < Minitest::Test
  def test_it_exists
    engine = CipherEngine.new

    assert_instance_of CipherEngine, engine
  end

  def test_it_can_generate_a_random_key
    engine = CipherEngine.new
    key_length = engine.key_gen.length

    assert_equal 5, key_length
    assert_instance_of String, engine.key_gen
  end

  def test_it_can_return_an_array_of_keys
    engine = CipherEngine.new

    assert_equal [1, 12, 23, 34], engine.generate_keys('01234')
  end

  def test_it_can_set_an_array_of_offsets
    engine = CipherEngine.new

    assert_equal [4, 4, 4, 1], engine.generate_offsets(15_012_021)
  end

  def test_it_car_return_a_set_of_encryption_keys
    engine = CipherEngine.new

    assert_equal [5, 16, 27, 35], engine.encryption_keys('01234', '15012021')
  end
end
