require_relative 'controllers/receipts'

file_path = File.join(File.dirname(__FILE__), 'assets/inputs/*.csv')

Dir.glob(file_path).sort.each do |file|
  receipt = Receipts.new file
  receipt.invoke
end
