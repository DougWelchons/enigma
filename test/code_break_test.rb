require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/code_break'

class CodeBreakTest < Minitest::Test
  def test_it_exists
    code_break = CodeBreak.new
    assert_instance_of CodeBreak, code_break
  end

  # def test_it_can_compile_a_key
  #   code_break = CodeBreak.new
  #
  #   assert_equal '01234', code_break.compile_key([1, 12, 23, 34])
  # end

  def test_it_can_find_a_key_set
    code_break = CodeBreak.new

    assert_equal [-26, 2, 3, 4], code_break.find_key_set('ghdqagqh')
  end

  def test_it_can_return_the_decryption_message
    enigma = CodeBreak.new
    actual = enigma.decrypt_return_message('hello world end', '291018', [19, -14, -5, -5])
    expected = {
                  decryption: 'hello world end',
                  key: [19, -14, -5, -5],
                  date: '291018'
                }

    assert_equal expected, actual
  end

  def test_it_can_crack_an_encryption
    enigma = CodeBreak.new
    expected = {
                  decryption: 'hello world end',
                  key: [19, -14, -5, -5],
                  date: '291018'
                }

    assert_equal expected, enigma.crack('vjqtbeaweqihssi', '291018')
  end
end
