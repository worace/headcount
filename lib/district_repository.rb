require './lib/district'
require './lib/parser'
require 'pry'
class DistrictRepository
  attr_reader :districts
  def initialize
    # @enrollment_repo = EnrollmentRepo.new
    @districts = []
  end

  def load_data(info)
    #hash comes in with parser info, symbol and filename
    # info.split
    pars = Parser.new
    create_districts(pars.get_names(info))
    districts
  end

  def hash_parser_info

  end

  def create_districts(names_array)
    names_array.each do |name|
      districts << District.new({:name => name})
    end
  end

  def find_by_name(name)
    districts.find { |district| district.name == name}
  end
end
