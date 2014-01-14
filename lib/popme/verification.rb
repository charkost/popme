module Popme::Verification
  def self.url_exists?(url)
    uri = URI(url.start_with?('http://') ? url : "http://#{url}")

    http = Net::HTTP.new(uri.host)
    http.open_timeout, http.read_timeout = [1, 1]

    header = http.start.head(uri.path[0] == '/' ? uri.path : '/')

    header.code == '200' || header.code[0] == '3' #200=OK, 3xx=Redirect
  rescue => e
    puts "#{e.class}: #{e.message.strip}"
    false
  end
end
