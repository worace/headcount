require 'csv'
require 'pry'
require './lib/parser'
class EnrollmentRepo
  attr_reader :enrollments

  def initialize
    @enrollments = []
    @name = {}
  end

  def load_data(data)
    # puts data[:enrollment][:kindergarten]
  #  puts data[:enrollment][:high_school_graduation]
    loaded_data = []
    # binding.pry
    # puts data[:enrollment].to_a.inspect
    data[:enrollment].each do |filename|
      # puts filename
      # binding.pry
      loaded_data += Parser.parse(filename)
    end
    # loaded_data = Parser.parse(data[:enrollment][:kindergarten])
    # loaded_data += Parser.parse(data[:enrollment][:high_school_graduation])
    # binding.pry
    loaded_data.each do |name|
      @enrollments << Enrollment.new(name)
    end
  end

  def find_by_name(name)
      @enrollments.find{|enrollment| enrollment.name == name.upcase}
  end

  def add_enrollments(enrollments)
    @enrollments += enrollments
  end
end
