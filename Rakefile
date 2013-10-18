require "bundler/gem_tasks"
require 'rdoc/task'

require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
  t.ruby_opts = ["-w"]
  t.verbose = true
end

RDoc::Task.new :rdoc_dev do |rdoc|
  rdoc.main = "README.md"
  rdoc.rdoc_files.include("lib/   *.rb")
  rdoc.options << "--all"
end

task default: :test
