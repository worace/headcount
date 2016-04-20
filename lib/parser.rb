require 'csv'

module Parser

  def self.get_names(filename)
    file = CSV.open(filename, headers: true, header_converters: :symbol)
    names = file.map do |line|
      line[:location]
    end
    names.uniq
  end

  def self.parse2(info)
    @name = {}
    CSV.open(info[1], headers: true, header_converters: :symbol).reduce([]) do |array, row|
      # binding.pry
      if @name[:name] == row[:location]
       @name[:data][row[:timeframe].to_i]= row[:data].to_f.round(3)
       array << @name
      else
        # puts info[0]
        @name = {:name => row[:location], :data => {row[:timeframe].to_i => row[:data].to_f.round(3)}}
        array << @name
      end.uniq
    end
  end

  def self.parse(info)
    lines = CSV.open(info[1], headers: true, header_converters: :symbol).map do |row|
      {:name => row[:location], info[0] => {row[:timeframe].to_i => row[:data].to_f.round(3)} }
    end
    # @name = {}
    lines.reduce({}) do |hash, row|
        binding.pry
      if @hash[:hash] == row[:location]
       @hash[:data][row[:timeframe].to_i]= row[:data].to_f.round(3)
       array << @hash
      else
        @hash = {:hash => row[:location], :kindergarten => {row[:timeframe].to_i => row[:data].to_f.round(3)}}
        array << @hash
      end.uniq
    end
  end



end
