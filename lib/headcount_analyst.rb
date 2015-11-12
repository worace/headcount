class HeadcountAnalyst
  attr_reader :district_repository

  def initialize(dr)
    @district_repository = dr
  end

  def kindergarten_participation_rate_variation(d1_name, options)
    d2_name = options[:against]
    dist_1 = district_repository.find_by_name(d1_name)
    dist_2 = district_repository.find_by_name(d2_name)

    # rates_1 = dist_1.enrollment.kindergarten_participation_by_year
    # rates_2 = dist_2.enrollment.kindergarten_participation_by_year

    kindergarten_participation_rate_variation_of_enrollments(dist_1.enrollment, dist_2.enrollment)
  end

  def kindergarten_participation_rate_variation_of_enrollments(e1, e2)
    avg1 = kindergarten_participation_average(e1)
    avg2 = kindergarten_participation_average(e2)
    avg1 / avg2
  end

  def kindergarten_participation_average(e)
    sum   = e.kindergarten_participation_by_year.values.reduce(:+)
    count = e.kindergarten_participation_by_year.length
    sum / count
  end

  def kindergarten_participation_rate_variation_trend(d1_name, options)
    d2_name = options[:against]
    dist_1 = district_repository.find_by_name(d1_name)
    dist_2 = district_repository.find_by_name(d2_name)

    # rates_1 = dist_1.enrollment.kindergarten_participation_by_year
    # rates_2 = dist_2.enrollment.kindergarten_participation_by_year

    kindergarten_trend_for_enrollments(dist_1.enrollment, dist_2.enrollment)
  end

  def kindergarten_trend_for_enrollments(e1, e2)
    rates_1 = e1.kindergarten_participation_by_year
    rates_2 = e2.kindergarten_participation_by_year
    years = rates_1.keys & rates_2.keys

    year_rates_1 ={}
    years.each {|year| year_rates_1[year]=rates_1[year]}
    year_rates_2 ={}
    years.each {|year| year_rates_2[year]=rates_2[year]}
    # binding.pry
    trends = year_rates_1.merge(year_rates_2) do |year, av1, av2|
      av2/av1
     end
    # end

    trends.sort.to_h
  end
end
