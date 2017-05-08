require './lib/log_parser'

log_parser = LogParser.new

File.readlines('./resources/log.txt').each do |line|
    log_parser.parse_line line
end

puts
puts log_parser.top_three_url
puts
puts log_parser.status_code_count