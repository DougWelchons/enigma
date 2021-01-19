require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_it_can_generate_a_random_key
    enigma = Enigma.new

    assert_equal 5, enigma.key_gen.length
    assert_instance_of String, enigma.key_gen
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
    enigma = Enigma.new
    Time.stubs(:now).returns(Time.mktime(95, 8, 4))
    expected = {
                  encryption: 'keder ohulw',
                  key: '02715',
                  date: '040895'
               }

    assert_equal expected, enigma.encrypt('hello world', '02715')
  end

  def test_it_can_decrypt_with_only_a_key
    enigma = Enigma.new
    encrypted = enigma.encrypt('hello world', '02715')
    expected = {
                  decryption: 'hello world',
                  key: '02715',
                  date: Time.now.strftime('%d%m%y')
               }

    assert_equal expected, enigma.decrypt(encrypted[:encryption], '02715')
  end

  def test_it_can_encrypt_without_a_key
    enigma = Enigma.new
    enigma.stubs(:key_gen).returns('02715')
    Time.stubs(:now).returns(Time.mktime(95, 8, 4))
    expected = {
                  encryption: 'keder ohulw',
                  key: '02715',
                  date: '040895'
               }

    assert_equal expected, enigma.encrypt('hello world')
  end

  def test_it_can_crack_an_encryption_with_a_date
    enigma = Enigma.new
    expected = {
                  decryption: 'hello world end',
                  key: [19, -14, -5, -5],
                  date: '291018'
                }

    assert_equal expected, enigma.crack('vjqtbeaweqihssi', '291018')
  end

  def test_it_can_crack_an_encryption_without_a_date
    enigma = Enigma.new
    Time.stubs(:now).returns(Time.mktime(95, 8, 4))
    expected = {
                  decryption: 'hello world end',
                  key: [19, -14, -5, -5],
                  date: '291018'
                }

    assert_equal expected, enigma.crack('vjqtbeaweqihssi', '291018')
  end

  def test_it_can_parse_encryption_data
    enigma = Enigma.new
    enigma.stubs(:encrypt).with('hello worls', '12345', '010121').returns('option1')
    enigma.stubs(:encrypt).with('hello worls', '12345').returns('option2')
    enigma.stubs(:encrypt).with('hello worls').returns('option3')

    assert_equal 'option1', enigma.parse_data_encrypt('hello worls', ['12345', '010121'])
    assert_equal 'option2', enigma.parse_data_encrypt('hello worls', ['12345'])
    assert_equal 'option3', enigma.parse_data_encrypt('hello worls', [])
  end

  def test_it_can_parse_decryption_data
    enigma = Enigma.new
    enigma.stubs(:decrypt).with('keder ohulw', '12345', '010121').returns('option1')
    enigma.stubs(:decrypt).with('keder ohulw', '12345').returns('option2')
    enigma.stubs(:decrypt).with('keder ohulw').returns('option3')

    assert_equal 'option1', enigma.parse_data_decrypt('keder ohulw', ['12345', '010121'])
    assert_equal 'option2', enigma.parse_data_decrypt('keder ohulw', ['12345'])
    assert_equal 'option3', enigma.parse_data_decrypt('keder ohulw', [])
  end

  def test_it_can_parse_code_break_data
    enigma = Enigma.new
    enigma.stubs(:crack).with('keder ohulw', '010121').returns('option1')
    enigma.stubs(:crack).with('keder ohulw').returns('option2')

    assert_equal 'option1', enigma.parse_data_crack('keder ohulw', ['010121'])
    assert_equal 'option2', enigma.parse_data_crack('keder ohulw', [])
  end
end
