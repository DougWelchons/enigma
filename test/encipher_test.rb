require 'minitest/autorun'
require 'minitest/pride'
require './lib/encipher'

class EncipherTest < Minitest::Test
  def test_it_exists
    encipher = Encipher.new

    assert_instance_of Encipher, encipher
  end

  def test_it_can_return_enciphered_message_key_and_date
    encipher = Encipher.new

    actual = encipher.encrypt_return_message('keder ohulw', '02715', '040895')
    expected = {
                  encryption: 'keder ohulw',
                  key: '02715',
                  date: '040895'
               }

    assert_equal expected, actual
  end

  def test_it_can_cipher_a_message
    encipher = Encipher.new

    actual = encipher.cipher('hello world', '02715', '040895')
    expected = {
                  encryption: 'keder ohulw',
                  key: '02715',
                  date: '040895'
               }

    assert_equal expected, actual
  end

  def test_it_can_run_cipher
    encipher = Encipher.new

    actual = encipher.run_cipher('hello world', [5, 16, 27, 35])
    expected = 'xetqd dtgll'

    assert_equal expected, actual
  end
end
