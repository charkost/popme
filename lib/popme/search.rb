class Popme::Search
  attr_reader :results, :query

  URL = 'http://www.google.com/search?q='
  PARSE_REGEX = /<h3.*?><a href="\/url\?q=(.*?)\&sa.*?">(.*?)<\/a>.*?<cite.*?>(.*?)<\/cite>/imu
  RMTAG_REGEX = /<.*?>/

  SearchResult = Struct.new(:url, :title, :prev_url) do
    def to_s
      "\t#{title}\n" +
      "\t\033[4m#{prev_url}\033[0m\n\n"
    end
  end

  def initialize(query)
    @query = query
    @results = []
    parse_google_results
  end

  def to_s
    str = ''

    results.each_with_index do |result, index|
      str << "[#{index}]#{result}"
    end

    str
  end

  private

  def parse_google_results
    response.scan(PARSE_REGEX).map(&rm_tags).each do |result|
      @results << SearchResult.new(*result)
    end
  end

  def response
    Net::HTTP.get(request_uri).utf8_encode.unescape_html
  rescue => e
    puts "#{e.class}: #{e.message.strip}"
    ""
  end

  def request_uri
    URI("#{URL}#{query.uri_encode}")
  end

  def rm_tags
    Proc.new do |result|
      result.each { |attr| attr.gsub!(RMTAG_REGEX, '') }
    end
  end
end
