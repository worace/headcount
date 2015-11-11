class HeadcountAnalyst
  attr_reader :district_repository

  def initialize(dr)
    @district_repository = dr
  end

  def kindergarten_participation_rate_variation(d1_name, options)
    d2_name = options[:against]
    dist_1 = district_repository.find_by_name(d1_name)
    dist_2 = district_repository.find_by_name(d2_name)

    rates_1 = dist_1.enrollment.kindergarten_participation_by_year
    rates_2 = dist_2.enrollment.kindergarten_participation_by_year


    kindergarten_participation_rate_variation_of_enrollments(dist_1.enrollment, dist_2.enrollment)
    # {2015 => 0.5, 2014 => 0.25}
    # need to average the rates for each district
    # then compare first average to the second average
    # then get the ratio

  end

  def kindergarten_participation_rate_variation_of_enrollments(e1,e2)
    avg1 = e1.kindergarten_participation_by_year.values.reduce(:+) / e1.kindergarten_participation_by_year.length
    avg2 = e2.kindergarten_participation_by_year.values.reduce(:+) / e2.kindergarten_participation_by_year.length

    avg1 / avg2
  end
end
