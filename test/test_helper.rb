require "coveralls"
Coveralls.wear!

require "minitest/autorun"
require "popme/cli"
require "popme/storage"

module Popme
  class Storage
    JSON_FILE = "examples/data.json"
  end
end
