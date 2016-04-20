class District
  attr_reader :name
  attr_accessor :enrollment

  def initialize(name)
    @name = name.values.first.upcase
  end
end
