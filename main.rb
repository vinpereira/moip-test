arr_url = []

File.readlines('log.txt').each do |line|
#   puts line

  line_url = line.match(/(?<=request_to=\")(.)*(?=\"\sresponse_headers)/i).to_s
  arr_url.push(line_url) unless line_url.nil? || line_url.empty?
end

puts arr_url.each_with_object(Hash.new(0)) { |o, h| h[o] += 1 }
            .sort_by  { |k, v| v }
            .reverse
            .first(3)
            .to_h