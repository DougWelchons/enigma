require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_it_can_encrypt_with_a_key_and_date
    skip
    enigma = Enigma.new
    encrypt = enigma.encrypt("hello world", "02715", "040895")
    expected = {
                 encryption: "keder ohulw",
                 key: "02715",
                 date: "040895"
               }

    assert_equal expected, encrypt
  end

  def test_it_can_decrypt_with_a_key_and_date
    skip
    enigma = Enigma.new
    enigma.decrypt("keder ohulw", "02715", "040895")

    expected = {
                 decryption: "hello world",
                 key: "02715",
                 date: "040895"
               }

    decrypt = enigma.decrypt("keder ohulw", "02715", "040895")

    assert_equal expected, decrypt
  end

  def test_it_can_encrypt_with_only_a_key
    encrypted = enigma.encrypt("hello world", "02715")

  end
end