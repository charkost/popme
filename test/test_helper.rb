require "minitest/autorun"
require "popme/cli"
require "popme/storage"

require "coveralls"
Coveralls.wear!

module Popme
  class Storage
    JSON_FILE = "examples/data.json"
  end
end