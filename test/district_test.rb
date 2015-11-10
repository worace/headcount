require 'minitest/autorun'
require './lib/district'

class DistrictTest < Minitest::Test
  def test_it_exists
    assert District
  end

  def test_it_takes_a_name
    d = District.new({:name => 'Colorado'})

    assert_equal 'Colorado', d.name
  end

  def test_it_takes_another_name
    d = District.new({:name => 'Alabama'})

    assert_equal 'Alabama', d.name
  end

  

end
