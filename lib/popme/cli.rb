require "thor"
require "launchy"

module Popme
  class CLI < Thor

    map "-l" => :list
    map "-h" => :help
    map "-b" => :backup

    def initialize(*args)
      super
      @storage = Popme::Storage.new
    end

    desc "pop list (-l)", "list of all stored sites and keys"
    def list
      @storage.print_list
    end

    desc "pop add [KEY] [VALUE]", "add a new site to the list"
    def add(key, value)
      @storage.add_site(key,value) if key && value
    end

    desc "pop help", "shows this help menu"
    def help
      puts '################# PopMe Help #################'
      puts ''
      puts 'pop list                view a list of all your key-sites'
      puts 'pop <key>               open the <value> for the selected <key> on browser'
      puts 'pop add <key> <value>   add a <key> => <value> pair to your list'
      puts 'pop rm <key>            removes <key> => <value> from list given key exists'
      puts 'pop backup              backups your list into an anonymous private gist'
      puts 'pop                     view this menu'
      puts 'all other documentation is located at:'
      puts ' https://github.com/eavgerinos/popme'
      puts ''
    end
    
    desc "open", "opens the given key if it exists"  
    def open(key)
      if site = @storage.find_site(key)
        Launchy.open(site)
      else
        puts "No such site"
      end
    end

    desc "rm [KEY]", "removes selected key if it exists" 
    def rm(key)
      @storage.remove_site(key)
    end

    desc "backup", "uploads ~/.popme file to a private anonymous gist"
    def backup
      @storage.backup
    end
  end
end