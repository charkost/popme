require "net/http"
require "cgi"

module Popme
  class Search
    attr_reader :results

    URL = "http://www.google.com/search?q="
    PARSE_REGEX = /<h3.*?><a href="\/url\?q=(.*?)\&sa.*?">(.*?)<\/a>.*?<cite.*?>(.*?)<\/cite>/imu
    RMTAG_REGEX = /<.*?>/

    SearchResult = Struct.new :url, :title, :prev_url

    def initialize(query)
      @results = parse_google_results(query)
    end

    def parse_google_results(query)
      results = []

      query = URI.encode(query)
      uri = URI("#{URL}#{query}")
      
      resp = Net::HTTP.get(uri)
      resp = resp.force_encoding("ISO-8859-1").encode("UTF-8") unless resp.encoding == Encoding::UTF_8
      resp = CGI.unescapeHTML(resp)
      resp = CGI.unescape(resp)

      resp.scan(PARSE_REGEX).each do |result|
        results << Popme::Search::SearchResult.new(result[0], result[1].gsub(RMTAG_REGEX, ""),
                                                   result[2].gsub(RMTAG_REGEX, ""))
      end

      results
    end

    def to_s
      str = ""

      @results.each_with_index do |result, index|
        str << "[#{index}]\t#{result.title}\n" #Index and title
        str << "\t\033[4m#{result.prev_url}\033[0m\n\n" #Preview url
      end

      str
    end
  end
end
