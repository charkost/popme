# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'popme/version'

Gem::Specification.new do |gem|
  gem.name          = "popme"
  gem.version       = Popme::VERSION
  gem.authors       = ["Angel Avgerinos"]
  gem.email         = ["evaggelos.avgerinos@gmail.com"]
  gem.description   = %q{Open sites in browser from terminal}
  gem.summary       = %q{Open sites in browser from terminal}
  gem.homepage      = "https://github.com/eavgerinos/popme"

  gem.add_dependency "launchy"
  gem.add_dependency "json"

  gem.files         = `git ls-files`.split($/)
  gem.executables   << "pop"
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
