require "test_helper"
require "popme/cli"
require "popme/storage"

describe Popme::CLI do

  HELP_MESSAGE = ["################# PopMe Help #################

pop list                view a list of all your key-sites
pop <key>               open the <value> for the selected <key> on browser
pop add <key> <value>   add a <key> => <value> pair to your list
pop rm <key>            removes <key> => <value> from list given key exists
pop                     view this menu
all other documentation is located at:
 https://github.com/eavgerinos/popme

", ""]
       
  LIST_MESSAGE = ""

  it "should print the correct help message" do
    cli = Popme::CLI.new
    out = capture_io do
      cli.help
    end
    out.must_equal HELP_MESSAGE
  end

end