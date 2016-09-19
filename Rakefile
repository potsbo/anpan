require 'rake/testtask'
require './lib/anpan'
require './lib/conf'
require './lib/consonant'
require './lib/vowel'
require './lib/anpan_symbol'
require './lib/pattern'

require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :render do
  puts Anpan.new(CONF).render
end

