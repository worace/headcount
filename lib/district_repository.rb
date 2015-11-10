require './lib/district'
require './lib/parser'
require 'pry'
class DistrictRepository
  attr_reader :districts
  def initialize
    @enrollment_repo = EnrollmentRepo.new
    @districts = []
  end

  def load_data(data)
    create_districts(Parser.get_names(data[:enrollment][:kindergarten]))
    #tell enroll_repo to load file
  end

  def create_districts(names_array)
    names_array.each do |name|
      districts << District.new({:name => name})
    end
  end

  def find_by_name(name)
    districts.find { |district| district.name == name.upcase}
  end
end
