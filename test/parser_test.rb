require 'minitest/autorun'
require './lib/parser'

class ParserTest < Minitest::Test
  def test_it_exists
    assert Parser
  end

  # def test_it_takes_a_filename
  #   assert Parser.get_names("../testdata/kid.csv")
  # end


end
