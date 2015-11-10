require 'CSV'

module Parser

  def self.get_names(filename)
    file = CSV.open(filename, headers: true, header_converters: :symbol)
    names = file.map do |line|
      line[:location]
    end
    names.uniq
  end

end
