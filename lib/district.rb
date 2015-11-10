class District
  attr_reader :name
  def initialize(name)
    @name = name.values.first
  end
  
end
