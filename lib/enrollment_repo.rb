require 'csv'
require 'pry'

class EnrollmentRepo

  def initialize
    @enrollments = []
    @name = {}
  end

  def load_data(data)
    loaded_data = CSV.open(data[:enrollment][:kindergarten], headers: true, header_converters: :symbol).reduce([]) do |array, row|
      if @name[:name] == row[:location]
       @name[:kindergarten_participation][row[:timeframe]]= row[:data]
       array << @name
      else
        @name = {name: row[:location], kindergarten_participation:{row[:timeframe] => row[:data]}}
        array << @name
      end.uniq
    end

    loaded_data.each do |name|
      @enrollments << Enrollment.new(name)
    end
  end

  def find_by_name(name)
      @enrollments.find{|enrollment| enrollment.name == name.upcase}
  end
end
