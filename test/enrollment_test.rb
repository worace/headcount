require 'minitest/autorun'            # => true
require_relative '../lib/enrollment'  # => true

class EnrollmentTest < Minitest::Test  # => Minitest::Test

  def test_enrollment_exists
    assert Enrollment         # => true

  end  # => :test_enrollment_exists

  def test_name_gets_created_with_data
    enroll = Enrollment.new({name: 'Colorado', kindergarten_participation: {2010 => 0.05, 2011 => 0.1} })  # => #<Enrollment:0x007fe15088eeb8 @name="Colorado", @kindergarten_participation={2010=>0.05, 2011=>0.1}>
    expected = {2010 => 0.05, 2011 => 0.1}                                                                 # => {2010=>0.05, 2011=>0.1}
    assert_equal 'Colorado', enroll.name                                                                   # => true
    assert_equal expected, enroll.kindergarten_participation_by_year                                       # => true
  end                                                                                                      # => :test_name_gets_created_with_data

  def test_participation_in_given_year
    enroll = Enrollment.new({name: 'Colorado', kindergarten_participation: {2010 => 0.05, 2011 => 0.1} })  # => #<Enrollment:0x007fe15088df68 @name="Colorado", @kindergarten_participation={2010=>0.05, 2011=>0.1}>
    assert_equal 0.05, enroll.kindergarten_participation_in_year(2010)                                     # => true
  end                                                                                                      # => :test_participation_in_given_year
end                                                                                                        # => :test_participation_in_given_year

# >> Run options: --seed 18424
# >>
# >> # Running:
# >>
# >> ...
# >>
# >> Finished in 0.001264s, 2373.0215 runs/s, 3164.0287 assertions/s.
# >>
# >> 3 runs, 4 assertions, 0 failures, 0 errors, 0 skips
