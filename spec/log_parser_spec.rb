require 'rspec'
require './lib/log_parser'

describe 'LogParser - Initialize' do
	it 'arrays should be empty' do
        log_parser = LogParser.new

        expect(log_parser.arr).to be_empty
	end
end # end-describe

describe 'LogParser - Method' do
    before(:each) do
        @log_parser = LogParser.new

        File.readlines('./resources/log.txt').each do |line|
            @log_parser.parse_line(line)
        end
    end

    it 'parse_line - arrays should not be empty after it' do
        expect(@log_parser.arr).not_to be_empty
	end

    it 'top_three_url - should return the top 3 URLs as a Hash' do
		expect(@log_parser.top_three_url.to_s).to eq '{"https://eagerhaystack.com"=>750, "https://surrealostrich.com.br"=>734, "https://grimpottery.net.br"=>732}'
	end

    it 'status_code_count_table - should return an Array with all status code and their count' do
		expect(@log_parser.status_code_count_table.to_s).to eq '[["204", 1388], ["201", 1402], ["200", 1417], ["500", 1428], ["400", 1440], ["503", 1451], ["404", 1474]]'
	end
end # end-describe