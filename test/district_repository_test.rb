require 'minitest/autorun'
require './lib/district_repository'

class DistrictRepositoryTest < Minitest::Test
  def test_it_exists
    assert DistrictRepository
  end

  def test_it_loads_data
    skip
    dr = DistrictRepository.new
    dr.load_data(:kindergarten => "./data/Kindergartners in full-day program.csv")

    assert dr.find_by_name("ACADEMY 20")
  end

  def test_find_by_name
    dr = DistrictRepository.new
    d = District.new({:name => 'Colorado'})
    dr.districts << d

    assert_equal d, dr.find_by_name('Colorado')
  end

  def test_does_not_find_name
    dr = DistrictRepository.new

    assert_equal nil, dr.find_by_name('Alabama')
  end

  def test_creates_districts_from_a_name
    dr = DistrictRepository.new
    dr.create_districts(['Colorado'])

    assert_equal 'Colorado', dr.find_by_name('Colorado').name
  end

  def test_creates_districts_from_multiple_names
    dr = DistrictRepository.new
    dr.create_districts(['Colorado', 'Alabama', 'Wisconsin'])

    assert_equal 'Colorado', dr.find_by_name('Colorado').name
    assert_equal 'Alabama', dr.find_by_name('Alabama').name
    assert_equal 'Wisconsin', dr.find_by_name('Wisconsin').name
  end

end
