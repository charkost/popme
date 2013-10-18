require "net/http"

module Popme
  module Verification
    def self.url_exists?(url)
      begin
        uri = URI(url.start_with?("http://") ? url : "http://#{url}")

        http = Net::HTTP.new(uri.host)
        http.open_timeout, http.read_timeout = [1, 1]
  
        header = http.start.head(uri.path.start_with?("/") ? uri.path : "/")
      rescue Exception
        return false
      end

      return false unless header.code == "200" or header.code.start_with?("3") #200=OK, 3xx=Redirect
      true
    end
  end
end
