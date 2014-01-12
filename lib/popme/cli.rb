class Popme::CLI < Thor
  map '-l' => :list
  map '-h' => :help
  map '-b' => :backup
  map '-s' => :search

  def initialize(*args)
    super
    @storage = Popme::Storage.new
  end

  desc 'pop list (-l)', 'list of all stored sites and keys'
  def list
    @storage.print_list
  end

  desc 'pop add [KEY] [VALUE]', 'add a new site to the list'
  def add(key, value)
    @storage.add_site(key,value) if key && value
  end

  desc 'pop help', 'shows this help menu'
  def help
    puts '################# PopMe Help #################'
    puts ''
    puts 'pop list                view a list of all your key-sites'
    puts 'pop <key>               open the <value> for the selected <key> on browser'
    puts 'pop <URL>               open the <URL> directly on browser'
    puts 'pop add <key> <value>   add a <key> => <value> pair to your list'
    puts 'pop rm <key>            removes <key> => <value> from list given key exists'
    puts 'pop backup              backups your list into an anonymous private gist'
    puts 'pop search <query>      searches google using the given query'
    puts 'pop                     view this menu'
    puts 'all other documentation is located at:'
    puts ' https://github.com/eavgerinos/popme'
    puts ''
  end

  desc 'open', 'opens the given key if it exists'
  def open(key)
    if site = @storage.find_site(key)
      Launchy.open(site)
    elsif Popme::Verification.url_exists?(key)
      Launchy.open(key)
    else
      puts 'No such website'
    end
  end

  desc 'rm [KEY]', 'removes selected key if it exists'
  def rm(key)
    @storage.remove_site(key)
  end

  desc 'backup', 'uploads ~/.popme file to a private anonymous gist'
  def backup
    @storage.backup
  end

  desc 'search [QUERY]', 'search for sites related with the given key using google'
  def search(*query)
    query = query.join(' ')
    search = Popme::Search.new(query)

    if search.results.any?
      pop_search_results(search)
    else
      puts 'No results'
    end
  end

  private

  def pop_search_results(search)
    puts search

    print 'Select a site or more using ',' to pop (default = 0): '
    begin
      indexes = STDIN.gets
    end until indexes

    indexes = '0' if indexes[0] == '\n'

    indexes.split(',').map(&:to_i).each do |index|
      if search.results[index]
        Launchy.open(search.results[index].url)
        sleep 0.1
      else
        puts 'No such search result index'
      end
    end
  end
end
