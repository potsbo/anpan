require 'rake/testtask'
require './lib/anpan'
require './lib/conf'
require './lib/consonant'
require './lib/vowel'
require './lib/anpan_symbol'
require './lib/pattern'

desc 'Run test_unit based test'
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = Dir["test/**/*_test.rb"]
  t.verbose = true
end

task :render do
  puts Anpan.new(CONF).render
end

