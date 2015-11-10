require 'minitest/autorun'                 # => true
require_relative '../lib/enrollment_repo'  # => true

class EnrollmentRepoTest < Minitest::Test  # => Minitest::Test
  def test_it_exists
    assert EnrollmentRepo                  # => true
  end                                      # => :test_it_exists

  def test_it_loads_data
    er = EnrollmentRepo.new                                    # => #<EnrollmentRepo:0x007fed03a637e8 @enrollments=[], @name={}>
    er.load_data({                                             # => #<EnrollmentRepo:0x007fed03a637e8 @enrollments=[], @name={}>
      :enrollment => {
        :kindergarten => "./test/data/kid.csv"                 # => "./test/data/kid.csv"
      }                                                        # => {:kindergarten=>"./test/data/kid.csv"}
    })
    # er.find_by_name
    assert_equal "Colorado", er.find_by_name("Colorado").name
  end                                                          # => :test_it_loads_data
end                                                            # => :test_it_loads_data

# >> Run options: --seed 28313
# >>
# >> # Running:
# >>
# >> .E
# >>
# >> Finished in 0.001168s, 1712.8948 runs/s, 856.4474 assertions/s.
# >>
# >>   1) Error:
# >> EnrollmentRepoTest#test_it_loads_data:
# >> Errno::ENOENT: No such file or directory @ rb_sysopen - ./test/data/kid.csv
# >>     /Users/taylormoore/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/csv.rb:1256:in `initialize'
# >>     /Users/taylormoore/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/csv.rb:1256:in `open'
# >>     /Users/taylormoore/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/csv.rb:1256:in `open'
# >>     /Users/taylormoore/turing/1module/headcount/lib/enrollment_repo.rb:11:in `load_data'
# >>     /Users/taylormoore/turing/1module/headcount/test/enrollment_repo_test.rb:11:in `test_it_loads_data'
# >>
# >> 2 runs, 1 assertions, 0 failures, 1 errors, 0 skips
