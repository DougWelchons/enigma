require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_it_can_encrypt_with_a_key_and_date
    enigma = Enigma.new
    encrypt = enigma.encrypt('hello world', '02715', '040895')
    expected = {
                  encryption: 'keder ohulw',
                  key: '02715',
                  date: '040895'
               }

    assert_equal expected, encrypt
  end

  def test_it_can_decrypt_with_a_key_and_date
    enigma = Enigma.new
    enigma.decrypt('keder ohulw', '02715', '040895')

    expected = {
                  decryption: 'hello world',
                  key: '02715',
                  date: '040895'
               }

    decrypt = enigma.decrypt('keder ohulw', '02715', '040895')

    assert_equal expected, decrypt
  end

  def test_it_can_encrypt_with_only_a_key
    skip
    enigma = Enigma.new
    expected = {
                  encryption: 'keder ohulw',
                  key: '02715',
                  date: Time.now.strftime('%d%m%Y')
               }

    assert_equal expected, enigma.encrypt('hello world', '02715')
  end

  def test_it_can_decrypt_with_only_a_key
    enigma = Enigma.new
    encrypted = enigma.encrypt('hello world', '02715')
    expected = {
                  decryption: 'hello world',
                  key: '02715',
                  date: Time.now.strftime('%d%m%Y')
               }

    assert_equal expected, enigma.decrypt(encrypted[:encryption], '02715')
  end

  def test_it_can_encrypt_without_a_key
    skip
    enigma = Enigma.new
    expected = {
                  encryption: 'keder ohulw',
                  key: '02715',
                  date: Time.now.strftime('%d%m%Y')
               }

    assert_equal expected, enigma.encrypt('hello world')
  end
end
