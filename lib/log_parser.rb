require 'terminal-table'

class LogParser
    attr_reader :arr

    def initialize
        @arr = []
    end

    def parse_line(line)
        hash = {}

        line_url = line.match(/(?<=request_to=\")(.)*(?=\"\sresponse_headers)/i).to_s
        line_code = line.match(/(?<=response_status=\")(\d)*(?=\")/).to_s

        hash = {
            url: line_url,
            code: line_code
        }

        @arr.push(hash) unless (line_url.nil? || line_url.empty?) && (line_code.nil? || line_code.empty?)
    end # end-method

    def top_three_url
        top_three = @arr.each_with_object(Hash.new(0)) { |h1, h2| h2[h1[:url]] += 1 }
                        .sort_by  { |k, v| v }
                        .reverse
                        .first(3)
                        .to_h

        puts "TOP 3 URLS IN WEBHOOKS LOG FILE"

        top_three.each { |key, value| puts "#{key} - #{value}" }

        top_three
    end # end-method

    def status_code_count_table
        table = @arr.each_with_object(Hash.new(0)) { |h1, h2| h2[h1[:code]] += 1 }
                    .sort_by  { |k, v| v }
                    .to_a

        puts "STATUS CODE TABLE"

        puts Terminal::Table.new :headings => ['STATUS', 'COUNT'], 
                                 :rows => table

        table
    end # end-method
end # end-class
