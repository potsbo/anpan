require "rspec/core/rake_task"
require 'anpan'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :render do
  puts Anpan.new(CONF).render
end

