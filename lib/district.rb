class District
  attr_reader :name
  def initialize(name)
    @name = name.values.first
  end

  def enrollment
    EnrollmentRepo.find_by_name(name)
  end

end
