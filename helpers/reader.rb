require 'csv'

# CSV reader module
module Reader
  def self.input(file_path)
    CSV.parse(File.read(file_path),
              headers: true,
              header_converters: ->(f) { f.strip },
              converters: ->(f) { f ? f.strip : nil }).map do |row|

      row = row.to_hash

      { quantity: row['Quantity'].to_i, product: row['Product'],
        price: row['Price'].to_f }
    end
  end
end
