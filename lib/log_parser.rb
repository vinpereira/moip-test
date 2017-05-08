class LogParser

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
    end

    def top_three_url
        @arr.each_with_object(Hash.new(0)) { |h1, h2| h2[h1[:url]] += 1 }
            .sort_by  { |k, v| v }
            .reverse
            .first(3)
            .to_h
    end

    def status_code_count
        @arr.each_with_object(Hash.new(0)) { |h1, h2| h2[h1[:code]] += 1 }
            .sort_by  { |k, v| v }
            .to_h
    end 
end
