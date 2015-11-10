class District
  attr_reader :name
  def initialize(name)
    @name = name.values.first.upcase
  end

  def enrollment
    EnrollmentRepo.find_by_name(name)
  end

end
