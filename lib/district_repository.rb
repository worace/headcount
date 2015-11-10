require './lib/district'
class DistrictRepository
  attr_reader :districts
  def initialize
    # @enrollment_repo = EnrollmentRepo.new
    @districts = []
  end

  def load_data(parser_and_filename)
    create_districts(Parser.get_names(parser_and_filename))
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
