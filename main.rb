# arr_url = []
arr = []

File.readlines('log.txt').each do |line|
    hash = {}
#   puts line

  line_url = line.match(/(?<=request_to=\")(.)*(?=\"\sresponse_headers)/i).to_s
#   arr_url.push(line_url) unless line_url.nil? || line_url.empty?

  line_code = line.match(/(?<=response_status=\")(\d)*(?=\")/).to_s

    hash = {
        url: line_url,
        code: line_code
    }

    arr.push(hash)
end

# puts arr_url.each_with_object(Hash.new(0)) { |o, h| h[o] += 1 }
#             .sort_by  { |k, v| v }
#             .reverse
#             .first(3)
#             .to_h

puts arr.each_with_object(Hash.new(0)) { |h1, h2| h2[h1[:url]] += 1 }
        .sort_by  { |k, v| v }
        .reverse
        .first(3)
        .to_h