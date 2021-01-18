require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/decipher'

class DecipherTest < Minitest::Test
  def test_it_exists
    decipher = Decipher.new

    assert_instance_of Decipher, decipher
  end

  def test_it_can_return_deciphered_message_key_and_date
    decipher = Decipher.new

    actual = decipher.decrypt_return_message('hello world', '02715', '040895')
    expected = {
                  decryption: 'hello world',
                  key: '02715',
                  date: '040895'
               }

    assert_equal expected, actual
  end

  def test_it_can_cipher_a_message
    decipher = Decipher.new

    actual = decipher.cipher('keder ohulw', '02715', '040895')
    expected = {
                  decryption: 'hello world',
                  key: '02715',
                  date: '040895'
               }

    assert_equal expected, actual
  end

  def test_it_can_run_cipher
    decipher = Decipher.new

    actual = decipher.run_cipher('xetqd dtgll', [-5, -16, -27, -35])
    expected = 'hello world'

    assert_equal expected, actual
  end
end
