require "json"
require "net/http"

module Popme
  class Storage
    JSON_FILE = "#{ENV['HOME']}/.popme"

    def initialize
      @list = {}
      @bootstraped = false
      bootstrap
      populate
    end

    def bootstrap
      return if File.exists?(JSON_FILE)
      @bootstraped = true
      @list["google"] = "http://google.com"
      save
    end

    def populate
      unless @bootstraped
        JSON.parse(File.read(JSON_FILE)).each do |key, value|
          @list[key] = value
        end
      end
    end

    def save
      File.open(JSON_FILE, 'w') { |f| f.write(to_json) }
    end

    def to_json
      @list.to_json
    end

    def find_site(key)
      @list[key]
    end

    def print_list
      @list.each do |key, value|
        puts "#{key} => #{value}"
      end
    end

    def add_site(key, value)
      @list[key] = value
      save
    end

    def remove_site(key)
      if find_site(key)
        @list.delete(key)
        save
        puts "#{key} deleted."
      else
        puts "Key: #{key} does not exist."
      end
    end

    def backup
      payload = {
        'description' => "POPME backup",
        'public' => false,
        'files' => {
          'popme_backup.json' => {
          'content' => File.read(JSON_FILE) }}}

      uri = URI("https://api.github.com/gists")
      req = Net::HTTP::Post.new(uri.path)
      req.body = payload.to_json
      res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => true) do |http|
        verify_mode = OpenSSL::SSL::VERIFY_PEER
        http.request(req)
      end
      url = JSON.parse(res.body)
      puts "You backup is stored @ #{url['html_url']}"
    end
  end
end
