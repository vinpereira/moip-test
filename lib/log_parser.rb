require 'terminal-table'

# Class to manipulate each log's line and get the top 3 URL and a count for the status code
class LogParser
    attr_reader :arr

    def initialize
        # a global empty array
        @arr = []
    end

    def parse_line(line)
        # create a empty Hash
        hash = {}

        # RegExp to find a URL within each log's line
        line_url = line.match(/(?<=request_to=\")(.)*(?=\"\sresponse_headers)/i).to_s
        # RegExp to find a Status Code within each log's line
        line_code = line.match(/(?<=response_status=\")(\d)*(?=\")/).to_s

        # Saving both URL and Status Code into the Hash
        hash = {
            url: line_url,
            code: line_code
        }

        # Pushing the Hash into the Array (Array of Hashes)
        @arr.push(hash) unless (line_url.nil? || line_url.empty?) && (line_code.nil? || line_code.empty?)
    end # end-method

    def top_three_url
        # Getting the top 3 URL as a Hash
        top_three = @arr.each_with_object(Hash.new(0)) { |h1, h2| h2[h1[:url]] += 1 }
                        .sort_by  { |k, v| v }
                        .reverse
                        .first(3)
                        .to_h

        puts "TOP 3 URLS IN WEBHOOKS LOG FILE"

        # Print them in 'key - value' format
        top_three.each { |key, value| puts "#{key} - #{value}" }

        # return the Hash
        top_three
    end # end-method

    def status_code_count_table
        # Getting an Array with every Status Code and the amount of times they repeat
        table = @arr.each_with_object(Hash.new(0)) { |h1, h2| h2[h1[:code]] += 1 }
                    .sort_by  { |k, v| v }
                    .to_a

        puts "STATUS CODE TABLE"

        # Using 'terminal-table' to print the Array
        puts Terminal::Table.new :headings => ['STATUS', 'COUNT'], 
                                 :rows => table

        # return the Array
        table
    end # end-method
end # end-class
