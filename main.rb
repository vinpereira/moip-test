require './lib/log_parser'

log_parser = LogParser.new

# Reading 'log.txt' and using log_parser to work with each line
File.readlines('./resources/log.txt').each do |line|
    log_parser.parse_line line
end

# Using puts just to better separated both methods in terminal
puts
log_parser.top_three_url
puts
log_parser.status_code_count_table