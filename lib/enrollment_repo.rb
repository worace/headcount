require 'csv'
require 'pry'

class EnrollmentRepo

  def initialize
    @enrollments = []
    @name = {}
  end

  def load_data(data)
    loaded_data = CSV.open(data[:enrollment][:kindergarten], headers: true, header_converters: :symbol).reduce([]) do |array, row|
      # puts row.headers
      if @name[:name] == row[:location]
       @name[:kindergarten_participation][row[:timeframe]]= row[:data]
       array << @name
      else
        @name = {name: row[:location], kindergarten_participation:{row[:timeframe] => row[:data]}}
        array << @name
      end.uniq
    end

    loaded_data.each do |name|
      # puts @enrollments.inspect
      # puts name.inspect
      # binding.pry
      @enrollments << Enrollment.new(name)
    end
    #squize array into one year
    # Enrollment.new(name, data)
  end

  def find_by_name(name)
      @enrollments.find{|enrollment| enrollment.name == name}
  end
end
