require 'minitest/autorun'
require_relative '../lib/enrollment'

class EnrollmentTest < Minitest::Test

  def test_enrollment_exists
    assert Enrollment

  end

  def test_name_gets_created_with_data
    enroll = Enrollment.new({name: 'Colorado', kindergarten_participation: {2010 => 0.05, 2011 => 0.1} })
    expected = {2010 => 0.05, 2011 => 0.1}
    assert_equal 'COLORADO', enroll.name
    assert_equal expected, enroll.kindergarten_participation_by_year
  end

  def test_participation_in_given_year
    enroll = Enrollment.new({name: 'Colorado', kindergarten_participation: {2010 => 0.05, 2011 => 0.1} })
    assert_equal 0.05, enroll.kindergarten_participation_in_year(2010)
  end
end
