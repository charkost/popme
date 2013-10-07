require "net/http"
require "cgi"

module Popme
  class Search
    attr_reader :results

    SearchResult = Struct.new :url, :title, :prev_url

    def initialize(query)
      @results = parse_google_results(query)
    end

    def parse_google_results(query)
      results = []

      query = URI.encode(query)
      uri = URI("https://www.google.com/search?q=#{query}")
      resp = Net::HTTP.get(uri)

      resp = resp.force_encoding("ISO-8859-1").encode("UTF-8") unless resp.encoding == Encoding::UTF_8
      resp = CGI.unescapeHTML(resp)
      resp = CGI.unescape(resp)

      parse_regex = /<h3.*?><a href="\/url\?q=(.*?)\&sa.*?">(.*?)<\/a>.*?<cite.*?>(.*?)<\/cite>/imu
      resp.scan(parse_regex).each do |result|
        results << Popme::Search::SearchResult.new(result[0], result[1].gsub(/<.*?>/, ""),
                                                   result[2].gsub(/<.*?>/, ""))
      end

      results
    end

    def to_s
      str = ""

      @results.each_with_index do |result, index|
        str << "[#{index+1}]\t#{result.title}\n" #Index and title
        str << "\t\033[4m#{result.prev_url}\033[0m\n\n" #Preview url
      end

      str
    end
  end
end
