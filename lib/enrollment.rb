class Enrollment
  attr_reader :name

  def initialize(data)
    @name = data[:name]
    @kindergarten_participation = data[:kindergarten_participation]
  end

  def kindergarten_participation_by_year
    @kindergarten_participation
  end

  def kindergarten_participation_in_year(year)
    @kindergarten_participation[year]
  end

end
