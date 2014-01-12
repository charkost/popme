require "coveralls"
Coveralls.wear!

require "minitest/autorun"
require "stringio"
require "popme"

module Popme
  class Storage
    JSON_FILE = "examples/data.json"
  end
end

module Launchy
  def self.open(key)
    true
  end
end
